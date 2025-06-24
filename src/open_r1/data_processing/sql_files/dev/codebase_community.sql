CREATE TABLE badges (
    Id integer PRIMARY KEY               -- Example: 1,
    UserId integer                       -- Example: 5,
    Name text                            -- Example: 'Teacher',
    Date datetime                        -- Example: '2010-07-19 19:39:07.0',
    FOREIGN KEY (UserId) REFERENCES users(Id)
);

CREATE TABLE comments (
    Id integer PRIMARY KEY               -- Example: 1,
    PostId integer                       -- Example: 3,
    Score integer                        -- Example: 5,
    Text text                            -- Example: 'Could be a poster child fo argumentative and subjective.  At the least, need to ',
    CreationDate datetime                -- Example: '2010-07-19 19:15:52.0',
    UserId integer                       -- Example: 13,
    UserDisplayName text                 -- Example: 'user28',
    FOREIGN KEY (UserId) REFERENCES users(Id),
    FOREIGN KEY (PostId) REFERENCES posts(Id)
);

CREATE TABLE postHistory (
    Id integer PRIMARY KEY               -- Example: 1,
    PostHistoryTypeId integer            -- Example: 2,
    PostId integer                       -- Example: 1,
    RevisionGUID text                    -- Example: 'e58bf7fd-e60f-4c58-a6e4-dfc91cf98a69',
    CreationDate datetime                -- Example: '2010-07-19 19:12:12.0',
    UserId integer                       -- Example: 8,
    Text text                            -- Example: 'How should I elicit prior distributions from experts when fitting a Bayesian mod',
    Comment text                         -- Example: '',
    UserDisplayName text                 -- Example: '',
    FOREIGN KEY (UserId) REFERENCES users(Id),
    FOREIGN KEY (PostId) REFERENCES posts(Id)
);

CREATE TABLE postLinks (
    Id integer PRIMARY KEY               -- Example: 108,
    CreationDate datetime                -- Example: '2010-07-21 14:47:33.0',
    PostId integer                       -- Example: 395,
    RelatedPostId integer                -- Example: 173,
    LinkTypeId integer                   -- Example: 1,
    FOREIGN KEY (RelatedPostId) REFERENCES posts(Id),
    FOREIGN KEY (PostId) REFERENCES posts(Id)
);

CREATE TABLE posts (
    Id integer PRIMARY KEY               -- Example: 1,
    PostTypeId integer                   -- Example: 1,
    AcceptedAnswerId integer             -- Example: 15,
    CreaionDate datetime                 -- Example: '2010-07-19 19:12:12.0',
    Score integer                        -- Example: 23,
    ViewCount integer                    -- Example: 1278,
    Body text                            -- Example: '<p>How should I elicit prior distributions from experts when fitting a Bayesian ',
    OwnerUserId integer                  -- Example: 8,
    LasActivityDate datetime             -- Example: '2010-09-15 21:08:26.0',
    Title text                           -- Example: 'Eliciting priors from experts',
    Tags text                            -- Example: '<bayesian><prior><elicitation>',
    AnswerCount integer                  -- Example: 5,
    CommentCount integer                 -- Example: 1,
    FavoriteCount integer                -- Example: 14,
    LastEditorUserId integer             -- Example: 88,
    LastEditDate datetime                -- Example: '2010-08-07 17:56:44.0',
    CommunityOwnedDate datetime          -- Example: '2010-07-19 19:13:28.0',
    ParentId integer                     -- Example: 3,
    ClosedDate datetime                  -- Example: '2010-07-19 20:19:46.0',
    OwnerDisplayName text                -- Example: 'user28',
    LastEditorDisplayName text           -- Example: 'user28',
    FOREIGN KEY (ParentId) REFERENCES posts(Id),
    FOREIGN KEY (OwnerUserId) REFERENCES users(Id),
    FOREIGN KEY (LastEditorUserId) REFERENCES users(Id)
);

CREATE TABLE tags (
    Id integer PRIMARY KEY               -- Example: 1,
    TagName text                         -- Example: 'bayesian',
    Count integer                        -- Example: 1342,
    ExcerptPostId integer                -- Example: 20258,
    WikiPostId integer                   -- Example: 20257,
    FOREIGN KEY (ExcerptPostId) REFERENCES posts(Id)
);

CREATE TABLE users (
    Id integer PRIMARY KEY               -- Example: -1,
    Reputation integer                   -- Example: 1,
    CreationDate datetime                -- Example: '2010-07-19 06:55:26.0',
    DisplayName text                     -- Example: 'Community',
    LastAccessDate datetime              -- Example: '2010-07-19 06:55:26.0',
    WebsiteUrl text                      -- Example: 'http://meta.stackexchange.com/',
    Location text                        -- Example: 'on the server farm',
    AboutMe text                         -- Example: '<p>Hi, I'm not really a person.</p>

<p>I'm a background process that helps keep',
    Views integer                        -- Example: 0,
    UpVotes integer                      -- Example: 5007,
    DownVotes integer                    -- Example: 1920,
    AccountId integer                    -- Example: -1,
    Age integer                          -- Example: 37,
    ProfileImageUrl text                 -- Example: 'http://i.stack.imgur.com/d1oHX.jpg'
);

CREATE TABLE votes (
    Id integer PRIMARY KEY               -- Example: 1,
    PostId integer                       -- Example: 3,
    VoteTypeId integer                   -- Example: 2,
    CreationDate date                    -- Example: '2010-07-19',
    UserId integer                       -- Example: 58,
    BountyAmount integer                 -- Example: 50,
    FOREIGN KEY (UserId) REFERENCES users(Id),
    FOREIGN KEY (PostId) REFERENCES posts(Id)
);