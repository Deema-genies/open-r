CREATE TABLE Question (
    questiontext text                    -- Example: 'What is your age?',
    questionid integer PRIMARY KEY       -- Example: 1
);

CREATE TABLE Survey (
    SurveyID integer PRIMARY KEY         -- Example: 2014,
    Description text                     -- Example: 'mental health survey for 2014'
);

CREATE TABLE Answer (
    AnswerText text                      -- Example: '37',
    SurveyID integer                     -- Example: 2016,
    UserID integer                       -- Example: 1,
    QuestionID integer                   -- Example: 1,
    PRIMARY KEY (UserID, QuestionID)
);