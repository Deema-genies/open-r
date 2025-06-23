CREATE TABLE breweries (
    id integer PRIMARY KEY               -- Example: 0,
    name text                            -- Example: 'NorthGate Brewing ',
    city text                            -- Example: 'Minneapolis',
    state text                           -- Example: 'MN'
);

CREATE TABLE beers (
    id integer PRIMARY KEY               -- Example: 2687,
    brewery_id integer                   -- Example: 0,
    abv real                             -- Example: 0.065,
    ibu real                             -- Example: 65.0,
    name text                            -- Example: 'Dale's Pale Ale',
    style text                           -- Example: 'American Pale Ale (APA)',
    ounces real                          -- Example: 12.0
);