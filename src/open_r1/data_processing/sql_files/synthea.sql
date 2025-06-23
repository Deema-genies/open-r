CREATE TABLE all_prevalences (
    ITEM text PRIMARY KEY                -- Example: '0.3 Ml Epinephrine 0.5 Mg/Ml Auto Injector',
    POPULATION TYPE text                 -- Example: 'LIVING',
    OCCURRENCES integer                  -- Example: 868,
    POPULATION COUNT integer             -- Example: 1000,
    PREVALENCE RATE real                 -- Example: 0.868,
    PREVALENCE PERCENTAGE real           -- Example: 86.8
);

CREATE TABLE patients (
    patient text PRIMARY KEY             -- Example: '00269bb7-e3ab-43a9-9cdf-cdf9b6e3b2b3',
    birthdate date                       -- Example: '1929-04-08',
    deathdate date                       -- Example: '2029-11-11',
    ssn text                             -- Example: '999-78-5976',
    drivers text                         -- Example: 'S99992928',
    passport text                        -- Example: 'FALSE',
    prefix text                          -- Example: 'Mr.',
    first text                           -- Example: 'Rosamaria',
    last text                            -- Example: 'Pfannerstill',
    suffix text                          -- Example: 'PhD',
    maiden text                          -- Example: 'Schuster',
    marital text                         -- Example: 'S',
    race text                            -- Example: 'black',
    ethnicity text                       -- Example: 'dominican',
    gender text                          -- Example: 'F',
    birthplace text                      -- Example: 'Pittsfield MA US',
    address text                         -- Example: '18797 Karson Burgs Suite 444 Palmer Town MA 01069 US'
);

CREATE TABLE encounters (
    ID text PRIMARY KEY                  -- Example: '000c20ea-5c3d-43a3-9608-bd37c22f13c8',
    DATE date                            -- Example: '2008-03-11',
    PATIENT text                         -- Example: '71949668-1c2e-43ae-ab0a-64654608defb',
    CODE integer                         -- Example: 185349003,
    DESCRIPTION text                     -- Example: 'Outpatient Encounter',
    REASONCODE integer                   -- Example: 10509002,
    REASONDESCRIPTION text               -- Example: 'Acute bronchitis (disorder)',
    FOREIGN KEY (PATIENT) REFERENCES patients(patient)
);

CREATE TABLE allergies (
    START text                           -- Example: '3/11/95',
    STOP text                            -- Example: '12/22/14',
    PATIENT text                         -- Example: '00341a88-1cc1-4b39-b0f9-05b0531991a0',
    ENCOUNTER text                       -- Example: 'ddc8a625-07e6-4a02-a616-e0ce07b5f305',
    CODE integer                         -- Example: 232347008,
    DESCRIPTION text                     -- Example: 'Allergy to dairy product',
    PRIMARY KEY (PATIENT, ENCOUNTER, CODE),
    FOREIGN KEY (PATIENT) REFERENCES patients(patient),
    FOREIGN KEY (ENCOUNTER) REFERENCES encounters(ID)
);

CREATE TABLE careplans (
    ID text                              -- Example: 'e031962d-d13d-4ede-a449-040417d5e4fb',
    START date                           -- Example: '2009-01-11',
    STOP date                            -- Example: '2009-04-07',
    PATIENT text                         -- Example: '71949668-1c2e-43ae-ab0a-64654608defb',
    ENCOUNTER text                       -- Example: '4d451e22-a354-40c9-8b33-b6126158666d',
    CODE real                            -- Example: 53950000.0,
    DESCRIPTION text                     -- Example: 'Respiratory therapy',
    REASONCODE integer                   -- Example: 10509002,
    REASONDESCRIPTION text               -- Example: 'Acute bronchitis (disorder)',
    FOREIGN KEY (PATIENT) REFERENCES patients(patient),
    FOREIGN KEY (ENCOUNTER) REFERENCES encounters(ID)
);

CREATE TABLE conditions (
    START date                           -- Example: '2009-01-08',
    STOP date                            -- Example: '2009-01-21',
    PATIENT text                         -- Example: '71949668-1c2e-43ae-ab0a-64654608defb',
    ENCOUNTER text                       -- Example: '4d451e22-a354-40c9-8b33-b6126158666d',
    CODE integer                         -- Example: 10509002,
    DESCRIPTION text                     -- Example: 'Acute allergic reaction',
    FOREIGN KEY (DESCRIPTION) REFERENCES all_prevalences(ITEM),
    FOREIGN KEY (PATIENT) REFERENCES patients(patient),
    FOREIGN KEY (ENCOUNTER) REFERENCES encounters(ID)
);

CREATE TABLE immunizations (
    DATE date                            -- Example: '2007-11-02',
    PATIENT text                         -- Example: '70cbc79e-dd9d-4e3b-8158-a92d85951f94',
    ENCOUNTER text                       -- Example: '898ab2de-8a71-4fb3-b239-b768b915284a',
    CODE integer                         -- Example: 8,
    DESCRIPTION text                     -- Example: 'Influenza  seasonal  injectable  preservative free',
    PRIMARY KEY (DATE, PATIENT, ENCOUNTER, CODE),
    FOREIGN KEY (PATIENT) REFERENCES patients(patient),
    FOREIGN KEY (ENCOUNTER) REFERENCES encounters(ID)
);

CREATE TABLE medications (
    START date                           -- Example: '1918-04-17',
    STOP date                            -- Example: '2008-06-04',
    PATIENT text                         -- Example: 'ce11bcba-c83c-43ae-802d-b20ee8715afe',
    ENCOUNTER text                       -- Example: '6334071d-e6b0-42c1-a082-2a08e123de4e',
    CODE integer                         -- Example: 834060,
    DESCRIPTION text                     -- Example: 'Penicillin V Potassium 250 MG',
    REASONCODE integer                   -- Example: 43878008,
    REASONDESCRIPTION text               -- Example: 'Streptococcal sore throat (disorder)',
    PRIMARY KEY (START, PATIENT, ENCOUNTER, CODE),
    FOREIGN KEY (PATIENT) REFERENCES patients(patient),
    FOREIGN KEY (ENCOUNTER) REFERENCES encounters(ID)
);

CREATE TABLE observations (
    DATE date                            -- Example: '2008-03-11',
    PATIENT text                         -- Example: '71949668-1c2e-43ae-ab0a-64654608defb',
    ENCOUNTER text                       -- Example: '5114a5b4-64b8-47b2-82a6-0ce24aae0943',
    CODE text                            -- Example: '8302-2',
    DESCRIPTION text                     -- Example: 'Body Height',
    VALUE real                           -- Example: 166.03,
    UNITS text                           -- Example: 'cm',
    FOREIGN KEY (PATIENT) REFERENCES patients(patient),
    FOREIGN KEY (ENCOUNTER) REFERENCES encounters(ID)
);

CREATE TABLE procedures (
    DATE date                            -- Example: '2013-02-09',
    PATIENT text                         -- Example: '71949668-1c2e-43ae-ab0a-64654608defb',
    ENCOUNTER text                       -- Example: '6f2e3935-b203-493e-a9c0-f23e847b9798',
    CODE integer                         -- Example: 23426006,
    DESCRIPTION text                     -- Example: 'Measurement of respiratory function (procedure)',
    REASONCODE integer                   -- Example: 10509002,
    REASONDESCRIPTION text               -- Example: 'Acute bronchitis (disorder)',
    FOREIGN KEY (PATIENT) REFERENCES patients(patient),
    FOREIGN KEY (ENCOUNTER) REFERENCES encounters(ID)
);

CREATE TABLE claims (
    ID text PRIMARY KEY                  -- Example: '0004caaf-fd7a-4f64-bda6-dce5ebd1196c',
    PATIENT text                         -- Example: '71949668-1c2e-43ae-ab0a-64654608defb',
    BILLABLEPERIOD date                  -- Example: '2008-03-11',
    ORGANIZATION text                    -- Example: 'temp organization',
    ENCOUNTER text                       -- Example: '71949668-1c2e-43ae-ab0a-64654608defb',
    DIAGNOSIS text                       -- Example: NULL,
    TOTAL integer                        -- Example: 100
);