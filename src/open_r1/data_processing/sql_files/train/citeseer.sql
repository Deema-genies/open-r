CREATE TABLE cites (
    cited_paper_id text                  -- Example: '100157',
    citing_paper_id text                 -- Example: '100157',
    PRIMARY KEY (cited_paper_id, citing_paper_id)
);

CREATE TABLE paper (
    paper_id text PRIMARY KEY            -- Example: '100157',
    class_label text                     -- Example: 'Agents'
);

CREATE TABLE content (
    paper_id text                        -- Example: '100157',
    word_cited_id text                   -- Example: 'word1163',
    PRIMARY KEY (paper_id, word_cited_id),
    FOREIGN KEY (paper_id) REFERENCES paper(paper_id)
);