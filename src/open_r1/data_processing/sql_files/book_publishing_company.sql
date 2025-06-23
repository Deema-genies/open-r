CREATE TABLE authors (
    au_id text PRIMARY KEY               -- Example: '172-32-1176',
    au_lname text                        -- Example: 'White',
    au_fname text                        -- Example: 'Johnson',
    phone text                           -- Example: '408 496-7223',
    address text                         -- Example: '10932 Bigge Rd.',
    city text                            -- Example: 'Menlo Park',
    state text                           -- Example: 'CA',
    zip text                             -- Example: '94025',
    contract text                        -- Example: '0'
);

CREATE TABLE jobs (
    job_id integer PRIMARY KEY           -- Example: 1,
    job_desc text                        -- Example: 'new hire - job not specified',
    min_lvl integer                      -- Example: 10,
    max_lvl integer                      -- Example: 10
);

CREATE TABLE publishers (
    pub_id text PRIMARY KEY              -- Example: '0736',
    pub_name text                        -- Example: 'New Moon Books',
    city text                            -- Example: 'Boston',
    state text                           -- Example: 'MA',
    country text                         -- Example: 'USA'
);

CREATE TABLE employee (
    emp_id text PRIMARY KEY              -- Example: 'A-C71970F',
    fname text                           -- Example: 'Aria',
    minit text                           -- Example: '',
    lname text                           -- Example: 'Cruz',
    job_id integer                       -- Example: 10,
    job_lvl integer                      -- Example: 87,
    pub_id text                          -- Example: '1389',
    hire_date datetime                   -- Example: '1991-10-26 00:00:00.0',
    FOREIGN KEY (pub_id) REFERENCES publishers(pub_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

CREATE TABLE pub_info (
    pub_id text PRIMARY KEY              -- Example: '0736',
    logo blob                            -- Example: '0x4749463839618B002F00B30F00000000800000008000808000000080800080008080808080C0C0',
    pr_info text                         -- Example: 'This is sample text data for Binnet & Hardley, publisher 0877 in the pubs databa',
    FOREIGN KEY (pub_id) REFERENCES publishers(pub_id)
);

CREATE TABLE stores (
    stor_id text PRIMARY KEY             -- Example: '6380',
    stor_name text                       -- Example: 'Eric the Read Books',
    stor_address text                    -- Example: '788 Catamaugus Ave.',
    city text                            -- Example: 'Seattle',
    state text                           -- Example: 'WA',
    zip text                             -- Example: '98056'
);

CREATE TABLE discounts (
    discounttype text                    -- Example: 'Initial Customer',
    stor_id text                         -- Example: '8042',
    lowqty integer                       -- Example: 100,
    highqty integer                      -- Example: 1000,
    discount real                        -- Example: 10.5,
    FOREIGN KEY (stor_id) REFERENCES stores(stor_id)
);

CREATE TABLE titles (
    title_id text PRIMARY KEY            -- Example: 'BU1032',
    title text                           -- Example: 'The Busy Executive's Database Guide',
    type text                            -- Example: 'business',
    pub_id text                          -- Example: '1389',
    price real                           -- Example: 19.99,
    advance real                         -- Example: 5000.0,
    royalty integer                      -- Example: 10,
    ytd_sales integer                    -- Example: 4095,
    notes text                           -- Example: 'An overview of available database systems with emphasis on common business appli',
    pubdate datetime                     -- Example: '1991-06-12 00:00:00.0',
    FOREIGN KEY (pub_id) REFERENCES publishers(pub_id)
);

CREATE TABLE roysched (
    title_id text                        -- Example: 'BU1032',
    lorange integer                      -- Example: 0,
    hirange integer                      -- Example: 5000,
    royalty integer                      -- Example: 10,
    FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

CREATE TABLE sales (
    stor_id text                         -- Example: '6380',
    ord_num text                         -- Example: '6871',
    ord_date datetime                    -- Example: '1994-09-14 00:00:00.0',
    qty integer                          -- Example: 5,
    payterms text                        -- Example: 'Net 60',
    title_id text                        -- Example: 'BU1032',
    PRIMARY KEY (stor_id, ord_num, title_id),
    FOREIGN KEY (title_id) REFERENCES titles(title_id),
    FOREIGN KEY (stor_id) REFERENCES stores(stor_id)
);

CREATE TABLE titleauthor (
    au_id text                           -- Example: '172-32-1176',
    title_id text                        -- Example: 'PS3333',
    au_ord integer                       -- Example: 1,
    royaltyper integer                   -- Example: 100,
    PRIMARY KEY (au_id, title_id),
    FOREIGN KEY (title_id) REFERENCES titles(title_id),
    FOREIGN KEY (au_id) REFERENCES authors(au_id)
);