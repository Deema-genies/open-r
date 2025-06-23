CREATE TABLE course (
    course_id integer PRIMARY KEY        -- Example: 0,
    courseLevel text                     -- Example: 'Senior'
);

CREATE TABLE person (
    p_id integer PRIMARY KEY             -- Example: 3,
    professor integer                    -- Example: 0,
    student integer                      -- Example: 1,
    hasPosition text                     -- Example: '0',
    inPhase text                         -- Example: '0',
    yearsInProgram text                  -- Example: '0'
);

CREATE TABLE advisedBy (
    p_id integer                         -- Example: 6,
    p_id_dummy integer                   -- Example: 5,
    PRIMARY KEY (p_id, p_id_dummy),
    FOREIGN KEY (p_id) REFERENCES person(p_id),
    FOREIGN KEY (p_id_dummy) REFERENCES person(p_id)
);

CREATE TABLE taughtBy (
    course_id integer                    -- Example: NULL,
    p_id integer                         -- Example: NULL,
    PRIMARY KEY (course_id, p_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (p_id) REFERENCES person(p_id)
);