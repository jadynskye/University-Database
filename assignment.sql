-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS UniversityDB;

-- Set UniversityDB as the default schema
USE UniversityDB;


CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255) NOT NULL,
    DepartmentHead VARCHAR(255)
);

CREATE TABLE Professor (
    ProfessorID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255) UNIQUE,
    DepartmentID INT,
    Title VARCHAR(100),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255) UNIQUE,
    Major VARCHAR(100),
    EnrollmentDate DATE
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    DepartmentID INT,
    Credits INT,
    Description TEXT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY,
    CourseID INT,
    ProfessorID INT,
    TimeSlot VARCHAR(50),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (ProfessorID) REFERENCES Professor(ProfessorID)
);

CREATE TABLE Classroom (
    ClassroomID INT PRIMARY KEY,
    RoomNumber VARCHAR(20),
    Capacity INT,
    Building VARCHAR(100)
);

CREATE TABLE Enrollment (
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Grade CHAR(2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Department VALUES (1, 'Computer Science', 'Dr. Smith');
INSERT INTO Department VALUES (2, 'Mathematics', 'Dr. Johnson');

INSERT INTO Professor VALUES (101, 'John', 'Doe', 'jdoe@university.edu', 1, 'Associate Professor');
INSERT INTO Professor VALUES (102, 'Jane', 'Smith', 'jsmith@university.edu', 2, 'Professor');

INSERT INTO Student VALUES (201, 'Alice', 'Brown', 'aliceb@university.edu', 'Computer Science', '2023-09-01');
INSERT INTO Student VALUES (202, 'Bob', 'Green', 'bobg@university.edu', 'Mathematics', '2023-09-01');

INSERT INTO Course VALUES (301, 'Database Systems', 1, 4, 'Advanced SQL and database design.');
INSERT INTO Course VALUES (302, 'Calculus I', 2, 3, 'Introduction to differential calculus.');

INSERT INTO Schedule VALUES (401, 301, 101, 'MWF 10:00-11:00 AM');
INSERT INTO Schedule VALUES (402, 302, 102, 'TTh 2:00-3:30 PM');

INSERT INTO Classroom VALUES (501, 'A101', 30, 'Science Building');
INSERT INTO Classroom VALUES (502, 'B202', 40, 'Math Building');

INSERT INTO Enrollment VALUES (201, 301, '2024-01-10', 'A');
INSERT INTO Enrollment VALUES (202, 302, '2024-01-10', 'B');
