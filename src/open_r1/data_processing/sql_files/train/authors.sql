CREATE TABLE Author (
    Id integer PRIMARY KEY               -- Example: 37,
    Name text                            -- Example: 'P. B. Littlewood',
    Affiliation text                     -- Example: 'Cavendish Laboratory|Cambridge University'
);

CREATE TABLE Conference (
    Id integer PRIMARY KEY               -- Example: 1,
    ShortName text                       -- Example: 'IADIS',
    FullName text                        -- Example: 'International Association for Development of the Information Society',
    HomePage text                        -- Example: ''
);

CREATE TABLE Journal (
    Id integer PRIMARY KEY               -- Example: 1,
    ShortName text                       -- Example: 'ICOM',
    FullName text                        -- Example: 'Zeitschrift Für Interaktive Und Kooperative Medien',
    HomePage text                        -- Example: 'http://www.i-com-media.de'
);

CREATE TABLE Paper (
    Id integer PRIMARY KEY               -- Example: 1,
    Title text                           -- Example: 'Stitching videos streamed by mobile phones in real-time',
    Year integer                         -- Example: 2009,
    ConferenceId integer                 -- Example: 167,
    JournalId integer                    -- Example: 0,
    Keyword text                         -- Example: 'mobile video capturing|real-time|video stitching',
    FOREIGN KEY (JournalId) REFERENCES Journal(Id),
    FOREIGN KEY (ConferenceId) REFERENCES Conference(Id)
);

CREATE TABLE PaperAuthor (
    PaperId integer                      -- Example: 4,
    AuthorId integer                     -- Example: 1456512,
    Name text                            -- Example: 'ADAM G. JONES',
    Affiliation text                     -- Example: 'Unknown',
    FOREIGN KEY (AuthorId) REFERENCES Author(Id),
    FOREIGN KEY (PaperId) REFERENCES Paper(Id)
);