CREATE TABLE lists (
    user_id integer                      -- Example: 88260493,
    list_id integer PRIMARY KEY          -- Example: 196808,
    list_title text                      -- Example: '
Best Iranian 2000s ',
    list_movie_number integer            -- Example: 5,
    list_update_timestamp_utc text       -- Example: '2019-01-24 19:16:18',
    list_creation_timestamp_utc text     -- Example: '2009-11-11 00:02:21',
    list_followers integer               -- Example: 0,
    list_url text                        -- Example: 'http://mubi.com/lists/films-that-made-your-kid-sister-cry',
    list_comments integer                -- Example: 3,
    list_description text                -- Example: '<p>Don’t be such a baby!!</p>
<p><strong>bold</strong></p>',
    list_cover_image_url text            -- Example: 'https://assets.mubicdn.net/images/film/3822/image-w1280.jpg?1445914994',
    list_first_image_url text            -- Example: 'https://assets.mubicdn.net/images/film/3822/image-w320.jpg?1445914994',
    list_second_image_url text           -- Example: 'https://assets.mubicdn.net/images/film/506/image-w320.jpg?1543838422',
    list_third_image_url text            -- Example: 'https://assets.mubicdn.net/images/film/485/image-w320.jpg?1575331204',
    FOREIGN KEY (user_id) REFERENCES lists_users(user_id)
);

CREATE TABLE movies (
    movie_id integer PRIMARY KEY         -- Example: 114131,
    movie_title text                     -- Example: '! Women Art Revolution',
    movie_release_year integer           -- Example: 0,
    movie_url text                       -- Example: 'http://mubi.com/films/la-antena',
    movie_title_language text            -- Example: 'en',
    movie_popularity integer             -- Example: 105,
    movie_image_url text                 -- Example: 'https://images.mubicdn.net/images/film/1/cache-7927-1581389497/image-w1280.jpg',
    director_id text                     -- Example: '131',
    director_name text                   -- Example: '(Unknown)',
    director_url text                    -- Example: 'http://mubi.com/cast/esteban-sapir'
);

CREATE TABLE ratings_users (
    user_id integer                      -- Example: 57,
    rating_date_utc text                 -- Example: '2017-06-10',
    user_trialist integer                -- Example: 0,
    user_subscriber integer              -- Example: 0,
    user_avatar_image_url text           -- Example: '//mubi.com/assets/placeholders/avatar-c68833eec06a12b110c74dd2fa1709ae983ead021e',
    user_cover_image_url text            -- Example: 'https://assets.mubicdn.net/images/cover_images/37844/images-small.png?1444549039',
    user_eligible_for_trial integer      -- Example: 1,
    user_has_payment_method integer      -- Example: 0,
    FOREIGN KEY (user_id) REFERENCES lists_users(user_id)
);

CREATE TABLE lists_users (
    user_id integer                      -- Example: 2385,
    list_id integer                      -- Example: 192287,
    list_update_date_utc text            -- Example: '2019-11-26',
    list_creation_date_utc text          -- Example: '2009-12-18',
    user_trialist integer                -- Example: 1,
    user_subscriber integer              -- Example: 1,
    user_avatar_image_url text           -- Example: 'https://assets.mubicdn.net/images/avatars/74983/images-w150.jpg?1523895214',
    user_cover_image_url text            -- Example: 'https://assets.mubicdn.net/images/cover_images/12788/images-small.jpg?1406887796',
    user_eligible_for_trial text         -- Example: '0',
    user_has_payment_method text         -- Example: '1',
    PRIMARY KEY (user_id, list_id),
    FOREIGN KEY (user_id) REFERENCES lists(user_id),
    FOREIGN KEY (list_id) REFERENCES lists(list_id)
);

CREATE TABLE ratings (
    movie_id integer                     -- Example: 0,
    rating_id integer                    -- Example: 15610495,
    rating_url text                      -- Example: 'http://mubi.com/films/pavee-lackeen-the-traveller-girl/ratings/15610495',
    rating_score integer                 -- Example: 1,
    rating_timestamp_utc text            -- Example: '1970-01-01 00:00:00',
    critic text                          -- Example: 'I am a bit disappointed by this documentary film I've been wanting to watch for ',
    critic_likes integer                 -- Example: 0,
    critic_comments integer              -- Example: 0,
    user_id integer                      -- Example: 57,
    user_trialist integer                -- Example: 0,
    user_subscriber integer              -- Example: 0,
    user_eligible_for_trial integer      -- Example: 1,
    user_has_payment_method integer      -- Example: 0,
    FOREIGN KEY (user_id) REFERENCES ratings_users(user_id),
    FOREIGN KEY (user_id) REFERENCES lists_users(user_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);