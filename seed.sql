DROP TABLE IF EXISTS Attendence;
DROP TABLE IF EXISTS Students;

CREATE TABLE Students (
  StudentID SERIAL PRIMARY KEY,
  FirstName VARCHAR(20),
  LastName VARCHAR(20)
);

CREATE TABLE Attendence (
  StudentID INT,
  FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
  DateOfAttendence DATE DEFAULT now(),
  Status VARCHAR(25),
  Comment VARCHAR (255)
);

INSERT INTO Students (FirstName, LastName) VALUES ('Student_FN','Student_LN');
INSERT INTO Attendence (DateOfAttendence, Status, Comment) VALUES (now(),'Authorised Absence', 'Was ill');
