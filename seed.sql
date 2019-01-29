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

INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('28/01/2019', 1, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('28/01/2019', 2, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('28/01/2019', 3, 'Authorised Absense', 'Was Ill');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('28/01/2019', 4, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('28/01/2019', 5, '<5 Min Late', 'Bus Was Late');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('29/01/2019', 1, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('29/01/2019', 2, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('29/01/2019', 3, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('29/01/2019', 4, '>5 Min Late', 'Snow Causing Disruptions');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('29/01/2019', 5, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('30/01/2019', 1, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('30/01/2019', 2, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('30/01/2019', 3, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('30/01/2019', 4, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('30/01/2019', 5, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('31/01/2019', 1, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('31/01/2019', 2, 'Authorised Absense', 'Doctor appointment');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('31/01/2019', 3, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('31/01/2019', 4, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('31/01/2019', 5, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('01/02/2019', 1, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('01/02/2019', 2, 'UnAuthoised Absense', 'Kingdom Hearts Release?');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('01/02/2019', 3, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('01/02/2019', 4, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('01/02/2019', 5, 'On Time', '');
