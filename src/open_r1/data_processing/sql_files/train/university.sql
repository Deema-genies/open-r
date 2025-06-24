CREATE TABLE country (
    id integer PRIMARY KEY               -- Example: 1,
    country_name text                    -- Example: 'Argentina'
);

CREATE TABLE ranking_system (
    id integer PRIMARY KEY               -- Example: 1,
    system_name text                     -- Example: 'Times Higher Education World University Ranking'
);

CREATE TABLE ranking_criteria (
    id integer PRIMARY KEY               -- Example: 1,
    ranking_system_id integer            -- Example: 1,
    criteria_name text                   -- Example: 'Teaching',
    FOREIGN KEY (ranking_system_id) REFERENCES ranking_system(id)
);

CREATE TABLE university (
    id integer PRIMARY KEY               -- Example: 1,
    country_id integer                   -- Example: 73,
    university_name text                 -- Example: 'Harvard University',
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE university_ranking_year (
    university_id integer                -- Example: 1,
    ranking_criteria_id integer          -- Example: 1,
    year integer                         -- Example: 2011,
    score integer                        -- Example: 100,
    FOREIGN KEY (university_id) REFERENCES university(id),
    FOREIGN KEY (ranking_criteria_id) REFERENCES ranking_criteria(id)
);

CREATE TABLE university_year (
    university_id integer                -- Example: 419,
    year integer                         -- Example: 2011,
    num_students integer                 -- Example: 10221,
    student_staff_ratio real             -- Example: 13.5,
    pct_international_students integer   -- Example: 5,
    pct_female_students integer          -- Example: 33,
    FOREIGN KEY (university_id) REFERENCES university(id)
);