-- Active: 1700695511502@@127.0.0.1@5432@test
-- ## create a student TABLE;
-- CREATE TABLE student (
--     student_id INT,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     cgpa NUMERIC(1,2)
-- )

-- ## rename a table 
-- ALTER TABLE student RENAME TO learners

-- ## delete a table 
-- DROP Table users


--  create table with constraints 
-- CREATE TABLE users (
--     user_id SERIAL PRIMARY KEY,
--     username VARCHAR(255) UNIQUE,
--     email VARCHAR(244) UNIQUE
-- )
-- CREATE TABLE users (
--     user_id SERIAL PRIMARY KEY,
--     username VARCHAR(255) UNIQUE NOT NULL,
--     email VARCHAR(244) UNIQUE NOT NULL
-- )

-- CREATE TABLE user1 (
--     user_id SERIAL ,
--     username VARCHAR(255) UNIQUE,
--     email VARCHAR(244) UNIQUE,
--     PRIMARY KEY(user_id, username)
-- )

CREATE TABLE user1 (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE,
    email VARCHAR(244) UNIQUE,
    age INT DEFAULT 18
)

-- ## insert data in a table;
-- INSERT INTO user1 VALUES(1, 'abc', 'abs@gmail.com');
-- INSERT INTO user1(user_id, username, email, age) VALUES(2, 'amena', 'amar@gg', 44)

INSERT INTO user1 (username, email) 
VALUES
('amena', 'amar@mai.com'),
('sultana', 'sultana@gmail.com');

-- ## delete all rows in a table without deleting the table;
TRUNCATE TABLE user1

-- ## alter table;
-- ## add a column, drop a column, change a datatype of column;
-- ## rename a column, set DEFAULT VALUE for a column;
-- ## add CONSTRAINT to a column
-- ALTER Table table_name action 

-- add a column
ALTER TABLE user1
add COLUMN password VARCHAR(255) DEFAULT '12345' NOT NULL;


-- drop a column
DROP age;

-- change datatype of a column
ALTER TABLE user1 add COLUMN demo INT;
ALTER TABLE user1
    alter COLUMN demo type TEXT;


-- set DEFAULT VALUE for a column
ALTER Table user1
     alter demo set DEFAULT 'Bangladesh';

-- drop DEFAULT VALUE for a column
ALTER Table user1
     alter demo DROP DEFAULT;


-- rename a column
ALTER Table user1
    RENAME COLUMN demo to country;


-- add CONSTRAINT to a column
ALTER TABLE user1
    alter COLUMN country set not NULL;

-- drop CONSTRAINT to a column
ALTER TABLE user1
    alter COLUMN country DROP not NULL;

-- add CONSTRAINT 
ALTER TABLE user1
    add constraint unique_email UNIQUE(email);

-- delete a CONSTRAINT 
ALTER TABLE user1
    DROP constraint unique_email;

--  remove all data from the table without key
-- TRUNCATE user1;

-- SELECT * FROM user1;





-- employee table 
-- each employee boloags a department
CREATE TABLE Employee(
    empId SERIAL PRIMARY KEY,
    empName VARCHAR(50) NOT NULL,
    departmentId INT,
    CONSTRAINT pk_contraint_dept
        FOREIGN KEY (departmentId)
        REFERENCES (depId)
);


