#!/usr/bin/env python3
"""
Add a filled-in `prompt` key to every sample in train.json.

Usage:
    python -m open_r1.utils.build_prompts
"""

import json
import pathlib
from functools import lru_cache

from open_r1.prompts import sql_reasoning_prompt   # already defined by you

HERE      = pathlib.Path(__file__).resolve().parent          # .../utils
DATA_DIR  = HERE.parent / "data_processing"                  # .../data_processing
SQL_DIR   = DATA_DIR / "sql_files"
IN_FILE   = DATA_DIR / "train.json"
OUT_FILE  = DATA_DIR / "train_with_prompt.json"


@lru_cache(maxsize=None)
def load_schema(db_id: str) -> str:
    """Read `<db_id>.sql` from sql_files/ and return its text."""
    p = SQL_DIR / f"{db_id}.sql"
    if not p.exists():
        raise FileNotFoundError(f"schema file {p} not found")
    return p.read_text().strip()


def fill_prompt(schema: str, question: str, hint: str) -> str:
    """Plug values into the sql_reasoning_prompt template."""
    return sql_reasoning_prompt.format(
        DATABASE_SCHEMA=schema,
        QUESTION=question,
        HINT=hint,
    )


def main() -> None:
    samples = json.loads(IN_FILE.read_text())
    for sample in samples:
        schema   = load_schema(sample["db_id"])
        question = sample["question"]
        hint     = sample.get("evidence", "")   # your file calls it "evidence"

        sample["prompt"] = fill_prompt(schema, question, hint)
    OUT_FILE.write_text(json.dumps(samples, indent=2, ensure_ascii=False))
    print(f"Wrote {len(samples)} examples → {OUT_FILE.relative_to(HERE)}")


if __name__ == "__main__":
    main()
