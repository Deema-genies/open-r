CREATE TABLE location (
    locationID integer PRIMARY KEY       -- Example: 1,
    locationcity text                    -- Example: 'Atlanta',
    address text                         -- Example: '450 Peachtree Rd',
    state text                           -- Example: 'Georgia',
    zipcode integer                      -- Example: 30316,
    officephone text                     -- Example: '(404)333-5555'
);

CREATE TABLE position (
    positionID integer PRIMARY KEY       -- Example: 1,
    positiontitle text                   -- Example: 'Account Representative',
    educationrequired text               -- Example: '4 year degree',
    minsalary text                       -- Example: 'US$25,000.00',
    maxsalary text                       -- Example: '75000'
);

CREATE TABLE employee (
    ssn text PRIMARY KEY                 -- Example: '000-01-0000',
    lastname text                        -- Example: 'Milgrom',
    firstname text                       -- Example: 'Patricia',
    hiredate text                        -- Example: '10/1/04',
    salary text                          -- Example: '0.0',
    gender text                          -- Example: 'F',
    performance text                     -- Example: 'Average',
    positionID integer                   -- Example: 2,
    locationID integer                   -- Example: 2,
    FOREIGN KEY (positionID) REFERENCES position(positionID),
    FOREIGN KEY (locationID) REFERENCES location(locationID)
);