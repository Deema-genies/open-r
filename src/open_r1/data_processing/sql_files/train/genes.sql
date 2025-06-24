CREATE TABLE Classification (
    GeneID text PRIMARY KEY              -- Example: 'G234064',
    Localization text                    -- Example: 'cytoplasm'
);

CREATE TABLE Genes (
    GeneID text                          -- Example: 'G234064',
    Essential text                       -- Example: 'Essential',
    Class text                           -- Example: 'GTP/GDP-exchange factors (GEFs)',
    Complex text                         -- Example: 'Translation complexes',
    Phenotype text                       -- Example: '?',
    Motif text                           -- Example: 'PS00824',
    Chromosome integer                   -- Example: 1,
    Function text                        -- Example: 'METABOLISM',
    Localization text                    -- Example: 'cytoplasm',
    FOREIGN KEY (GeneID) REFERENCES Classification(GeneID)
);

CREATE TABLE Interactions (
    GeneID1 text                         -- Example: 'G234064',
    GeneID2 text                         -- Example: 'G234126',
    Type text                            -- Example: 'Genetic-Physical',
    Expression_Corr real                 -- Example: 0.914095071,
    PRIMARY KEY (GeneID1, GeneID2),
    FOREIGN KEY (GeneID2) REFERENCES Classification(GeneID),
    FOREIGN KEY (GeneID1) REFERENCES Classification(GeneID)
);