CREATE TABLE ATT_CLASSES (
    ATT_CLASS_ID integer PRIMARY KEY     -- Example: 0,
    ATT_CLASS text                       -- Example: 'building s'
);

CREATE TABLE OBJ_CLASSES (
    OBJ_CLASS_ID integer PRIMARY KEY     -- Example: 0,
    OBJ_CLASS text                       -- Example: 'awning'
);

CREATE TABLE IMG_OBJ (
    IMG_ID integer                       -- Example: 1,
    OBJ_SAMPLE_ID integer                -- Example: 1,
    OBJ_CLASS_ID integer                 -- Example: 298,
    X integer                            -- Example: 0,
    Y integer                            -- Example: 0,
    W integer                            -- Example: 799,
    H integer                            -- Example: 557,
    PRIMARY KEY (IMG_ID, OBJ_SAMPLE_ID),
    FOREIGN KEY (OBJ_CLASS_ID) REFERENCES OBJ_CLASSES(OBJ_CLASS_ID)
);

CREATE TABLE IMG_OBJ_ATT (
    IMG_ID integer                       -- Example: 1113,
    ATT_CLASS_ID integer                 -- Example: 0,
    OBJ_SAMPLE_ID integer                -- Example: 21,
    PRIMARY KEY (IMG_ID, ATT_CLASS_ID, OBJ_SAMPLE_ID),
    FOREIGN KEY (IMG_ID) REFERENCES IMG_OBJ(IMG_ID),
    FOREIGN KEY (OBJ_SAMPLE_ID) REFERENCES IMG_OBJ(OBJ_SAMPLE_ID),
    FOREIGN KEY (ATT_CLASS_ID) REFERENCES ATT_CLASSES(ATT_CLASS_ID)
);

CREATE TABLE PRED_CLASSES (
    PRED_CLASS_ID integer PRIMARY KEY    -- Example: 0,
    PRED_CLASS text                      -- Example: 'playing on'
);

CREATE TABLE IMG_REL (
    IMG_ID integer                       -- Example: 675,
    PRED_CLASS_ID integer                -- Example: 0,
    OBJ1_SAMPLE_ID integer               -- Example: 13,
    OBJ2_SAMPLE_ID integer               -- Example: 1,
    PRIMARY KEY (IMG_ID, PRED_CLASS_ID, OBJ1_SAMPLE_ID, OBJ2_SAMPLE_ID),
    FOREIGN KEY (IMG_ID) REFERENCES IMG_OBJ(IMG_ID),
    FOREIGN KEY (OBJ2_SAMPLE_ID) REFERENCES IMG_OBJ(OBJ_SAMPLE_ID),
    FOREIGN KEY (IMG_ID) REFERENCES IMG_OBJ(IMG_ID),
    FOREIGN KEY (OBJ1_SAMPLE_ID) REFERENCES IMG_OBJ(OBJ_SAMPLE_ID),
    FOREIGN KEY (PRED_CLASS_ID) REFERENCES PRED_CLASSES(PRED_CLASS_ID)
);