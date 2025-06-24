CREATE TABLE address_status (
    status_id integer PRIMARY KEY        -- Example: 1,
    address_status text                  -- Example: 'Active'
);

CREATE TABLE author (
    author_id integer PRIMARY KEY        -- Example: 1,
    author_name text                     -- Example: 'A. Bartlett Giamatti'
);

CREATE TABLE book_language (
    language_id integer PRIMARY KEY      -- Example: 1,
    language_code text                   -- Example: 'eng',
    language_name text                   -- Example: 'English'
);

CREATE TABLE country (
    country_id integer PRIMARY KEY       -- Example: 1,
    country_name text                    -- Example: 'Afghanistan'
);

CREATE TABLE address (
    address_id integer PRIMARY KEY       -- Example: 1,
    street_number text                   -- Example: '57',
    street_name text                     -- Example: 'Glacier Hill Avenue',
    city text                            -- Example: 'Torbat-e Jām',
    country_id integer                   -- Example: 95,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE TABLE customer (
    customer_id integer PRIMARY KEY      -- Example: 1,
    first_name text                      -- Example: 'Ursola',
    last_name text                       -- Example: 'Purdy',
    email text                           -- Example: 'upurdy0@cdbaby.com'
);

CREATE TABLE customer_address (
    customer_id integer                  -- Example: 1,
    address_id integer                   -- Example: 606,
    status_id integer                    -- Example: 1,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

CREATE TABLE order_status (
    status_id integer PRIMARY KEY        -- Example: 1,
    status_value text                    -- Example: 'Order Received'
);

CREATE TABLE publisher (
    publisher_id integer PRIMARY KEY     -- Example: 1,
    publisher_name text                  -- Example: '10/18'
);

CREATE TABLE book (
    book_id integer PRIMARY KEY          -- Example: 10693,
    title text                           -- Example: 'The World's First Love: Mary  Mother of God',
    isbn13 text                          -- Example: '8987059752',
    language_id integer                  -- Example: 12,
    num_pages integer                    -- Example: 276,
    publication_date date                -- Example: '1996-09-01',
    publisher_id integer                 -- Example: 1,
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

CREATE TABLE book_author (
    book_id integer                      -- Example: 1,
    author_id integer                    -- Example: 1,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

CREATE TABLE shipping_method (
    method_id integer PRIMARY KEY        -- Example: 1,
    method_name text                     -- Example: 'Standard',
    cost real                            -- Example: 5.9
);

CREATE TABLE cust_order (
    order_id integer PRIMARY KEY         -- Example: 1,
    order_date datetime                  -- Example: '2021-07-14 10:47:19',
    customer_id integer                  -- Example: 387,
    shipping_method_id integer           -- Example: 4,
    dest_address_id integer              -- Example: 1
);

CREATE TABLE order_history (
    history_id integer PRIMARY KEY       -- Example: 1,
    order_id integer                     -- Example: 1,
    status_id integer                    -- Example: 1,
    status_date datetime                 -- Example: '2021-07-14 17:04:28'
);

CREATE TABLE order_line (
    line_id integer PRIMARY KEY          -- Example: 1024,
    order_id integer                     -- Example: 2051,
    book_id integer                      -- Example: 10720,
    price real                           -- Example: 3.19
);