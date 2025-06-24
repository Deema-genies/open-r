CREATE TABLE playstore (
    App text                             -- Example: 'PhotoEditor&CandyCamera&Grid&ScrapBook',
    Category text                        -- Example: 'ART_AND_DESIGN',
    Rating real                          -- Example: 4.1,
    Reviews integer                      -- Example: 159,
    Size text                            -- Example: '19M',
    Installs text                        -- Example: '10000',
    Type text                            -- Example: 'Free',
    Price text                           -- Example: '0',
    Content Rating text                  -- Example: 'Everyone',
    Genres text                          -- Example: 'Art & Design'
);

CREATE TABLE user_reviews (
    App text                             -- Example: '10 Best Foods for You',
    Translated_Review text               -- Example: 'I like eat delicious food. That's I'm cooking food myself, case "10 Best Foods" ',
    Sentiment text                       -- Example: 'Positive',
    Sentiment_Polarity text              -- Example: '1.0',
    Sentiment_Subjectivity text          -- Example: '0.5333333333333333',
    FOREIGN KEY (App) REFERENCES playstore(App)
);