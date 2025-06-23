STEP_REASONING_TEMPLATE = """

You are a SQL expert.
Tackling a text-to-SQL problem requires generating SQL commands to query the database and obtain all necessary information to answer the user's query.
Text-to-SQL problems can be complex and may require querying the database in multiple steps to gather enough context before producing the final SQL query.

You are provided with:

* A sequence of reasoning steps used to construct the final SQL.
* A golden ground truth SQL query (the correct solution).

At each step:

1. **Analyze the reasoning** – Is it logically sound, consistent with context, prior steps, and aligned with the golden ground truth query?
2. **Analyze the SQL** – Is the SQL syntax valid and aligned closely with the golden ground truth query in terms of logic and execution purpose?

At the end, evaluate whether the final SQL query **exactly matches or is logically equivalent to the golden ground truth query**, ensuring it directly solves the user’s problem.
The final SQL must be executable and meet all stated requirements.
Note: All problems are solvable with a SQL query. If the reasoning indicates the problem is unsolvable or the final query is invalid or does not align with the golden ground truth query, state it explicitly as incorrect.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### Input:

**User Query:**

```
{user_query}
```

**Context for the Query:**

```
{query_context}
```

**Golden Ground Truth Query:**

```sql
{golden_ground_truth_query}
```

**Reasoning Steps:**

```
{reasoning_trajectory}
```

**Final SQL Query:**

```sql
{sql_query}
```

---

### Task:

Evaluate the reasoning steps and final SQL query by grounding all evaluations against the provided golden ground truth SQL. Output your judgment in the following **strict JSON format**:

```json
{{
  "step_by_step_analysis": [
    {{
      "step_id": 1,
      "analyzing_reasoning": "Explain whether the reasoning is logically sound, consistent, and aligned with the golden ground truth query.",
      "reasoning_correctness": true | false,
      "analyzing_sql": "Explain whether the SQL is syntactically correct and closely matches the logic of the golden ground truth query.",
      "sql_correctness": true | false
    }},
    {{
      "step_id": 2,
      "analyzing_reasoning": "...",
      "reasoning_correctness": true | false,
      "analyzing_sql": "...",
      "sql_correctness": true | false
    }}
    // Add more steps as needed
  ],
  "overall_reasoning_analysis": "Summarize whether the sequence of reasoning coherently and accurately aligns with the golden ground truth query, leading to a valid and executable final SQL query that solves the user's request.",
  "final_query_correctness": true | false
}}
```

"""


REASONING_SQL_LLM_JUDGE_PROMPT = """
You are an experienced database expert. Your task is to evaluate a generated SQL query by comparing it to the ground truth (gold) query and then assign a score between 0.0 and 2.0. A higher score indicates the predicted query is more correct, while a score of 0.0 means it is completely incorrect.

Follow these evaluation rules strictly:

1. SELECT Clause:
   • Only select columns that are mentioned in the user’s question.
   • Do not include unnecessary columns or values.

2. Aggregation (MAX/MIN):
   • Always perform JOINs before applying MAX() or MIN().

3. ORDER BY with Distinct Values:
   • Use a GROUP BY <column> before an ORDER BY <column> ASC|DESC to ensure distinct values.

4. Handling NULLs:
   • If a column may contain NULL values (indicated by "None" in value examples or explicitly mentioned), include a JOIN or a WHERE <column> IS NOT NULL clause.

5. FROM/JOIN Clauses:
   • Only include the tables essential for answering the question.

6. Strictly Follow Hints:
   • Adhere to all hints provided with the question.

7. Thorough Question Analysis:
   • Ensure all conditions and requirements mentioned in the question are addressed.

8. DISTINCT Keyword:
   • Use SELECT DISTINCT when the question requires unique values (e.g., IDs, URLs) or when column statistics (Value Statics) indicate its necessity.

9. Column Selection:
   • Carefully analyze column descriptions and hints to choose the correct column when similar columns exist across tables.

10. String Concatenation:
   • Do not use any string concatenation methods (e.g., || ' ' ||) in the SELECT clause.

11. JOIN Preference:
   • Prefer using INNER JOIN over nested SELECT statements.

12. Date Processing:
   • Use STRFTIME() for any date manipulations (e.g., STRFTIME('%Y', SOMETIME) to extract the year).

You are provided with the following inputs:
• Question: {user_query}
• Hint: {hint}
• Gold Query: {golden_ground_truth_query}
• Predicted Query: {sql_query}

Based on the above, return a single numeric score between 0.0 and 2.0 that reflects how correct the predicted query is compared to the gold query. Respond with only the score and no additional explanation.
"""
