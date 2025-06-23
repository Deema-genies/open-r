CREATE TABLE Batting_Style (
    Batting_Id integer PRIMARY KEY       -- Example: 1,
    Batting_hand text                    -- Example: 'Left-hand bat'
);

CREATE TABLE Bowling_Style (
    Bowling_Id integer PRIMARY KEY       -- Example: 1,
    Bowling_skill text                   -- Example: 'Right-arm medium'
);

CREATE TABLE City (
    City_Id integer PRIMARY KEY          -- Example: 1,
    City_Name text                       -- Example: 'Bangalore',
    Country_id integer                   -- Example: 1
);

CREATE TABLE Country (
    Country_Id integer PRIMARY KEY       -- Example: 1,
    Country_Name text                    -- Example: 'India'
);

CREATE TABLE Extra_Type (
    Extra_Id integer PRIMARY KEY         -- Example: 1,
    Extra_Name text                      -- Example: 'legbyes'
);

CREATE TABLE Extra_Runs (
    Match_Id integer                     -- Example: 335987,
    Over_Id integer                      -- Example: 1,
    Ball_Id integer                      -- Example: 1,
    Extra_Type_Id integer                -- Example: 1,
    Extra_Runs integer                   -- Example: 1,
    Innings_No integer                   -- Example: 1,
    PRIMARY KEY (Match_Id, Over_Id, Ball_Id, Innings_No),
    FOREIGN KEY (Extra_Type_Id) REFERENCES Extra_Type(Extra_Id)
);

CREATE TABLE Out_Type (
    Out_Id integer PRIMARY KEY           -- Example: 1,
    Out_Name text                        -- Example: 'caught'
);

CREATE TABLE Outcome (
    Outcome_Id integer PRIMARY KEY       -- Example: 1,
    Outcome_Type text                    -- Example: 'Result'
);

CREATE TABLE Player (
    Player_Id integer PRIMARY KEY        -- Example: 1,
    Player_Name text                     -- Example: 'SC Ganguly',
    DOB date                             -- Example: '1972-07-08',
    Batting_hand integer                 -- Example: 'Right-hand bat',
    Bowling_skill integer                -- Example: 1,
    Country_Name integer                 -- Example: 'India',
    FOREIGN KEY (Country_Name) REFERENCES Country(Country_Id),
    FOREIGN KEY (Bowling_skill) REFERENCES Bowling_Style(Bowling_Id),
    FOREIGN KEY (Batting_hand) REFERENCES Batting_Style(Batting_Id)
);

CREATE TABLE Rolee (
    Role_Id integer PRIMARY KEY          -- Example: 1,
    Role_Desc text                       -- Example: 'Captain'
);

CREATE TABLE Season (
    Season_Id integer PRIMARY KEY        -- Example: 1,
    Man_of_the_Series integer            -- Example: 32,
    Orange_Cap integer                   -- Example: 100,
    Purple_Cap integer                   -- Example: 102,
    Season_Year integer                  -- Example: 2008
);

CREATE TABLE Team (
    Team_Id integer PRIMARY KEY          -- Example: 1,
    Team_Name text                       -- Example: 'Kolkata Knight Riders'
);

CREATE TABLE Toss_Decision (
    Toss_Id integer PRIMARY KEY          -- Example: 1,
    Toss_Name text                       -- Example: 'field'
);

CREATE TABLE Umpire (
    Umpire_Id integer PRIMARY KEY        -- Example: 1,
    Umpire_Name text                     -- Example: 'Asad Rauf',
    Umpire_Country integer               -- Example: 6,
    FOREIGN KEY (Umpire_Country) REFERENCES Country(Country_Id)
);

CREATE TABLE Venue (
    Venue_Id integer PRIMARY KEY         -- Example: 1,
    Venue_Name text                      -- Example: 'M Chinnaswamy Stadium',
    City_Id integer                      -- Example: 1,
    FOREIGN KEY (City_Id) REFERENCES City(City_Id)
);

CREATE TABLE Win_By (
    Win_Id integer PRIMARY KEY           -- Example: 1,
    Win_Type text                        -- Example: 'by runs'
);

CREATE TABLE Match (
    Match_Id integer PRIMARY KEY         -- Example: 335987,
    Team_1 integer                       -- Example: 2,
    Team_2 integer                       -- Example: 1,
    Match_Date date                      -- Example: '2008-04-18',
    Season_Id integer                    -- Example: 1,
    Venue_Id integer                     -- Example: 1,
    Toss_Winner integer                  -- Example: 2,
    Toss_Decide integer                  -- Example: 1,
    Win_Type integer                     -- Example: 1,
    Win_Margin integer                   -- Example: 140,
    Outcome_type integer                 -- Example: 1,
    Match_Winner integer                 -- Example: 1,
    Man_of_the_Match integer             -- Example: 2,
    FOREIGN KEY (Man_of_the_Match) REFERENCES Player(Player_Id),
    FOREIGN KEY (Match_Winner) REFERENCES Team(Team_Id),
    FOREIGN KEY (Outcome_type) REFERENCES Out_Type(Out_Id),
    FOREIGN KEY (Win_Type) REFERENCES Win_By(Win_Id),
    FOREIGN KEY (Toss_Decide) REFERENCES Toss_Decision(Toss_Id),
    FOREIGN KEY (Toss_Winner) REFERENCES Team(Team_Id),
    FOREIGN KEY (Venue_Id) REFERENCES Venue(Venue_Id),
    FOREIGN KEY (Season_Id) REFERENCES Season(Season_Id),
    FOREIGN KEY (Team_2) REFERENCES Team(Team_Id),
    FOREIGN KEY (Team_1) REFERENCES Team(Team_Id)
);

CREATE TABLE Ball_by_Ball (
    Match_Id integer                     -- Example: 335987,
    Over_Id integer                      -- Example: 1,
    Ball_Id integer                      -- Example: 1,
    Innings_No integer                   -- Example: 1,
    Team_Batting integer                 -- Example: 1,
    Team_Bowling integer                 -- Example: 2,
    Striker_Batting_Position integer     -- Example: 1,
    Striker integer                      -- Example: 1,
    Non_Striker integer                  -- Example: 2,
    Bowler integer                       -- Example: 14,
    PRIMARY KEY (Match_Id, Over_Id, Ball_Id, Innings_No),
    FOREIGN KEY (Match_Id) REFERENCES Match(Match_Id)
);

CREATE TABLE Batsman_Scored (
    Match_Id integer                     -- Example: 335987,
    Over_Id integer                      -- Example: 1,
    Ball_Id integer                      -- Example: 1,
    Runs_Scored integer                  -- Example: 0,
    Innings_No integer                   -- Example: 1,
    PRIMARY KEY (Match_Id, Over_Id, Ball_Id, Innings_No),
    FOREIGN KEY (Match_Id) REFERENCES Match(Match_Id)
);

CREATE TABLE Player_Match (
    Match_Id integer                     -- Example: 335987,
    Player_Id integer                    -- Example: 1,
    Role_Id integer                      -- Example: 6,
    Team_Id integer                      -- Example: 1,
    PRIMARY KEY (Match_Id, Player_Id, Role_Id),
    FOREIGN KEY (Role_Id) REFERENCES Rolee(Role_Id),
    FOREIGN KEY (Team_Id) REFERENCES Team(Team_Id),
    FOREIGN KEY (Player_Id) REFERENCES Player(Player_Id),
    FOREIGN KEY (Match_Id) REFERENCES Match(Match_Id)
);

CREATE TABLE Wicket_Taken (
    Match_Id integer                     -- Example: 335987,
    Over_Id integer                      -- Example: 2,
    Ball_Id integer                      -- Example: 1,
    Player_Out integer                   -- Example: 6,
    Kind_Out integer                     -- Example: 2,
    Fielders integer                     -- Example: 83,
    Innings_No integer                   -- Example: 2,
    PRIMARY KEY (Match_Id, Over_Id, Ball_Id, Innings_No),
    FOREIGN KEY (Fielders) REFERENCES Player(Player_Id),
    FOREIGN KEY (Kind_Out) REFERENCES Out_Type(Out_Id),
    FOREIGN KEY (Player_Out) REFERENCES Player(Player_Id),
    FOREIGN KEY (Match_Id) REFERENCES Match(Match_Id)
);