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
