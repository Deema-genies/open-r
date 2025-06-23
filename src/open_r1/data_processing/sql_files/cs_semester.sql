CREATE TABLE course (
    course_id integer PRIMARY KEY        -- Example: 1,
    name text                            -- Example: 'Machine Learning Theory',
    credit integer                       -- Example: 3,
    diff integer                         -- Example: 3
);

CREATE TABLE prof (
    prof_id integer PRIMARY KEY          -- Example: 1,
    gender text                          -- Example: 'Male',
    first_name text                      -- Example: 'Nathaniel',
    last_name text                       -- Example: 'Pigford',
    email text                           -- Example: 'npigford0@hku.hk',
    popularity integer                   -- Example: 3,
    teachingability integer              -- Example: 5,
    graduate_from text                   -- Example: 'University of Washington'
);

CREATE TABLE RA (
    student_id integer                   -- Example: 2,
    capability integer                   -- Example: 2,
    prof_id integer                      -- Example: 7,
    salary text                          -- Example: 'med',
    PRIMARY KEY (student_id, prof_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (prof_id) REFERENCES prof(prof_id)
);

CREATE TABLE registration (
    course_id integer                    -- Example: 1,
    student_id integer                   -- Example: 2,
    grade text                           -- Example: 'A',
    sat integer                          -- Example: 5,
    PRIMARY KEY (course_id, student_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE student (
    student_id integer PRIMARY KEY       -- Example: 1,
    f_name text                          -- Example: 'Kerry',
    l_name text                          -- Example: 'Pryor',
    phone_number text                    -- Example: '(243) 6836472',
    email text                           -- Example: 'kpryor0@hku.hk',
    intelligence integer                 -- Example: 5,
    gpa real                             -- Example: 2.4,
    type text                            -- Example: 'RPG'
);