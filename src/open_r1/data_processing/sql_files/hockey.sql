CREATE TABLE AwardsMisc (
    name text PRIMARY KEY                -- Example: '1960 U.S. Olympic Hockey Team',
    ID text                              -- Example: 'arboual01',
    award text                           -- Example: 'Patrick',
    year integer                         -- Example: 2001,
    lgID text                            -- Example: 'NHL',
    note text                            -- Example: 'posthumous'
);

CREATE TABLE HOF (
    year integer                         -- Example: 1969,
    hofID text PRIMARY KEY               -- Example: 'abelsi01h',
    name text                            -- Example: 'Sid Abel',
    category text                        -- Example: 'Player'
);

CREATE TABLE Teams (
    year integer                         -- Example: 1909,
    lgID text                            -- Example: 'NHA',
    tmID text                            -- Example: 'COB',
    franchID text                        -- Example: 'BKN',
    confID text                          -- Example: 'CC',
    divID text                           -- Example: 'AM',
    rank integer                         -- Example: 4,
    playoff text                         -- Example: 'LCS',
    G integer                            -- Example: 12,
    W integer                            -- Example: 4,
    L integer                            -- Example: 8,
    T integer                            -- Example: 0,
    OTL text                             -- Example: '3',
    Pts integer                          -- Example: 8,
    SoW text                             -- Example: '3',
    SoL text                             -- Example: '7',
    GF integer                           -- Example: 79,
    GA integer                           -- Example: 104,
    name text                            -- Example: 'Cobalt Silver Kings',
    PIM text                             -- Example: '336',
    BenchMinor text                      -- Example: '12',
    PPG text                             -- Example: '28',
    PPC text                             -- Example: '220',
    SHA text                             -- Example: '4',
    PKG text                             -- Example: '45',
    PKC text                             -- Example: '242',
    SHF text                             -- Example: '3',
    PRIMARY KEY (year, tmID)
);

CREATE TABLE Coaches (
    coachID text                         -- Example: 'abelsi01c',
    year integer                         -- Example: 1952,
    tmID text                            -- Example: 'CHI',
    lgID text                            -- Example: 'NHL',
    stint integer                        -- Example: 1,
    notes text                           -- Example: 'interim',
    g integer                            -- Example: 70,
    w integer                            -- Example: 27,
    l integer                            -- Example: 28,
    t integer                            -- Example: 15,
    postg text                           -- Example: '7',
    postw text                           -- Example: '3',
    postl text                           -- Example: '4',
    postt text                           -- Example: '0',
    PRIMARY KEY (coachID, year, tmID, stint),
    FOREIGN KEY (year) REFERENCES Teams(year),
    FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE AwardsCoaches (
    coachID text                         -- Example: 'patrile01c',
    award text                           -- Example: 'First Team All-Star',
    year integer                         -- Example: 1930,
    lgID text                            -- Example: 'NHL',
    note text                            -- Example: NULL,
    FOREIGN KEY (coachID) REFERENCES Coaches(coachID)
);

CREATE TABLE Master (
    playerID text                        -- Example: NULL,
    coachID text                         -- Example: NULL,
    hofID text                           -- Example: NULL,
    firstName text                       -- Example: NULL,
    lastName text                        -- Example: NULL,
    nameNote text                        -- Example: NULL,
    nameGiven text                       -- Example: NULL,
    nameNick text                        -- Example: NULL,
    height text                          -- Example: NULL,
    weight text                          -- Example: NULL,
    shootCatch text                      -- Example: NULL,
    legendsID text                       -- Example: NULL,
    ihdbID text                          -- Example: NULL,
    hrefID text                          -- Example: NULL,
    firstNHL text                        -- Example: NULL,
    lastNHL text                         -- Example: NULL,
    firstWHA text                        -- Example: NULL,
    lastWHA text                         -- Example: NULL,
    pos text                             -- Example: NULL,
    birthYear text                       -- Example: NULL,
    birthMon text                        -- Example: NULL,
    birthDay text                        -- Example: NULL,
    birthCountry text                    -- Example: NULL,
    birthState text                      -- Example: NULL,
    birthCity text                       -- Example: NULL,
    deathYear text                       -- Example: NULL,
    deathMon text                        -- Example: NULL,
    deathDay text                        -- Example: NULL,
    deathCountry text                    -- Example: NULL,
    deathState text                      -- Example: NULL,
    deathCity text                       -- Example: NULL,
    FOREIGN KEY (coachID) REFERENCES Coaches(coachID)
);

CREATE TABLE AwardsPlayers (
    playerID text                        -- Example: 'abelsi01',
    award text                           -- Example: 'First Team All-Star',
    year integer                         -- Example: 1948,
    lgID text                            -- Example: 'NHL',
    note text                            -- Example: 'tie',
    pos text                             -- Example: 'C',
    PRIMARY KEY (playerID, award, year),
    FOREIGN KEY (playerID) REFERENCES Master(playerID)
);

CREATE TABLE CombinedShutouts (
    year integer                         -- Example: 1929,
    month integer                        -- Example: 3,
    date integer                         -- Example: 14,
    tmID text                            -- Example: 'TOR',
    oppID text                           -- Example: 'NYA',
    R/P text                             -- Example: 'R',
    IDgoalie1 text                       -- Example: 'chabolo01',
    IDgoalie2 text                       -- Example: 'grantbe01',
    FOREIGN KEY (IDgoalie2) REFERENCES Master(playerID),
    FOREIGN KEY (IDgoalie1) REFERENCES Master(playerID)
);

CREATE TABLE Goalies (
    playerID text                        -- Example: 'abbotge01',
    year integer                         -- Example: 1943,
    stint integer                        -- Example: 1,
    tmID text                            -- Example: 'BOS',
    lgID text                            -- Example: 'NHL',
    GP text                              -- Example: '1',
    Min text                             -- Example: '60',
    W text                               -- Example: '0',
    L text                               -- Example: '1',
    T/OL text                            -- Example: '0',
    ENG text                             -- Example: '0',
    SHO text                             -- Example: '0',
    GA text                              -- Example: '7.0',
    SA text                              -- Example: '66',
    PostGP text                          -- Example: '1',
    PostMin text                         -- Example: '1',
    PostW text                           -- Example: '0',
    PostL text                           -- Example: '0',
    PostT text                           -- Example: '0',
    PostENG text                         -- Example: '0',
    PostSHO text                         -- Example: '0',
    PostGA text                          -- Example: '0',
    PostSA text                          -- Example: '0',
    PRIMARY KEY (playerID, year, stint),
    FOREIGN KEY (playerID) REFERENCES Master(playerID),
    FOREIGN KEY (year) REFERENCES Teams(year),
    FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE GoaliesSC (
    playerID text                        -- Example: 'benedcl01',
    year integer                         -- Example: 1914,
    tmID text                            -- Example: 'OT1',
    lgID text                            -- Example: 'NHA',
    GP integer                           -- Example: 3,
    Min integer                          -- Example: 180,
    W integer                            -- Example: 0,
    L integer                            -- Example: 3,
    T integer                            -- Example: 0,
    SHO integer                          -- Example: 0,
    GA integer                           -- Example: 26,
    PRIMARY KEY (playerID, year),
    FOREIGN KEY (playerID) REFERENCES Master(playerID),
    FOREIGN KEY (year) REFERENCES Teams(year),
    FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE GoaliesShootout (
    playerID text                        -- Example: 'aebisda01',
    year integer                         -- Example: 2005,
    stint integer                        -- Example: 1,
    tmID text                            -- Example: 'COL',
    W integer                            -- Example: 2,
    L integer                            -- Example: 1,
    SA integer                           -- Example: 10,
    GA integer                           -- Example: 2,
    FOREIGN KEY (playerID) REFERENCES Master(playerID),
    FOREIGN KEY (year) REFERENCES Teams(year),
    FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE Scoring (
    playerID text                        -- Example: 'aaltoan01',
    year integer                         -- Example: 1997,
    stint integer                        -- Example: 1,
    tmID text                            -- Example: 'ANA',
    lgID text                            -- Example: 'NHL',
    pos text                             -- Example: 'C',
    GP integer                           -- Example: 3,
    G integer                            -- Example: 0,
    A integer                            -- Example: 0,
    Pts integer                          -- Example: 0,
    PIM integer                          -- Example: 0,
    +/- text                             -- Example: '-1',
    PPG text                             -- Example: '0',
    PPA text                             -- Example: '0',
    SHG text                             -- Example: '0',
    SHA text                             -- Example: '0',
    GWG text                             -- Example: '0',
    GTG text                             -- Example: '0',
    SOG text                             -- Example: '1',
    PostGP text                          -- Example: '4',
    PostG text                           -- Example: '0',
    PostA text                           -- Example: '0',
    PostPts text                         -- Example: '0',
    PostPIM text                         -- Example: '2',
    Post+/- text                         -- Example: '0',
    PostPPG text                         -- Example: '0',
    PostPPA text                         -- Example: '0',
    PostSHG text                         -- Example: '0',
    PostSHA text                         -- Example: '0',
    PostGWG text                         -- Example: '0',
    PostSOG text                         -- Example: '0',
    FOREIGN KEY (playerID) REFERENCES Master(playerID),
    FOREIGN KEY (year) REFERENCES Teams(year),
    FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE ScoringSC (
    playerID text                        -- Example: 'adamsbi01',
    year integer                         -- Example: 1920,
    tmID text                            -- Example: 'VML',
    lgID text                            -- Example: 'PCHA',
    pos text                             -- Example: 'R',
    GP integer                           -- Example: 4,
    G integer                            -- Example: 0,
    A integer                            -- Example: 0,
    Pts integer                          -- Example: 0,
    PIM integer                          -- Example: 0,
    FOREIGN KEY (playerID) REFERENCES Master(playerID),
    FOREIGN KEY (year) REFERENCES Teams(year),
    FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE ScoringShootout (
    playerID text                        -- Example: 'adamske01',
    year integer                         -- Example: 2006,
    stint integer                        -- Example: 1,
    tmID text                            -- Example: 'PHO',
    S integer                            -- Example: 1,
    G integer                            -- Example: 0,
    GDG integer                          -- Example: 0,
    FOREIGN KEY (playerID) REFERENCES Master(playerID),
    FOREIGN KEY (year) REFERENCES Teams(year),
    FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE ScoringSup (
    playerID text                        -- Example: 'actonke01',
    year integer                         -- Example: 1988,
    PPA text                             -- Example: '1',
    SHA text                             -- Example: '1',
    FOREIGN KEY (playerID) REFERENCES Master(playerID)
);

CREATE TABLE SeriesPost (
    year integer                         -- Example: 1912,
    round text                           -- Example: 'SCF',
    series text                          -- Example: 'A',
    tmIDWinner text                      -- Example: 'VA1',
    lgIDWinner text                      -- Example: 'PCHA',
    tmIDLoser text                       -- Example: 'QU1',
    lgIDLoser text                       -- Example: 'NHA',
    W integer                            -- Example: 2,
    L integer                            -- Example: 1,
    T integer                            -- Example: 0,
    GoalsWinner integer                  -- Example: 16,
    GoalsLoser integer                   -- Example: 12,
    note text                            -- Example: 'EX',
    FOREIGN KEY (year) REFERENCES Teams(year),
    FOREIGN KEY (tmIDLoser) REFERENCES Teams(tmID),
    FOREIGN KEY (year) REFERENCES Teams(year),
    FOREIGN KEY (tmIDWinner) REFERENCES Teams(tmID)
);

CREATE TABLE TeamSplits (
    year integer                         -- Example: 1909,
    lgID text                            -- Example: 'NHA',
    tmID text                            -- Example: 'COB',
    hW integer                           -- Example: 2,
    hL integer                           -- Example: 4,
    hT integer                           -- Example: 0,
    hOTL text                            -- Example: '2',
    rW integer                           -- Example: 2,
    rL integer                           -- Example: 4,
    rT integer                           -- Example: 0,
    rOTL text                            -- Example: '1',
    SepW text                            -- Example: '1',
    SepL text                            -- Example: '1',
    SepT text                            -- Example: NULL,
    SepOL text                           -- Example: '0',
    OctW text                            -- Example: '0',
    OctL text                            -- Example: '1',
    OctT text                            -- Example: '0',
    OctOL text                           -- Example: '1',
    NovW text                            -- Example: '5',
    NovL text                            -- Example: '1',
    NovT text                            -- Example: '0',
    NovOL text                           -- Example: '0',
    DecW text                            -- Example: '0',
    DecL text                            -- Example: '1',
    DecT text                            -- Example: '0',
    DecOL text                           -- Example: '0',
    JanW integer                         -- Example: 1,
    JanL integer                         -- Example: 1,
    JanT integer                         -- Example: 0,
    JanOL text                           -- Example: '0',
    FebW integer                         -- Example: 2,
    FebL integer                         -- Example: 3,
    FebT integer                         -- Example: 0,
    FebOL text                           -- Example: '0',
    MarW text                            -- Example: '1',
    MarL text                            -- Example: '4',
    MarT text                            -- Example: '0',
    MarOL text                           -- Example: '1',
    AprW text                            -- Example: '1',
    AprL text                            -- Example: '0',
    AprT text                            -- Example: '0',
    AprOL text                           -- Example: '1',
    PRIMARY KEY (year, tmID),
    FOREIGN KEY (year) REFERENCES Teams(year),
    FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE TeamVsTeam (
    year integer                         -- Example: 1909,
    lgID text                            -- Example: 'NHA',
    tmID text                            -- Example: 'COB',
    oppID text                           -- Example: 'HAI',
    W integer                            -- Example: 1,
    L integer                            -- Example: 1,
    T integer                            -- Example: 0,
    OTL text                             -- Example: '0',
    PRIMARY KEY (year, tmID, oppID),
    FOREIGN KEY (oppID) REFERENCES Teams(tmID),
    FOREIGN KEY (year) REFERENCES Teams(year),
    FOREIGN KEY (year) REFERENCES Teams(year),
    FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE TeamsHalf (
    year integer                         -- Example: 1916,
    lgID text                            -- Example: 'NHA',
    tmID text                            -- Example: 'MOC',
    half integer                         -- Example: 1,
    rank integer                         -- Example: 1,
    G integer                            -- Example: 10,
    W integer                            -- Example: 7,
    L integer                            -- Example: 3,
    T integer                            -- Example: 0,
    GF integer                           -- Example: 58,
    GA integer                           -- Example: 38,
    PRIMARY KEY (year, tmID, half),
    FOREIGN KEY (tmID) REFERENCES Teams(tmID),
    FOREIGN KEY (year) REFERENCES Teams(year)
);

CREATE TABLE TeamsPost (
    year integer                         -- Example: 1913,
    lgID text                            -- Example: 'NHA',
    tmID text                            -- Example: 'MOC',
    G integer                            -- Example: 2,
    W integer                            -- Example: 1,
    L integer                            -- Example: 1,
    T integer                            -- Example: 0,
    GF integer                           -- Example: 2,
    GA integer                           -- Example: 6,
    PIM text                             -- Example: '59',
    BenchMinor text                      -- Example: '0',
    PPG text                             -- Example: '1',
    PPC text                             -- Example: '39',
    SHA text                             -- Example: '0',
    PKG text                             -- Example: '3',
    PKC text                             -- Example: '55',
    SHF text                             -- Example: '0',
    PRIMARY KEY (year, tmID),
    FOREIGN KEY (year) REFERENCES Teams(year),
    FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE TeamsSC (
    year integer                         -- Example: 1912,
    lgID text                            -- Example: 'NHA',
    tmID text                            -- Example: 'QU1',
    G integer                            -- Example: 3,
    W integer                            -- Example: 1,
    L integer                            -- Example: 2,
    T integer                            -- Example: 0,
    GF integer                           -- Example: 12,
    GA integer                           -- Example: 16,
    PIM text                             -- Example: '24',
    PRIMARY KEY (year, tmID),
    FOREIGN KEY (year) REFERENCES Teams(year),
    FOREIGN KEY (tmID) REFERENCES Teams(tmID)
);

CREATE TABLE abbrev (
    Type text                            -- Example: 'Conference',
    Code text                            -- Example: 'CC',
    Fullname text                        -- Example: 'Campbell Conference',
    PRIMARY KEY (Type, Code)
);