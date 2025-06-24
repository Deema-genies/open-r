CREATE TABLE Attributes (
    attribute_id integer PRIMARY KEY     -- Example: 1,
    attribute_name text                  -- Example: 'Alcohol'
);

CREATE TABLE Categories (
    category_id integer PRIMARY KEY      -- Example: 1,
    category_name text                   -- Example: 'Active Life'
);

CREATE TABLE Compliments (
    compliment_id integer PRIMARY KEY    -- Example: 1,
    compliment_type text                 -- Example: 'photos'
);

CREATE TABLE Days (
    day_id integer PRIMARY KEY           -- Example: 1,
    day_of_week text                     -- Example: 'Sunday'
);

CREATE TABLE Years (
    year_id integer PRIMARY KEY          -- Example: 2005,
    actual_year integer                  -- Example: 2005
);

CREATE TABLE Business_Attributes (
    attribute_id integer                 -- Example: 1,
    business_id integer                  -- Example: 2,
    attribute_value text                 -- Example: 'none',
    PRIMARY KEY (attribute_id, business_id)
);

CREATE TABLE Business_Categories (
    business_id integer                  -- Example: 1,
    category_id integer                  -- Example: 8,
    PRIMARY KEY (business_id, category_id)
);

CREATE TABLE Business_Hours (
    business_id integer                  -- Example: 1,
    day_id integer                       -- Example: 2,
    opening_time text                    -- Example: '08:00:00',
    closing_time text                    -- Example: '16:00:00',
    PRIMARY KEY (business_id, day_id)
);

CREATE TABLE Checkins (
    business_id integer                  -- Example: 1,
    day_id integer                       -- Example: 1,
    label_time_0 text                    -- Example: 'None',
    label_time_1 text                    -- Example: 'None',
    label_time_2 text                    -- Example: 'None',
    label_time_3 text                    -- Example: 'None',
    label_time_4 text                    -- Example: 'None',
    label_time_5 text                    -- Example: 'None',
    label_time_6 text                    -- Example: 'None',
    label_time_7 text                    -- Example: 'None',
    label_time_8 text                    -- Example: 'None',
    label_time_9 text                    -- Example: 'Low',
    label_time_10 text                   -- Example: 'None',
    label_time_11 text                   -- Example: 'Low',
    label_time_12 text                   -- Example: 'None',
    label_time_13 text                   -- Example: 'None',
    label_time_14 text                   -- Example: 'None',
    label_time_15 text                   -- Example: 'None',
    label_time_16 text                   -- Example: 'None',
    label_time_17 text                   -- Example: 'Low',
    label_time_18 text                   -- Example: 'None',
    label_time_19 text                   -- Example: 'None',
    label_time_20 text                   -- Example: 'None',
    label_time_21 text                   -- Example: 'None',
    label_time_22 text                   -- Example: 'None',
    label_time_23 text                   -- Example: 'None',
    PRIMARY KEY (business_id, day_id)
);

CREATE TABLE Elite (
    user_id integer                      -- Example: 3,
    year_id integer                      -- Example: 2010,
    PRIMARY KEY (user_id, year_id)
);

CREATE TABLE Reviews (
    business_id integer                  -- Example: 1,
    user_id integer                      -- Example: 36129,
    review_stars integer                 -- Example: 2,
    review_votes_funny text              -- Example: 'None',
    review_votes_useful text             -- Example: 'None',
    review_votes_cool text               -- Example: 'None',
    review_length text                   -- Example: 'long',
    PRIMARY KEY (business_id, user_id)
);

CREATE TABLE Tips (
    business_id integer                  -- Example: 2,
    user_id integer                      -- Example: 12490,
    likes integer                        -- Example: 0,
    tip_length text                      -- Example: 'Medium',
    PRIMARY KEY (business_id, user_id)
);

CREATE TABLE Users_Compliments (
    compliment_id integer                -- Example: 1,
    user_id integer                      -- Example: 3,
    number_of_compliments text           -- Example: '0',
    PRIMARY KEY (compliment_id, user_id)
);

CREATE TABLE Business (
    business_id integer PRIMARY KEY      -- Example: 1,
    active text                          -- Example: 'true',
    city text                            -- Example: 'Phoenix',
    state text                           -- Example: 'AZ',
    stars real                           -- Example: 2.8,
    review_count text                    -- Example: 'Low'
);

CREATE TABLE Users (
    user_id integer PRIMARY KEY          -- Example: 1,
    user_yelping_since_year integer      -- Example: 2012,
    user_average_stars text              -- Example: '4.0',
    user_votes_funny text                -- Example: 'Low',
    user_votes_useful text               -- Example: 'Low',
    user_votes_cool text                 -- Example: 'Low',
    user_review_count text               -- Example: '0',
    user_fans text                       -- Example: 'Low'
);