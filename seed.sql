DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Attendence;

CREATE TABLE Students (
  StudentID SERIAL PRIMARY KEY,
  FirstName VARCHAR(20),
  LastName VARCHAR(20)
);

CREATE TABLE Attendence (
  StudentID INT,
  FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
  DateOfAttendence DATE,
  Status VARCHAR(25),
  Comment VARCHAR (255)
);

INSERT INTO Students (FirstName, LastName) VALUES ('Student_FN','Student_LN');
INSERT INTO sandwich (title, description) VALUES ('Jam','Description 2');
INSERT INTO sandwich (title, description) VALUES ('Spam','Description 3');
INSERT INTO sandwich (title, description) VALUES ('Clam','Description 4');
INSERT INTO sandwich (title, description) VALUES ('Lamb','Description 5');
