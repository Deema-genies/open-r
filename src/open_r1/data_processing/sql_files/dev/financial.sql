CREATE TABLE account (
    account_id integer PRIMARY KEY       -- Example: 1,
    district_id integer                  -- Example: 18,
    frequency text                       -- Example: 'POPLATEK MESICNE',
    date date                            -- Example: '1995-03-24',
    FOREIGN KEY (district_id) REFERENCES district(district_id)
);

CREATE TABLE card (
    card_id integer PRIMARY KEY          -- Example: 1,
    disp_id integer                      -- Example: 9,
    type text                            -- Example: 'gold',
    issued date                          -- Example: '1998-10-16',
    FOREIGN KEY (disp_id) REFERENCES disp(disp_id)
);

CREATE TABLE client (
    client_id integer PRIMARY KEY        -- Example: 1,
    gender text                          -- Example: 'F',
    birth_date date                      -- Example: '1970-12-13',
    district_id integer                  -- Example: 18,
    FOREIGN KEY (district_id) REFERENCES district(district_id)
);

CREATE TABLE disp (
    disp_id integer PRIMARY KEY          -- Example: 1,
    client_id integer                    -- Example: 1,
    account_id integer                   -- Example: 1,
    type text                            -- Example: 'OWNER',
    FOREIGN KEY (client_id) REFERENCES client(client_id),
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE district (
    district_id integer PRIMARY KEY      -- Example: 1,
    A2 text                              -- Example: 'Hl.m. Praha',
    A3 text                              -- Example: 'Prague',
    A4 text                              -- Example: '1204953',
    A5 text                              -- Example: '0',
    A6 text                              -- Example: '0',
    A7 text                              -- Example: '0',
    A8 integer                           -- Example: 1,
    A9 integer                           -- Example: 1,
    A10 real                             -- Example: 100.0,
    A11 integer                          -- Example: 12541,
    A12 real                             -- Example: 0.2,
    A13 real                             -- Example: 0.43,
    A14 integer                          -- Example: 167,
    A15 integer                          -- Example: 85677,
    A16 integer                          -- Example: 99107
);

CREATE TABLE loan (
    loan_id integer PRIMARY KEY          -- Example: 4959,
    account_id integer                   -- Example: 2,
    date date                            -- Example: '1994-01-05',
    amount integer                       -- Example: 80952,
    duration integer                     -- Example: 24,
    payments real                        -- Example: 3373.0,
    status text                          -- Example: 'A',
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE order (
    order_id integer PRIMARY KEY         -- Example: 29401,
    account_id integer                   -- Example: 1,
    bank_to text                         -- Example: 'YZ',
    account_to integer                   -- Example: 87144583,
    amount real                          -- Example: 2452.0,
    k_symbol text                        -- Example: 'SIPO',
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE trans (
    trans_id integer PRIMARY KEY         -- Example: 1,
    account_id integer                   -- Example: 1,
    date date                            -- Example: '1995-03-24',
    type text                            -- Example: 'PRIJEM',
    operation text                       -- Example: 'VKLAD',
    amount integer                       -- Example: 1000,
    balance integer                      -- Example: 1000,
    k_symbol text                        -- Example: 'SIPO',
    bank text                            -- Example: 'AB',
    account integer                      -- Example: 41403269,
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);