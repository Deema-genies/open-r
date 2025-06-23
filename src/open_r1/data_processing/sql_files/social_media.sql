CREATE TABLE location (
    LocationID integer PRIMARY KEY       -- Example: 1,
    Country text                         -- Example: 'Albania',
    State text                           -- Example: 'Elbasan',
    StateCode text                       -- Example: 'AL',
    City text                            -- Example: 'Elbasan'
);

CREATE TABLE user (
    UserID text PRIMARY KEY              -- Example: 'nknow531394',
    Gender text                          -- Example: 'Male'
);

CREATE TABLE twitter (
    TweetID text PRIMARY KEY             -- Example: 'tw-682712873332805633',
    Weekday text                         -- Example: 'Thursday',
    Hour integer                         -- Example: 17,
    Day integer                          -- Example: 31,
    Lang text                            -- Example: 'en',
    IsReshare text                       -- Example: 'FALSE',
    Reach integer                        -- Example: 44,
    RetweetCount integer                 -- Example: 0,
    Likes integer                        -- Example: 0,
    Klout integer                        -- Example: 35,
    Sentiment real                       -- Example: 0.0,
    text text                            -- Example: 'We are hiring: Senior Software Engineer - Proto http://www.reqcloud.com/jobs/719',
    LocationID integer                   -- Example: 3751,
    UserID text                          -- Example: 'tw-40932430',
    FOREIGN KEY (UserID) REFERENCES user(UserID),
    FOREIGN KEY (LocationID) REFERENCES location(LocationID)
);