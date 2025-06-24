import os
import json
import argparse
import asyncio
from tqdm.asyncio import tqdm_asyncio
from openai import AsyncOpenAI
from open_r1.judge_prompts import REASONING_SQL_LLM_JUDGE_PROMPT


# Be sure to install the OpenAI Python library (>=0.27.0) that includes AsyncOpenAI:
# pip install openai

# OPENAI_API_KEY = '#####'
# os.environ["OPENAI_API_KEY"] = OPENAI_API_KEY

async def call_openai_eval_async(
    user_query: str,
    query_context: str,
    hint: str,
    reasoning_trajectory: str,
    sql_query: str,
    golden_ground_truth_query:str,
    client: AsyncOpenAI,
    model_name: str = "gpt-4.1-mini",
    temperature: float = 0.0,
    max_tokens: int = 1024,
) -> str:
    """
    Formats the STEP_REASONING_TEMPLATE and sends it to OpenAI asynchronously.
    Expects a JSON‐formatted response (using `response_format={"type":"json_object"}`).
    Returns the raw JSON string from the model.
    """
    # prompt = STEP_REASONING_TEMPLATE.format(
    #     user_query=user_query,
    #     query_context=query_context,
    #     reasoning_trajectory=reasoning_trajectory,
    #     sql_query=sql_query,
    #     golden_ground_truth_query=golden_ground_truth_query
    # )

    prompt = REASONING_SQL_LLM_JUDGE_PROMPT.format(
        user_query=user_query,
        hint=hint,
        # reasoning_trajectory=reasoning_trajectory,
        sql_query=sql_query,
        golden_ground_truth_query=golden_ground_truth_query
    )
    # Call AsyncOpenAI
    # We request `response_format={"type": "json_object"}` so the model returns JSON 
    resp = await client.chat.completions.create(
        model=model_name,
        messages=[{"role": "user", "content": prompt}],
        # response_format={"type": "json_object"},
        temperature=temperature,
        max_tokens=max_tokens,
    )
    return resp.choices[0].message.content


async def process_openai_batches_async(
    user_queries,
    # query_contexts,
    hint,
    # reasoning_trajectories,
    sql_queries,
    golden_ground_truth_query,
    *,
    model_name: str = "gemini-2.0-flash",
    batch_size: int = 16,
    temperature: float = 0.0,
    max_tokens: int = 1536,
):
    """
    Asynchronously runs the eval prompt (STEP_REASONING_TEMPLATE) on all provided examples,
    respecting a maximum of `batch_size` concurrent OpenAI requests.

    Args:
        user_queries           (List[str]): List of user queries.
        query_contexts         (List[str]): List of corresponding query contexts.
        reasoning_trajectories (List[str]): List of reasoning trajectories.
        sql_queries            (List[str]): List of final SQL queries to evaluate.
        model_name            (str): OpenAI model to use (default "gpt-4").
        batch_size             (int): Max concurrent OpenAI requests (default 4).
        temperature           (float): Sampling temperature for OpenAI (default 0).
        max_tokens            (int): Max tokens to request from OpenAI (default 1024).

    Returns:
        List[str]: The JSON‐formatted string responses from OpenAI, 
                   in the same order as the inputs.
    """
    n = len(user_queries)
    # if not (len(query_contexts) == n and len(reasoning_trajectories) == n and len(sql_queries) == n):
    #     raise ValueError("All input lists must have the same length")

    sem = asyncio.Semaphore(batch_size)
    client = AsyncOpenAI(base_url="https://generativelanguage.googleapis.com/v1beta/openai/", api_key="AIzaSyCiyMzTxXzTD-M0eiMmR6Mn5m7TYelhbN4")  # Create one AsyncOpenAI client for all tasks

    results = [None] * n  # Pre-allocate list to store results

    async def _worker(idx: int):
        """Acquire semaphore, call OpenAI, release semaphore, and store result."""
        async with sem:
            # try:
                resp = await call_openai_eval_async(
                    user_queries[idx],
                    None,
                    # query_contexts[idx],
                    # reasoning_trajectories[idx],
                    hint[idx],
                    None,
                    sql_queries[idx],
                    golden_ground_truth_query[idx],
                    client,
                    model_name,
                    temperature,
                    max_tokens,
                )
                results[idx] = resp
            # except Exception as e:
            #     results[idx] = f"Error at index {idx}: {e}"

    # Schedule all tasks
    tasks = [_worker(i) for i in range(n)]

    for coro in asyncio.as_completed(tasks):
        await coro

    return results

