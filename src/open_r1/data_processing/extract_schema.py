#!/usr/bin/env python3
"""
generate_ddl_examples_nonnull.py
► Always shows a real (non-NULL) sample value per column.
"""

import requests
import json

import requests
import json, sys, textwrap
from pathlib import Path
from typing import Dict, List, Tuple, Any

_SQLTYPE_OK = {"integer","real","text","blob","date","datetime","numeric"}

def execute_sql(database_name, sql_query):
    url = "http://34.222.115.130:5000/execute"  # API endpoint
    payload = {
        "database_name": database_name,
        "sql_query": sql_query,
        "timeout_seconds": 10  # optional; default is 30 in the API
    }
    response = requests.post(url, json=payload)
    if response.status_code == 200:
        return response.json()['result']
    else:
        return f"Error {response.status_code}: {response.text}"
    
def norm_type(t:str)->str: return t.lower() if t.lower() in _SQLTYPE_OK else "text"

def col_groups(schema)->Dict[int,List[Tuple[int,str,str]]]:
    g={}
    for idx,(tbl,name) in enumerate(schema["column_names_original"]):
        if tbl==-1: continue
        g.setdefault(tbl,[]).append((idx,name,norm_type(schema["column_types"][idx])))
    return g

def nonnull_example(db_id:str, table:str, col:str):
    try:
        row = execute_sql(db_id, f'SELECT "{col}" FROM "{table}" WHERE "{col}" IS NOT NULL LIMIT 1;')
        if not row: return "NULL"
        val = row
        while type(val) == list:
            val = val[0]
        if "error" in str(val):
            print(f'{db_id}, {table}, {col}, {val}')
            # print(f"__________________________________________")
            # print(f"{val}")
            print(f"------------------------------------------")
        if val is None: return "NULL"
        if isinstance(val,str): return f"'{val[:80]}'"
        return str(val)
    except Exception as e:
        print(e)
        return "NULL"

def ddl(schema:Dict[str,Any])->str:
    tables=schema["table_names_original"]
    cols_by_tbl=col_groups(schema)
    pks,fks=schema["primary_keys"],schema["foreign_keys"]
    out=[]
    for t_idx,t_name in enumerate(tables):
        lines=[]
        for col_idx,col_name,col_type in cols_by_tbl.get(t_idx,[]):
            coldef=f'    {col_name} {col_type}'
            if col_idx in pks and not any(isinstance(pk,list) and col_idx in pk for pk in pks):
                coldef+=" PRIMARY KEY"
            ex=nonnull_example(schema["db_id"], t_name, col_name)
            lines.append(f"{coldef:<40} -- Example: {ex},")

        for pk in (pk for pk in pks if isinstance(pk,list)):
            if all(ci in (c[0] for c in cols_by_tbl[t_idx]) for ci in pk):
                cols=", ".join(f'{schema["column_names_original"][ci][1]}' for ci in pk)
                lines.append(f"    PRIMARY KEY ({cols}),")

        for col_idx,ref_idx in fks:
            if any(col_idx==c[0] for c in cols_by_tbl[t_idx]):
                col=schema["column_names_original"][col_idx][1]
                ref_tbl=schema["table_names_original"][schema["column_names_original"][ref_idx][0]]
                ref_col=schema["column_names_original"][ref_idx][1]
                lines.append(f'    FOREIGN KEY ({col}) REFERENCES {ref_tbl}({ref_col}),')

        if lines: lines[-1]=lines[-1].rstrip(',')
        out.append(f'CREATE TABLE {t_name} (\n'+"\n".join(lines)+"\n);")
    return "\n\n".join(out)

def main():
    if len(sys.argv) not in (2,3):
        print(textwrap.dedent("""\
            usage:
              python generate_ddl_examples_nonnull.py <schema.json> [db_id]
              • with db_id → prints one DDL to stdout
              • without    → writes <db_id>.sql for every DB in the file"""),file=sys.stderr)
        sys.exit(1)

    json_path=Path(sys.argv[1]).expanduser()
    objs=json.loads(json_path.read_text())
    if isinstance(objs,dict): objs=[objs]

    for schema in objs:
        sql_path= Path("sql_files/").with_suffix("").with_name(f"{schema['db_id']}.sql")
        sql_path.write_text(ddl(schema))
        print("wrote", sql_path)

if __name__=="__main__":
    main()
