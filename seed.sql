DROP TABLE IF EXISTS attendence;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS groups;

CREATE TABLE groups (
  groupid SERIAL PRIMARY KEY,
  groupname CHAR(5),
  grouptype VARCHAR(11)
);

CREATE TABLE students (
  studentid SERIAL PRIMARY KEY,
  firstname VARCHAR(40),
  lastname VARCHAR(40),
  groupid INT,
  bio VARCHAR(255)
);

CREATE TABLE attendence (
  attendenceid SERIAL PRIMARY KEY,
  studentid INT,
  FOREIGN KEY(studentid) REFERENCES students(studentid),
  dateofattendence DATE DEFAULT now(),
  status VARCHAR(25),
  comment VARCHAR (255)
);

INSERT INTO groups (groupname, rrouptype) VALUES ('None.'), 'Unassigned');
INSERT INTO groups (groupname, grouptype) VALUES ('Eng23', 'Engineering');
INSERT INTO groups (groupname, grouptype) VALUES ('Bus18', 'Business');

INSERT INTO students (firstname, lastname, groupid) VALUES ('Studen1t_FN','Student1_LN', 2);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student2_FN','Student2_LN', 2);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student3_FN','Student3_LN', 3);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student4_FN','Student4_LN', 3);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student5_FN','Student5_LN', 2);

INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 1, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 2, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 3, 'Authorised Absence', 'Was Ill');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 4, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 5, '<5 Min Late', 'Bus Was Late');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/29', 1, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/29', 2, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/29', 3, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/29', 4, '>5 Min Late', 'Snow Causing Disruptions');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/29', 5, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/30', 1, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/30', 2, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/30', 3, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/30', 4, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/30', 5, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/31', 1, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/31', 2, 'Authorised Absence', 'Doctor appointment');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/31', 3, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/31', 4, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/31', 5, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/02/01', 1, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/02/01', 2, 'Unauthorised Absence', 'Kingdom Hearts Release?');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/02/01', 3, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/02/01', 4, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/02/01', 5, 'On Time', '');
