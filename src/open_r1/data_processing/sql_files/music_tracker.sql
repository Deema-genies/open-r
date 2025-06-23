CREATE TABLE torrents (
    groupName text                       -- Example: 'superappin&#39;',
    totalSnatched integer                -- Example: 239,
    artist text                          -- Example: 'grandmaster flash & the furious five',
    groupYear integer                    -- Example: 1979,
    releaseType text                     -- Example: 'single',
    groupId integer                      -- Example: 720949,
    id integer PRIMARY KEY               -- Example: 0
);

CREATE TABLE tags (
    index integer PRIMARY KEY            -- Example: 0,
    id integer                           -- Example: 0,
    tag text                             -- Example: '1970s'
);