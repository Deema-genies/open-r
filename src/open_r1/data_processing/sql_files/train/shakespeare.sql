CREATE TABLE chapters (
    id integer PRIMARY KEY               -- Example: 18704,
    Act integer                          -- Example: 1,
    Scene integer                        -- Example: 1,
    Description text                     -- Example: 'DUKE ORSINO’s palace.',
    work_id integer                      -- Example: 1
);

CREATE TABLE characters (
    id integer PRIMARY KEY               -- Example: 1,
    CharName text                        -- Example: 'First Apparition',
    Abbrev text                          -- Example: 'First Apparition',
    Description text                     -- Example: ''
);

CREATE TABLE paragraphs (
    id integer PRIMARY KEY               -- Example: 630868,
    ParagraphNum integer                 -- Example: 22,
    PlainText text                       -- Example: 'Why, so I do, the noblest that I have:
O, when mine eyes did see Olivia first,
M',
    character_id integer                 -- Example: 840,
    chapter_id integer                   -- Example: 18704
);

CREATE TABLE works (
    id integer PRIMARY KEY               -- Example: 1,
    Title text                           -- Example: 'Twelfth Night',
    LongTitle text                       -- Example: 'Twelfth Night, Or What You Will',
    Date integer                         -- Example: 1599,
    GenreType text                       -- Example: 'Comedy'
);