"""
- Execution accuracy reward
- LLM-as-a-judge reward (only for zero execution accuracy)
- Syntax check reward
- Schema linking reward
- N-gram similarity reward
- Format reward
"""
# Copyright 2025 The HuggingFace Team. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import re
from dataclasses import dataclass, field
from nltk.util import ngrams
import asyncio

from trl import ScriptArguments
import json
from sql_helper import process_sql_batches
from openai_helper import process_openai_batches_async
# from llm_judge_helper import LLMJudgeHelper

def get_ngram(string, N=2):
    words = string.split()
    all_grams = []
    for i in range(2,N+1):
        all_grams.extend(list(ngrams(words,i)))

    return set(all_grams)

def extract_json(string):
    json_str = string.split('```json')[-1]
    json_str = json_str[:json_str.rfind('```')]
    json_ = json.loads(json_str)
    return json_

@dataclass
class GRPOScriptArguments(ScriptArguments):
    """
    Script arguments for the GRPO training script.

    Args:
        reward_funcs (`list[str]`):
            List of reward functions. Possible values: 'accuracy', 'format'.
    """

    reward_funcs: list[str] = field(
        default_factory=lambda: ["judge", "accuracy", "format", "ngrams-iou", "schema-iou", "syntax"],
        metadata={"help": "List of reward functions. Possible values: 'judge', 'accuracy', 'format', 'ngrams-iou', 'schema-iou', 'syntax'"},
    )

def precision_recall(gt_out, gen_out):
    
    gt_entities = gt_out.split(',')
    gt_entities = {x.replace('[','').replace(']','').strip() for x in gt_entities}
    
    gen_entities = gen_out.split(',')
    gen_entities = {x.replace('[','').replace(']','').strip() for x in gen_entities}

    intersection = len(gt_entities.intersection(gen_entities))
    N_GT = len(gt_entities) + 0.0001
    N_GEN = len(gen_entities) + 0.0001
    precision = intersection/N_GEN
    recall = intersection/N_GT
    return precision, recall

def fetch_completion_trunc(completion):
    completion_truncated = completion[:completion.find('Query already solved')]
    completion_truncated = completion_truncated[completion_truncated.find('{'):completion_truncated.rfind('\nuser')]
    return completion_truncated


##############################################################
## REWARD_FUNCTIONS START HERE
##############################################################
JUDGE_REWARD_WEIGHT = 2.0
ACCURACY_REWARD_WEIGHT = 3.0
FORMAT_REWARD_WEIGHT = 1.0
SCHEMA_REWARD_WEIGHT = 1.0
NGRAM_REWARD_WEIGHT = 1.0
SYNTAX_REWARD_WEIGHT = 1.0


def judge_reward(completions, question, SQL, evidence, **kwargs):
    ex_r = accuracy_reward(completions,  question, SQL, evidence, **kwargs)
    contents = [completion[0]["content"] for completion in completions]
    final_sql = [x.split("```sql")[-1].split('```')[0] for x in contents]
    responses = asyncio.run( process_openai_batches_async(
        user_queries=question,
        # query_contexts=context,
        # reasoning_trajectories=contents,
        sql_queries=final_sql,
        golden_ground_truth_query=SQL,
        hint=evidence
    ))
    rewards = []
    for response, ex in zip(responses, ex_r):
        try:
            intermediate_rewards = json.loads(response)
            if type(intermediate_rewards) == int or type(intermediate_rewards) == float:
                overall_reward = intermediate_rewards
            else:
                overall_reward = int(intermediate_rewards['score'])
            reward_score = (overall_reward)
            rewards.append(JUDGE_REWARD_WEIGHT * reward_score if ex == 0 else 0)
        except Exception as e:
            print("Error while reward computation",e)
            print(response)
            rewards.append(0.2)
    
    return rewards

def accuracy_reward(completions, question, SQL, evidence, db_id, **kwargs):
    
    """
    ## Reward - 
    ### keyword matching table, column and value names for final query
    ### At least 2 steps
    ### Follow the response format properly
    ### (FUTURE) EXECUTION RESULT OF FINAL QUERY MATCHES RESPONSE
    ### INTERMEDIATE REWARD IN STEPS - keyword matching table, column and value names, execution errors
    ### Some python function to check if sql query is syntactically correct without execution? -> for intermediate steps
    ### Total thought length is under 500 words
    ### SQLite syntax checker
    """
    contents = [completion[0]["content"] for completion in completions]
    generated_sqls = []
    gt_sqls = []
    dbs = db_id
    for content, solution, db in zip(contents, SQL, db_id):
        generated_sql = 'N/A'
        while(generated_sql=='N/A'): 
            generated_sql = content.split('```sql')[-1].split('```')[0].strip()
            content = content[:content.rfind('```sql')]
        generated_sqls.append(generated_sql)
        gt_sqls.append(solution)
        
    exec_out_generated = process_sql_batches(dbs, generated_sqls)
    exec_out_generated = list(map(lambda x:x[1],exec_out_generated))
    exec_out_gt = process_sql_batches(dbs, gt_sqls)
    exec_out_gt = list(map(lambda x:x[1],exec_out_gt))

    rewards = []
    for i in range(len(contents)):
        if 'error' in exec_out_generated[i]:
            rewards.append(0)
        elif len(exec_out_generated[i])==0:
            rewards.append(0)
        elif exec_out_generated[i] == exec_out_gt[i]:
            rewards.append(ACCURACY_REWARD_WEIGHT * 1)
        else:
            rewards.append(0)
    return rewards
        

def ngrams_iou_reward(completions, SQL, **kwargs):
    
    """
    ## Reward - 
    ### keyword matching table, column and value names for final query
    ### At least 2 steps
    ### Follow the response format properly
    ### (FUTURE) EXECUTION RESULT OF FINAL QUERY MATCHES RESPONSE
    ### INTERMEDIATE REWARD IN STEPS - keyword matching table, column and value names, execution errors
    ### Some python function to check if sql query is syntactically correct without execution? -> for intermediate steps
    ### Total thought length is under 500 words
    ### SQLite syntax checker
    """

    contents = [completion[0]["content"] for completion in completions]
    rewards = []
    for content, solution in zip(contents, SQL):
        generated_sql = 'N/A'
        while(generated_sql=='N/A'): 
            generated_sql = content.split('```sql')[-1].split('```')[0].strip()
            content = content[:content.rfind('```sql')]
        ngram_solution = get_ngram(solution)
        ngram_completion = get_ngram(generated_sql)

        intersection = len(ngram_solution.intersection(ngram_completion))
        union = len(ngram_solution.union(ngram_completion)) + 0.0001

        rewards.append(NGRAM_REWARD_WEIGHT * (intersection/union))
    return rewards

def keywords_iou_reward(completions, SQL, **kwargs):
    
    """
    ## Reward - 
    ### keyword matching table, column and value names for final query
    ### At least 2 steps
    ### Follow the response format properly
    ### (FUTURE) EXECUTION RESULT OF FINAL QUERY MATCHES RESPONSE
    ### INTERMEDIATE REWARD IN STEPS - keyword matching table, column and value names, execution errors
    ### Some python function to check if sql query is syntactically correct without execution? -> for intermediate steps
    ### Total thought length is under 500 words
    ### SQLite syntax checker
    """

    contents = [completion[0]["content"] for completion in completions]
    rewards = []
    for content, solution in zip(contents, SQL):
        generated_sql = 'N/A'
        while(generated_sql=='N/A'): 
            generated_sql = content.split('```sql')[-1].split('```')[0].strip()
            content = content[:content.rfind('```sql')]

        keywords_solution = set(filter(lambda x: x.islower() or x.isnumeric(),re.split(r'[^a-zA-Z0-9_]', solution)))
        keywords_completions = set(filter(lambda x: x.islower() or x.isnumeric(),re.split(r'[^a-zA-Z0-9_]', generated_sql)))
        intersection = len(keywords_solution.intersection(keywords_completions))
        union = len(keywords_solution.union(keywords_completions)) + 0.0001

        rewards.append(SCHEMA_REWARD_WEIGHT* (intersection/union))
    return rewards
    
def format_reward(completions, **kwargs):
    ## All step has correct json
    
    contents = [completion[0]["content"].strip() for completion in completions]
    rewards = []
    for content in contents:
        steps = content.split('\nuser\n') #TODO: check if this is correct Single step, if the tags are correct
        reward = []
        for step in steps:
            try:
                json_ = extract_json(step) #TODO: check if this is correct
                assert "reasoning" in json_
                assert "task" in json_
                assert "sql" in json_
                reward.append(1)
            except:
                reward.append(0)
        rewards.append(SYNTAX_REWARD_WEIGHT * (sum(reward)/len(reward)))
    return rewards

def length_reward(completions, **kwargs):

    contents = [completion[0]["content"].strip() for completion in completions]
    rewards = []
    for content in contents:
        nsteps = 0
        try:
            json_ = extract_json(content)
            assert "reasoning" in json_
            assert "task" in json_
            assert "sql" in json_
            assert 'n/a' not in json_['sql'].lower()
            nsteps+= 1
        except:
            pass
        if nsteps>=4:
            rewards.append(1)
        else:
            rewards.append(nsteps/4)
    return rewards
        

def syntax_reward(completions, db_id, SQL, **kwargs):
    contents = [completion[0]["content"] for completion in completions]
    generated_sqls = []
    gt_sqls = []
    dbs = db_id
    for content, solution, db in zip(contents, SQL, db_id):
        generated_sql = 'N/A'
        while(generated_sql=='N/A'): 
            generated_sql = content.split('```sql')[-1].split('```')[0].strip()
            content = content[:content.rfind('```sql')]
        generated_sqls.append(generated_sql)
        gt_sqls.append(solution)
        
    exec_out_generated = process_sql_batches(dbs, generated_sqls)
    exec_out_generated = list(map(lambda x:x[1],exec_out_generated))
    exec_out_gt = process_sql_batches(dbs, gt_sqls)
    exec_out_gt = list(map(lambda x:x[1],exec_out_gt))

    rewards = []
    for i in range(len(contents)):
        if 'error' in exec_out_generated[i]:
            rewards.append(0)
        else:
            rewards.append(SYNTAX_REWARD_WEIGHT * 1)
    return rewards

reward_funcs_registry = {
    "judge": judge_reward,
    "accuracy": accuracy_reward,
    "format": format_reward,
    "ngrams-iou": ngrams_iou_reward,
    "schema-iou": keywords_iou_reward,
    "syntax": syntax_reward,
}


##############################################################
## REWARD_FUNCTIONS END HERE
##############################################################

def get_reward_funcs(script_args):
    REWARD_FUNCS_REGISTRY = {
        "judge": judge_reward,
        "accuracy": accuracy_reward,
        "format": format_reward,
        "ngrams-iou": ngrams_iou_reward,
        "schema-iou": keywords_iou_reward,
        "syntax": syntax_reward,
    }
    reward_funcs = [REWARD_FUNCS_REGISTRY[func] for func in script_args.reward_funcs]

    return reward_funcs