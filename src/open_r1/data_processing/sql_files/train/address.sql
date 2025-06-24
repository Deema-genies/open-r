CREATE TABLE CBSA (
    CBSA integer PRIMARY KEY             -- Example: 10300,
    CBSA_name text                       -- Example: 'Adrian, MI',
    CBSA_type text                       -- Example: 'Micro'
);

CREATE TABLE state (
    abbreviation text PRIMARY KEY        -- Example: 'AA',
    name text                            -- Example: 'Armed Forces Americas'
);

CREATE TABLE congress (
    cognress_rep_id text PRIMARY KEY     -- Example: 'AK',
    first_name text                      -- Example: 'Young',
    last_name text                       -- Example: 'Don',
    CID text                             -- Example: 'N00008091',
    party text                           -- Example: 'Republican',
    state text                           -- Example: 'Alaska',
    abbreviation text                    -- Example: 'AK',
    House text                           -- Example: 'House of Repsentatives',
    District integer                     -- Example: 1,
    land_area real                       -- Example: 571951.26,
    FOREIGN KEY (abbreviation) REFERENCES state(abbreviation)
);

CREATE TABLE zip_data (
    zip_code integer PRIMARY KEY         -- Example: 601,
    city text                            -- Example: 'Adjuntas',
    state text                           -- Example: 'PR',
    multi_county text                    -- Example: 'No',
    type text                            -- Example: 'Post Office',
    organization text                    -- Example: 'North Hampton, Smith College',
    time_zone text                       -- Example: 'Atlantic',
    daylight_savings text                -- Example: 'No',
    latitude real                        -- Example: 18.196747,
    longitude real                       -- Example: -66.736735,
    elevation integer                    -- Example: 0,
    state_fips integer                   -- Example: 72,
    county_fips integer                  -- Example: 1,
    region text                          -- Example: 'Northeast',
    division text                        -- Example: 'New England',
    population_2020 integer              -- Example: 11737,
    population_2010 integer              -- Example: 18570,
    households integer                   -- Example: 6525,
    avg_house_value integer              -- Example: 86200,
    avg_income_per_household integer     -- Example: 13092,
    persons_per_household real           -- Example: 2.84,
    white_population integer             -- Example: 17479,
    black_population integer             -- Example: 663,
    hispanic_population integer          -- Example: 18486,
    asian_population integer             -- Example: 7,
    american_indian_population integer   -- Example: 113,
    hawaiian_population integer          -- Example: 10,
    other_population integer             -- Example: 558,
    male_population integer              -- Example: 9078,
    female_population integer            -- Example: 9492,
    median_age real                      -- Example: 35.9,
    male_median_age real                 -- Example: 34.5,
    female_median_age real               -- Example: 37.1,
    residential_mailboxes integer        -- Example: 4133,
    business_mailboxes integer           -- Example: 221,
    total_delivery_receptacles integer   -- Example: 5173,
    businesses integer                   -- Example: 0,
    1st_quarter_payroll integer          -- Example: 0,
    annual_payroll integer               -- Example: 0,
    employees integer                    -- Example: 0,
    water_area real                      -- Example: 0.309,
    land_area real                       -- Example: 64.348,
    single_family_delivery_units integer -- Example: 2419,
    multi_family_delivery_units integer  -- Example: 1264,
    total_beneficiaries integer          -- Example: 0,
    retired_workers integer              -- Example: 0,
    disabled_workers integer             -- Example: 0,
    parents_and_widowed integer          -- Example: 0,
    spouses integer                      -- Example: 0,
    children integer                     -- Example: 0,
    over_65 integer                      -- Example: 0,
    monthly_benefits_all integer         -- Example: 0,
    monthly_benefits_retired_workers integer -- Example: 0,
    monthly_benefits_widowed integer     -- Example: 0,
    CBSA integer                         -- Example: 38660,
    FOREIGN KEY (CBSA) REFERENCES CBSA(CBSA),
    FOREIGN KEY (state) REFERENCES state(abbreviation)
);

CREATE TABLE alias (
    zip_code integer PRIMARY KEY         -- Example: 501,
    alias text                           -- Example: 'Holtsville',
    FOREIGN KEY (zip_code) REFERENCES zip_data(zip_code)
);

CREATE TABLE area_code (
    zip_code integer                     -- Example: 501,
    area_code integer                    -- Example: 631,
    PRIMARY KEY (zip_code, area_code),
    FOREIGN KEY (zip_code) REFERENCES zip_data(zip_code)
);

CREATE TABLE avoid (
    zip_code integer                     -- Example: 501,
    bad_alias text                       -- Example: 'Internal Revenue Service',
    PRIMARY KEY (zip_code, bad_alias),
    FOREIGN KEY (zip_code) REFERENCES zip_data(zip_code)
);

CREATE TABLE country (
    zip_code integer                     -- Example: 501,
    county text                          -- Example: 'Arecibo',
    state text                           -- Example: 'NY',
    PRIMARY KEY (zip_code, county),
    FOREIGN KEY (state) REFERENCES state(abbreviation),
    FOREIGN KEY (zip_code) REFERENCES zip_data(zip_code)
);

CREATE TABLE zip_congress (
    zip_code integer                     -- Example: 501,
    district text                        -- Example: 'NY-1',
    PRIMARY KEY (zip_code, district),
    FOREIGN KEY (zip_code) REFERENCES zip_data(zip_code),
    FOREIGN KEY (district) REFERENCES congress(cognress_rep_id)
);