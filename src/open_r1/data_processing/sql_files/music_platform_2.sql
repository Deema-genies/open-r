CREATE TABLE runs (
    run_at text                          -- Example: '2021-05-10 02:53:00',
    max_rowid integer                    -- Example: 3266481,
    reviews_added integer                -- Example: 1215223
);

CREATE TABLE podcasts (
    podcast_id text PRIMARY KEY          -- Example: 'a00018b54eb342567c94dacfb2a3e504',
    itunes_id integer                    -- Example: 1313466221,
    slug text                            -- Example: 'scaling-global',
    itunes_url text                      -- Example: 'https://podcasts.apple.com/us/podcast/scaling-global/id1313466221',
    title text                           -- Example: 'Scaling Global'
);

CREATE TABLE reviews (
    podcast_id text                      -- Example: 'c61aa81c9b929a66f0c1db6cbe5d8548',
    title text                           -- Example: 'really interesting!',
    content text                         -- Example: 'Thanks for providing these insights.  Really enjoy the variety and depth -- plea',
    rating integer                       -- Example: 5,
    author_id text                       -- Example: 'F7E5A318989779D',
    created_at text                      -- Example: '2018-04-24T12:05:16-07:00'
);

CREATE TABLE categories (
    podcast_id text                      -- Example: 'a00018b54eb342567c94dacfb2a3e504',
    category text                        -- Example: 'arts',
    PRIMARY KEY (podcast_id, category)
);