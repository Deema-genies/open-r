CREATE TABLE event (
    event_id text PRIMARY KEY            -- Example: 'rec0Si5cQ4rJRVzd6',
    event_name text                      -- Example: 'March Meeting',
    event_date text                      -- Example: '2020-03-10T12:00:00',
    type text                            -- Example: 'Meeting',
    notes text                           -- Example: 'All active members can vote for new officers between 4pm-8pm.',
    location text                        -- Example: 'MU 215',
    status text                          -- Example: 'Open'
);

CREATE TABLE major (
    major_id text PRIMARY KEY            -- Example: 'rec06DF6vZ1CyPKpc',
    major_name text                      -- Example: 'Outdoor Product Design and Development',
    department text                      -- Example: 'School of Applied Sciences, Technology and Education',
    college text                         -- Example: 'College of Agriculture and Applied Sciences'
);

CREATE TABLE zip_code (
    zip_code integer PRIMARY KEY         -- Example: 501,
    type text                            -- Example: 'Unique',
    city text                            -- Example: 'Holtsville',
    county text                          -- Example: 'Suffolk County',
    state text                           -- Example: 'New York',
    short_state text                     -- Example: 'NY'
);

CREATE TABLE attendance (
    link_to_event text                   -- Example: 'rec2N69DMcrqN9PJC',
    link_to_member text                  -- Example: 'recD078PnS3x2doBe',
    PRIMARY KEY (link_to_event, link_to_member),
    FOREIGN KEY (link_to_member) REFERENCES member(member_id),
    FOREIGN KEY (link_to_event) REFERENCES event(event_id)
);

CREATE TABLE budget (
    budget_id text PRIMARY KEY           -- Example: 'rec0QmEc3cSQFQ6V2',
    category text                        -- Example: 'Advertisement',
    spent real                           -- Example: 67.81,
    remaining real                       -- Example: 7.19,
    amount integer                       -- Example: 75,
    event_status text                    -- Example: 'Closed',
    link_to_event text                   -- Example: 'recI43CzsZ0Q625ma',
    FOREIGN KEY (link_to_event) REFERENCES event(event_id)
);

CREATE TABLE expense (
    expense_id text PRIMARY KEY          -- Example: 'rec017x6R3hQqkLAo',
    expense_description text             -- Example: 'Post Cards, Posters',
    expense_date text                    -- Example: '2019-08-20',
    cost real                            -- Example: 122.06,
    approved text                        -- Example: 'true',
    link_to_member text                  -- Example: 'rec4BLdZHS2Blfp4v',
    link_to_budget text                  -- Example: 'recvKTAWAFKkVNnXQ',
    FOREIGN KEY (link_to_member) REFERENCES member(member_id),
    FOREIGN KEY (link_to_budget) REFERENCES budget(budget_id)
);

CREATE TABLE income (
    income_id text PRIMARY KEY           -- Example: 'rec0s9ZrO15zhzUeE',
    date_received text                   -- Example: '2019-10-17',
    amount integer                       -- Example: 50,
    source text                          -- Example: 'Dues',
    notes text                           -- Example: 'Secured donations to help pay for speaker gifts.',
    link_to_member text                  -- Example: 'reccW7q1KkhSKZsea',
    FOREIGN KEY (link_to_member) REFERENCES member(member_id)
);

CREATE TABLE member (
    member_id text PRIMARY KEY           -- Example: 'rec1x5zBFIqoOuPW8',
    first_name text                      -- Example: 'Angela',
    last_name text                       -- Example: 'Sanders',
    email text                           -- Example: 'angela.sanders@lpu.edu',
    position text                        -- Example: 'Member',
    t_shirt_size text                    -- Example: 'Medium',
    phone text                           -- Example: '(651) 928-4507',
    zip integer                          -- Example: 55108,
    link_to_major text                   -- Example: 'recxK3MHQFbR9J5uO',
    FOREIGN KEY (zip) REFERENCES zip_code(zip_code),
    FOREIGN KEY (link_to_major) REFERENCES major(major_id)
);