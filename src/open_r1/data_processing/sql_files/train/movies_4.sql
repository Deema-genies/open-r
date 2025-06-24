CREATE TABLE country (
    country_id integer PRIMARY KEY       -- Example: 128,
    country_iso_code text                -- Example: 'AE',
    country_name text                    -- Example: 'United Arab Emirates'
);

CREATE TABLE department (
    department_id integer PRIMARY KEY    -- Example: 1,
    department_name text                 -- Example: 'Camera'
);

CREATE TABLE gender (
    gender_id integer PRIMARY KEY        -- Example: 0,
    gender text                          -- Example: 'Unspecified'
);

CREATE TABLE genre (
    genre_id integer PRIMARY KEY         -- Example: 12,
    genre_name text                      -- Example: 'Adventure'
);

CREATE TABLE keyword (
    keyword_id integer PRIMARY KEY       -- Example: 1,
    keyword_name text                    -- Example: 'Finding'
);

CREATE TABLE language (
    language_id integer PRIMARY KEY      -- Example: 24574,
    language_code text                   -- Example: 'en',
    language_name text                   -- Example: 'English'
);

CREATE TABLE language_role (
    role_id integer PRIMARY KEY          -- Example: 1,
    language_role text                   -- Example: 'Original'
);

CREATE TABLE movie (
    movie_id integer PRIMARY KEY         -- Example: 5,
    title text                           -- Example: 'Four Rooms',
    budget integer                       -- Example: 4000000,
    homepage text                        -- Example: '',
    overview text                        -- Example: 'It's Ted the Bellhop's first night on the job...and the hotel's very unusual gue',
    popularity real                      -- Example: 22.87623,
    release_date date                    -- Example: '1995-12-09',
    revenue integer                      -- Example: 4300000,
    runtime integer                      -- Example: 98,
    movie_status text                    -- Example: 'Released',
    tagline text                         -- Example: 'Twelve outrageous guests. Four scandalous requests. And one lone bellhop, in his',
    vote_average real                    -- Example: 6.5,
    vote_count integer                   -- Example: 530
);

CREATE TABLE movie_genres (
    movie_id integer                     -- Example: 5,
    genre_id integer                     -- Example: 35,
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE movie_languages (
    movie_id integer                     -- Example: 5,
    language_id integer                  -- Example: 24574,
    language_role_id integer             -- Example: 2,
    FOREIGN KEY (language_role_id) REFERENCES language_role(role_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (language_id) REFERENCES language(language_id)
);

CREATE TABLE person (
    person_id integer PRIMARY KEY        -- Example: 1,
    person_name text                     -- Example: 'George Lucas'
);

CREATE TABLE movie_crew (
    movie_id integer                     -- Example: 285,
    person_id integer                    -- Example: 120,
    department_id integer                -- Example: 1,
    job text                             -- Example: 'Director of Photography',
    FOREIGN KEY (person_id) REFERENCES person(person_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE production_company (
    company_id integer PRIMARY KEY       -- Example: 1,
    company_name text                    -- Example: 'Lucasfilm'
);

CREATE TABLE production_country (
    movie_id integer                     -- Example: 5,
    country_id integer                   -- Example: 214,
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE TABLE movie_cast (
    movie_id integer                     -- Example: 285,
    person_id integer                    -- Example: 85,
    character_name text                  -- Example: 'Captain Jack Sparrow',
    gender_id integer                    -- Example: 2,
    cast_order integer                   -- Example: 0,
    FOREIGN KEY (person_id) REFERENCES person(person_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (gender_id) REFERENCES gender(gender_id)
);

CREATE TABLE movie_keywords (
    movie_id integer                     -- Example: 5,
    keyword_id integer                   -- Example: 612
);

CREATE TABLE movie_company (
    movie_id integer                     -- Example: 5,
    company_id integer                   -- Example: 14
);