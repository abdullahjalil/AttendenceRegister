DROP TABLE IF EXISTS attendence;
DROP TABLE IF EXISTS students;


CREATE TABLE students (
  studentid SERIAL PRIMARY KEY,
  firstname VARCHAR(40),
  lastname VARCHAR(40)
);

CREATE TABLE attendence (
  studentid INT,
  FOREIGN KEY(studentid) REFERENCES students(studentid),
  dateofattendence DATE DEFAULT now(),
  status VARCHAR(25),
  comment VARCHAR (255)
);

<<<<<<< HEAD

-- CREATE PROCEDURE table_insert()
-- BEGIN
--   DECLARE n INT DEFAULT 1;
--   FOR n IN 1..10 LOOP
--     INSERT INTO students (firstname, lastname) VALUES ('Student_FN','Student_LN');
--     INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES (now(), 1, 'Authorised Absence', 'Was ill');
--     -- SET n = n + 1;
--   END LOOP;
-- END;
--
INSERT INTO students (firstname, lastname) VALUES ('Student1_FN','Student1_LN');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES (now(), 1, 'Authorised Absence', 'Was ill');
INSERT INTO students (firstname, lastname) VALUES ('Student2_FN','Student2_LN');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES (now(), 2, 'Authorised Absence', 'Was ill');
INSERT INTO students (firstname, lastname) VALUES ('Student3_FN','Student3_LN');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES (now(), 3, 'Authorised Absence', 'Was ill');
INSERT INTO students (firstname, lastname) VALUES ('Student4_FN','Student4_LN');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES (now(), 4, 'Authorised Absence', 'Was ill');
INSERT INTO students (firstname, lastname) VALUES ('Student5_FN','Student5_LN');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES (now(), 5, 'Authorised Absence', 'Was ill');
=======
INSERT INTO students (firstname, lastname) VALUES ('Student_FN','Student_LN');
INSERT INTO students (firstname, lastname) VALUES ('Student_FN','Student_LN');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES (now(), 1, 'Authorised Absence', 'Was ill');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES (now(), 2, 'Authorised Absence', 'Was ill');
>>>>>>> master
