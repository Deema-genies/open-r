CREATE TABLE coins (
    id integer PRIMARY KEY               -- Example: 1,
    name text                            -- Example: '#MetaHash',
    slug text                            -- Example: 'bitcoin',
    symbol text                          -- Example: '$$$',
    status text                          -- Example: 'active',
    category text                        -- Example: 'coin',
    description text                     -- Example: '## **What Is Bitcoin (BTC)?**\n\nBitcoin is a decentralized cryptocurrency origi',
    subreddit text                       -- Example: 'bitcoin',
    notice text                          -- Example: 'TIPS has undergone a [swap](https://bitcointalk.org/index.php?topic=5137508.0) t',
    tags text                            -- Example: 'mineable, pow, sha-256, store-of-value, state-channels, coinbase-ventures-portfo',
    tag_names text                       -- Example: 'Mineable, PoW, SHA-256, Store of Value, State channels, Coinbase Ventures Portfo',
    website text                         -- Example: 'https://bitcoin.org/',
    platform_id integer                  -- Example: 1027,
    date_added text                      -- Example: '2013-04-28T00:00:00.000Z',
    date_launched text                   -- Example: '2018-01-16T00:00:00.000Z'
);

CREATE TABLE historical (
    date date                            -- Example: '2013-04-29',
    coin_id integer                      -- Example: 1,
    cmc_rank integer                     -- Example: 1,
    market_cap real                      -- Example: 1603768790.0051138,
    price real                           -- Example: 0.0,
    open real                            -- Example: 0.0,
    high real                            -- Example: 147.48800659179688,
    low real                             -- Example: 134.0,
    close real                           -- Example: 144.5399932861328,
    time_high text                       -- Example: '13:15:01',
    time_low text                        -- Example: '05:20:01',
    volume_24h real                      -- Example: 0.0,
    percent_change_1h real               -- Example: 1.22996,
    percent_change_24h real              -- Example: 7.63553,
    percent_change_7d real               -- Example: -13.809,
    circulating_supply real              -- Example: 11095675.0,
    total_supply real                    -- Example: 11095675.0,
    max_supply real                      -- Example: 21000000.0,
    num_market_pairs integer             -- Example: 7050
);