CREATE TABLE Community_Area (
    community_area_no integer PRIMARY KEY -- Example: 25,
    community_area_name text             -- Example: 'Aurora',
    side text                            -- Example: 'East',
    population text                      -- Example: 12345
);

CREATE TABLE District (
    district_no integer PRIMARY KEY      -- Example: 1,
    district_name text                   -- Example: 'Central',
    address text                         -- Example: '1718 South State Street',
    zip_code integer                     -- Example: 60616,
    commander text                       -- Example: 'Jake M. Alderden',
    email text                           -- Example: ' CAPS001District@chicagopolice.org',
    phone text                           -- Example: '312-745-4290',
    fax text                             -- Example: '312-745-3694',
    tty text                             -- Example: '312-745-3693',
    twitter text                         -- Example: ' ChicagoCAPS01'
);

CREATE TABLE FBI_Code (
    fbi_code_no text PRIMARY KEY         -- Example: '01A',
    title text                           -- Example: 'Homicide 1st & 2nd Degree',
    description text                     -- Example: 'The killing of one human being by another.',
    crime_against text                   -- Example: 'Persons'
);

CREATE TABLE IUCR (
    iucr_no text PRIMARY KEY             -- Example: '031A',
    primary_description text             -- Example: 'HOMICIDE',
    secondary_description text           -- Example: 'FIRST DEGREE MURDER',
    index_code text                      -- Example: 'I'
);

CREATE TABLE Neighborhood (
    neighborhood_name text PRIMARY KEY   -- Example: 'Albany Park',
    community_area_no integer            -- Example: 14,
    FOREIGN KEY (community_area_no) REFERENCES Community_Area(community_area_no)
);

CREATE TABLE Ward (
    ward_no integer PRIMARY KEY          -- Example: 1,
    alderman_first_name text             -- Example: 'Daniel',
    alderman_last_name text              -- Example: 'La Spata',
    alderman_name_suffix text            -- Example: 'Jr.',
    ward_office_address text             -- Example: '1958 N. Milwaukee Ave.',
    ward_office_zip text                 -- Example: '60647',
    ward_email text                      -- Example: 'info@the1stward.com',
    ward_office_phone text               -- Example: '872.206.2685',
    ward_office_fax text                 -- Example: '312.448.8829',
    city_hall_office_room integer        -- Example: 200,
    city_hall_office_phone text          -- Example: '312.744.6836',
    city_hall_office_fax text            -- Example: '312.744.6712',
    Population integer                   -- Example: 56149
);

CREATE TABLE Crime (
    report_no integer PRIMARY KEY        -- Example: 23757,
    case_number text                     -- Example: 'JB100159',
    date text                            -- Example: '1/1/2018 2:46',
    block text                           -- Example: '039XX W CORNELIA AVE',
    iucr_no text                         -- Example: '110',
    location_description text            -- Example: 'Street',
    arrest text                          -- Example: 'FALSE',
    domestic text                        -- Example: 'FALSE',
    beat integer                         -- Example: 1732,
    district_no integer                  -- Example: 17,
    ward_no integer                      -- Example: 30,
    community_area_no integer            -- Example: 21,
    fbi_code_no text                     -- Example: '01A',
    latitude text                        -- Example: '41.94456125',
    longitude text                       -- Example: '-87.72668181',
    FOREIGN KEY (fbi_code_no) REFERENCES FBI_Code(fbi_code_no),
    FOREIGN KEY (community_area_no) REFERENCES Community_Area(community_area_no),
    FOREIGN KEY (district_no) REFERENCES District(district_no),
    FOREIGN KEY (iucr_no) REFERENCES IUCR(iucr_no),
    FOREIGN KEY (ward_no) REFERENCES Ward(ward_no)
);