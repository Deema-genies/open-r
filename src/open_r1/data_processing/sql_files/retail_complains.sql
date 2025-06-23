CREATE TABLE state (
    StateCode text PRIMARY KEY           -- Example: 'AL',
    State text                           -- Example: 'Alabama',
    Region text                          -- Example: 'South'
);

CREATE TABLE callcenterlogs (
    Date received date                   -- Example: '2017-03-27',
    Complaint ID text PRIMARY KEY        -- Example: 'Complaint ID',
    rand client text                     -- Example: 'rand client',
    phonefinal text                      -- Example: '977-806-9726',
    vru+line text                        -- Example: 'AA0103',
    call_id integer                      -- Example: 34536,
    priority integer                     -- Example: 0,
    type text                            -- Example: 'NW',
    outcome text                         -- Example: 'AGENT',
    server text                          -- Example: 'MICHAL',
    ser_start text                       -- Example: '13:34:11',
    ser_exit text                        -- Example: '13:40:23',
    ser_time text                        -- Example: '6.0',
    FOREIGN KEY (rand client) REFERENCES client(client_id)
);

CREATE TABLE client (
    client_id text PRIMARY KEY           -- Example: '1',
    sex text                             -- Example: 'Unknown',
    day integer                          -- Example: 0,
    month integer                        -- Example: 0,
    year integer                         -- Example: 0,
    age integer                          -- Example: 0,
    social text                          -- Example: 'N/A',
    first text                           -- Example: 'N/A',
    middle text                          -- Example: 'N/A',
    last text                            -- Example: 'N/A',
    phone text                           -- Example: 'N/A',
    email text                           -- Example: 'N/A',
    address_1 text                       -- Example: 'N/A',
    address_2 text                       -- Example: 'N/A',
    city text                            -- Example: 'N/A',
    state text                           -- Example: NULL,
    zipcode integer                      -- Example: 0,
    district_id integer                  -- Example: 1,
    FOREIGN KEY (district_id) REFERENCES district(district_id)
);

CREATE TABLE district (
    district_id integer PRIMARY KEY      -- Example: 1,
    city text                            -- Example: 'New York City',
    state_abbrev text                    -- Example: 'NY',
    division text                        -- Example: 'Northeast',
    FOREIGN KEY (state_abbrev) REFERENCES state(StateCode)
);

CREATE TABLE events (
    Date received date                   -- Example: 'Date received',
    Product text                         -- Example: 'Bank account or service',
    Sub-product text                     -- Example: 'Checking account',
    Issue text                           -- Example: 'Deposits and withdrawals',
    Sub-issue text                       -- Example: NULL,
    Consumer complaint narrative text    -- Example: 'Deposited a XXXX check into my account, BOFA is telling me i cant have my money ',
    Tags text                            -- Example: 'Older American',
    Consumer consent provided? text      -- Example: 'N/A',
    Submitted via text                   -- Example: 'Submitted via',
    Date sent to company text            -- Example: '2014-07-09',
    Company response to consumer text    -- Example: 'Closed with explanation',
    Timely response? text                -- Example: 'Yes',
    Consumer disputed? text              -- Example: 'No',
    Complaint ID text                    -- Example: 'CR0000072',
    Client_ID text                       -- Example: 'C00003714',
    PRIMARY KEY (Complaint ID, Client_ID),
    FOREIGN KEY (Client_ID) REFERENCES client(client_id),
    FOREIGN KEY (Complaint ID) REFERENCES callcenterlogs(Complaint ID)
);

CREATE TABLE reviews (
    Date date PRIMARY KEY                -- Example: '2013-02-04',
    Stars integer                        -- Example: 5,
    Reviews text                         -- Example: 'Great job, Eagle National! Each person was professional and helped us move throu',
    Product text                         -- Example: 'Eagle National Mortgage',
    district_id integer                  -- Example: 65,
    FOREIGN KEY (district_id) REFERENCES district(district_id)
);