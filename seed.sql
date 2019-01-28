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


INSERT INTO students (firstname, lastname) VALUES ('Studen1t_FN','Student1_LN');
INSERT INTO students (firstname, lastname) VALUES ('Student2_FN','Student2_LN');
INSERT INTO students (firstname, lastname) VALUES ('Student3_FN','Student3_LN');
INSERT INTO students (firstname, lastname) VALUES ('Student4_FN','Student4_LN');
INSERT INTO students (firstname, lastname) VALUES ('Student5_FN','Student5_LN');

INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES (now(), 1, 'Authorised Absence', 'Was ill');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES (now(), 2, 'Authorised Absence', 'Was ill');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES (now(), 3, 'Authorised Absence', 'Was ill');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES (now(), 4, 'Authorised Absence', 'Was ill');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES (now(), 5, 'Authorised Absence', 'Was ill');
