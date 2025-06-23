CREATE TABLE Method (
    Id integer PRIMARY KEY               -- Example: 11139,
    Name text                            -- Example: 'HtmlSharp.HtmlParser.Feed',
    FullComment text                     -- Example: 'Feeds data into the parser',
    Summary text                         -- Example: '   ',
    ApiCalls text                        -- Example: 'System.String.IsNullOrEmpty HtmlSharp.HtmlParser.GoAhead HtmlSharp.HtmlParser.En',
    CommentIsXml integer                 -- Example: 0,
    SampledAt integer                    -- Example: 636430963695654788,
    SolutionId integer                   -- Example: 0,
    Lang text                            -- Example: 'af',
    NameTokenized text                   -- Example: 'html parser feed'
);

CREATE TABLE MethodParameter (
    Id integer PRIMARY KEY               -- Example: 1,
    MethodId text                        -- Example: '1',
    Type text                            -- Example: 'System.String',
    Name text                            -- Example: 'data'
);

CREATE TABLE Repo (
    Id integer PRIMARY KEY               -- Example: 1,
    Url text                             -- Example: 'https://github.com/wallerdev/htmlsharp.git',
    Stars integer                        -- Example: 14,
    Forks integer                        -- Example: 2,
    Watchers integer                     -- Example: 14,
    ProcessedTime integer                -- Example: 636430963247108053
);

CREATE TABLE Solution (
    Id integer PRIMARY KEY               -- Example: 1,
    RepoId integer                       -- Example: 1,
    Path text                            -- Example: 'wallerdev_htmlsharp\HtmlSharp.sln',
    ProcessedTime integer                -- Example: 636430963695642191,
    WasCompiled integer                  -- Example: 1
);