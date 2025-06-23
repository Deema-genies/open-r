CREATE TABLE customer (
    c_custkey integer PRIMARY KEY        -- Example: 1,
    c_mktsegment text                    -- Example: 'BUILDING',
    c_nationkey integer                  -- Example: 8,
    c_name text                          -- Example: 'Customer#000000001',
    c_address text                       -- Example: 'KwX3hMHjZ6',
    c_phone text                         -- Example: '937-241-3198',
    c_acctbal real                       -- Example: 3560.03,
    c_comment text                       -- Example: 'ironic excuses detect slyly silent requests. requests according to the exc',
    FOREIGN KEY (c_nationkey) REFERENCES nation(n_nationkey)
);

CREATE TABLE lineitem (
    l_shipdate date                      -- Example: '1993-11-24',
    l_orderkey integer                   -- Example: 1,
    l_discount real                      -- Example: 0.0,
    l_extendedprice real                 -- Example: 58303.08,
    l_suppkey integer                    -- Example: 1,
    l_quantity integer                   -- Example: 33,
    l_returnflag text                    -- Example: 'A',
    l_partkey integer                    -- Example: 1,
    l_linestatus text                    -- Example: 'O',
    l_tax real                           -- Example: 0.06,
    l_commitdate date                    -- Example: '1995-07-12',
    l_receiptdate date                   -- Example: '1995-09-14',
    l_shipmode text                      -- Example: 'AIR',
    l_linenumber integer                 -- Example: 1,
    l_shipinstruct text                  -- Example: 'NONE',
    l_comment text                       -- Example: 'carefully bo',
    PRIMARY KEY (l_orderkey, l_linenumber),
    FOREIGN KEY (l_partkey) REFERENCES partsupp(ps_partkey),
    FOREIGN KEY (l_suppkey) REFERENCES partsupp(ps_suppkey),
    FOREIGN KEY (l_orderkey) REFERENCES orders(o_orderkey)
);

CREATE TABLE nation (
    n_nationkey integer PRIMARY KEY      -- Example: 0,
    n_name text                          -- Example: 'ALGERIA',
    n_regionkey integer                  -- Example: 0,
    n_comment text                       -- Example: 'slyly express pinto beans cajole idly. deposits use blithely unusual packages? f',
    FOREIGN KEY (n_regionkey) REFERENCES region(r_regionkey)
);

CREATE TABLE orders (
    o_orderdate date                     -- Example: '1995-04-19',
    o_orderkey integer PRIMARY KEY       -- Example: 1,
    o_custkey integer                    -- Example: 73100,
    o_orderpriority text                 -- Example: '4-NOT SPECIFIED',
    o_shippriority integer               -- Example: 0,
    o_clerk text                         -- Example: 'Clerk#000000916',
    o_orderstatus text                   -- Example: 'P',
    o_totalprice real                    -- Example: 203198.56,
    o_comment text                       -- Example: 'final packages sleep blithely packa',
    FOREIGN KEY (o_custkey) REFERENCES customer(c_custkey)
);

CREATE TABLE part (
    p_partkey integer PRIMARY KEY        -- Example: 1,
    p_type text                          -- Example: 'LARGE PLATED TIN',
    p_size integer                       -- Example: 31,
    p_brand text                         -- Example: 'Brand#43',
    p_name text                          -- Example: 'almond almond antique snow goldenrod',
    p_container text                     -- Example: 'LG BAG',
    p_mfgr text                          -- Example: 'Manufacturer#4',
    p_retailprice real                   -- Example: 901.0,
    p_comment text                       -- Example: 'blithely busy reque'
);

CREATE TABLE partsupp (
    ps_partkey integer                   -- Example: 1,
    ps_suppkey integer                   -- Example: 1,
    ps_supplycost real                   -- Example: 1.0,
    ps_availqty integer                  -- Example: 1111,
    ps_comment text                      -- Example: 'carefully ironic deposits use against the carefully unusual accounts. slyly sile',
    PRIMARY KEY (ps_partkey, ps_suppkey),
    FOREIGN KEY (ps_suppkey) REFERENCES supplier(s_suppkey),
    FOREIGN KEY (ps_partkey) REFERENCES part(p_partkey)
);

CREATE TABLE region (
    r_regionkey integer PRIMARY KEY      -- Example: 0,
    r_name text                          -- Example: 'AFRICA',
    r_comment text                       -- Example: 'asymptotes sublate after the r'
);

CREATE TABLE supplier (
    s_suppkey integer PRIMARY KEY        -- Example: 1,
    s_nationkey integer                  -- Example: 13,
    s_comment text                       -- Example: 'blithely final pearls are. instructions thra',
    s_name text                          -- Example: 'Supplier000000001',
    s_address text                       -- Example: ',wWs4pnykQOFl8mgVCU8EZMXqZs1w',
    s_phone text                         -- Example: '800-807-9579',
    s_acctbal real                       -- Example: 3082.86,
    FOREIGN KEY (s_nationkey) REFERENCES nation(n_nationkey)
);