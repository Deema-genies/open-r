CREATE TABLE film_text (
    film_id integer PRIMARY KEY          -- Example: 1,
    title text                           -- Example: 'ACADEMY DINOSAUR',
    description text                     -- Example: 'A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The '
);

CREATE TABLE actor (
    actor_id integer PRIMARY KEY         -- Example: 1,
    first_name text                      -- Example: 'PENELOPE',
    last_name text                       -- Example: 'GUINESS',
    last_update datetime                 -- Example: '2006-02-15 04:34:33.0'
);

CREATE TABLE address (
    address_id integer PRIMARY KEY       -- Example: 1,
    address text                         -- Example: '47 MySakila Drive',
    address2 text                        -- Example: '',
    district text                        -- Example: 'Alberta',
    city_id integer                      -- Example: 300,
    postal_code text                     -- Example: '',
    phone text                           -- Example: '',
    last_update datetime                 -- Example: '2006-02-15 04:45:30.0'
);

CREATE TABLE category (
    category_id integer PRIMARY KEY      -- Example: 1,
    name text                            -- Example: 'Action',
    last_update datetime                 -- Example: '2006-02-15 04:46:27.0'
);

CREATE TABLE city (
    city_id integer PRIMARY KEY          -- Example: 1,
    city text                            -- Example: 'A Corua (La Corua)',
    country_id integer                   -- Example: 87,
    last_update datetime                 -- Example: '2006-02-15 04:45:25.0'
);

CREATE TABLE country (
    country_id integer PRIMARY KEY       -- Example: 1,
    country text                         -- Example: 'Afghanistan',
    last_update datetime                 -- Example: '2006-02-15 04:44:00.0'
);

CREATE TABLE customer (
    customer_id integer PRIMARY KEY      -- Example: 1,
    store_id integer                     -- Example: 1,
    first_name text                      -- Example: 'MARY',
    last_name text                       -- Example: 'SMITH',
    email text                           -- Example: 'MARY.SMITH@sakilacustomer.org',
    address_id integer                   -- Example: 5,
    active integer                       -- Example: 1,
    create_date datetime                 -- Example: '2006-02-14 22:04:36.0',
    last_update datetime                 -- Example: '2006-02-15 04:57:20.0'
);

CREATE TABLE film (
    film_id integer PRIMARY KEY          -- Example: 1,
    title text                           -- Example: 'ACADEMY DINOSAUR',
    description text                     -- Example: 'A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The ',
    release_year text                    -- Example: '2006',
    language_id integer                  -- Example: 1,
    original_language_id integer         -- Example: NULL,
    rental_duration integer              -- Example: 6,
    rental_rate real                     -- Example: 0.99,
    length integer                       -- Example: 86,
    replacement_cost real                -- Example: 20.99,
    rating text                          -- Example: 'NC-17',
    special_features text                -- Example: 'N/A',
    last_update datetime                 -- Example: '2006-02-15 05:03:42.0'
);

CREATE TABLE film_actor (
    actor_id integer                     -- Example: 1,
    film_id integer                      -- Example: 1,
    last_update datetime                 -- Example: '2006-02-15 05:05:03.0',
    PRIMARY KEY (actor_id, film_id)
);

CREATE TABLE film_category (
    film_id integer                      -- Example: 1,
    category_id integer                  -- Example: 6,
    last_update datetime                 -- Example: '2006-02-15 05:07:09.0',
    PRIMARY KEY (film_id, category_id)
);

CREATE TABLE inventory (
    inventory_id integer PRIMARY KEY     -- Example: 1,
    film_id integer                      -- Example: 1,
    store_id integer                     -- Example: 1,
    last_update datetime                 -- Example: '2006-02-15 05:09:17.0'
);

CREATE TABLE language (
    language_id integer PRIMARY KEY      -- Example: 1,
    name text                            -- Example: 'English',
    last_update datetime                 -- Example: '2006-02-15 05:02:19.0'
);

CREATE TABLE payment (
    payment_id integer PRIMARY KEY       -- Example: 1,
    customer_id integer                  -- Example: 1,
    staff_id integer                     -- Example: 1,
    rental_id integer                    -- Example: 76,
    amount real                          -- Example: 2.99,
    payment_date datetime                -- Example: '2005-05-25 11:30:37.0',
    last_update datetime                 -- Example: '2006-02-15 22:12:30.0'
);

CREATE TABLE rental (
    rental_id integer PRIMARY KEY        -- Example: 1,
    rental_date datetime                 -- Example: '2023-04-01',
    inventory_id integer                 -- Example: 1,
    customer_id integer                  -- Example: 1,
    return_date datetime                 -- Example: '2023-04-07',
    staff_id integer                     -- Example: 1,
    last_update datetime                 -- Example: '2023-04-07'
);

CREATE TABLE staff (
    staff_id integer PRIMARY KEY         -- Example: 1,
    first_name text                      -- Example: 'Mike',
    last_name text                       -- Example: 'Hillyer',
    address_id integer                   -- Example: 3,
    picture blob                         -- Example: '0x3F504E470D0A1A0A0000000D4948445200000079000000750802000000E55AD965000000097048',
    email text                           -- Example: 'Mike.Hillyer@sakilastaff.com',
    store_id integer                     -- Example: 1,
    active integer                       -- Example: 1,
    username text                        -- Example: 'Mike',
    password text                        -- Example: '8cb2237d0679ca88db6464eac60da96345513964',
    last_update datetime                 -- Example: '2006-02-15 04:57:16.0'
);

CREATE TABLE store (
    store_id integer PRIMARY KEY         -- Example: 1,
    manager_staff_id integer             -- Example: 1,
    address_id integer                   -- Example: 1,
    last_update datetime                 -- Example: '2006-02-15 04:57:12.0'
);