from concurrent.futures import ThreadPoolExecutor, as_completed
import requests

TRUNCATE_SQL_OUT = 500

def execute_sql(database_name: str, sql_query: str, split: str = "train"):
    """
    Executes a SQL query on the given database by calling an API endpoint.

    Args:
        database_name (str): The name of the target database.
        sql_query     (str): The SQL query to execute.
        split         (str): Dataset split to run against (e.g. 'train', 'dev', 'test').

    Returns:
        tuple[str, str]: (possibly‑modified SQL query, API result or error message)
    """
    sql_query = sql_query.strip()
    if sql_query in ["", "N/A"]:
        return "N/A", "Query already solved"

    if ("limit" not in sql_query.lower()) and (sql_query.lower().startswith('select')):
        sql_query = sql_query.rstrip(" ;\n") + " limit 20"

    url = "http://34.222.115.130:5000/execute"
    payload = {
        "database_name":  database_name,
        "sql_query":      sql_query,
        "timeout_seconds": 15,
        "split":          split,
    }

    response = requests.post(url, json=payload)
    if response.status_code == 200:
        sql_out = str(response.json()["result"])
        if len(sql_out) > TRUNCATE_SQL_OUT:
            sql_out = sql_out[:TRUNCATE_SQL_OUT] + "...(truncated)..."
        return sql_query, sql_out
    else:
        return sql_query, f"Error {response.status_code}: {response.text}"


def process_sql_batches(
    db_names, sql_queries, *, batch_size: int = 4, split: str = "train"
):
    """
    Runs (db_name, sql_query) pairs in parallel batches.

    Args:
        db_names   (List[str]): Database names.
        sql_queries(List[str]): Corresponding SQL queries.
        batch_size        (int): Parallel workers per batch (default 4).
        split            (str) : Dataset split propagated to `execute_sql`.

    Returns:
        List[Tuple[str, str]]: Results in the original order.
    """
    if len(db_names) != len(sql_queries):
        raise ValueError("db_names and sql_queries must have the same length")

    results = {}
    total = len(db_names)

    for i in range(0, total, batch_size):
        batch_db  = db_names[i : i + batch_size]
        batch_sql = sql_queries[i : i + batch_size]

        with ThreadPoolExecutor(max_workers=batch_size) as executor:
            future_to_key = {
                executor.submit(execute_sql, db, sql, split): (db, sql)
                for db, sql in zip(batch_db, batch_sql)
            }

            for future in as_completed(future_to_key):
                db, sql = future_to_key[future]
                try:
                    results[(db, sql)] = future.result()
                except Exception as exc:
                    results[(db, sql)] = (sql, f"Error executing on {db}: {exc}")

    # Preserve original ordering
    return [results[(db, sql)] for db, sql in zip(db_names, sql_queries)]
