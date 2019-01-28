DROP TABLE IF EXISTS attendence;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
  studentid SERIAL PRIMARY KEY,
  firstname VARCHAR(20),
  lastname VARCHAR(20)
);

CREATE TABLE attendence (
  studentid INT,
  FOREIGN KEY(studentid) REFERENCES students(studentid),
  dateofattendence DATE DEFAULT now(),
  status VARCHAR(25),
  comment VARCHAR (255)
);

INSERT INTO students (firstname, lastname) VALUES ('Student_FN','Student_LN');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES (now(), 1, 'Authorised Absence', 'Was ill');
