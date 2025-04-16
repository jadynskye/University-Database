CREATE DATABASE universityydb;
USE universityydb;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    DepartmentHead INT
);

CREATE TABLE Professor (
    ProfessorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    DepartmentID INT,
    Title VARCHAR(50),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Major VARCHAR(50),
    EnrollmentDate DATE
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    DepartmentID INT,
    Description TEXT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Classroom (
    ClassroomID INT PRIMARY KEY,
    RoomNumber VARCHAR(10) NOT NULL,
    Capacity INT NOT NULL,
    Building VARCHAR(50) NOT NULL
);

CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY,
    CourseID INT,
    ProfessorID INT,
    TimeSlot VARCHAR(50) NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (ProfessorID) REFERENCES Professor(ProfessorID)
);

CREATE TABLE Enrollment (
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Grade VARCHAR(2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Department (DepartmentID, DepartmentName, DepartmentHead) VALUES
(1, 'Computer Science', NULL),
(2, 'Mathematics', NULL);

INSERT INTO Professor (ProfessorID, FirstName, LastName, Email, DepartmentID, Title) VALUES
(1, 'Alice', 'Smith', 'alice.smith@university.edu', 1, 'Associate Professor'),
(2, 'Bob', 'Johnson', 'bob.johnson@university.edu', 2, 'Professor');

INSERT INTO Student (StudentID, FirstName, LastName, Email, Major, EnrollmentDate) VALUES
(1001, 'Charlie', 'Brown', 'charlie.brown@university.edu', 'Computer Science', '2023-08-15'),
(1002, 'Diana', 'Prince', 'diana.prince@university.edu', 'Mathematics', '2023-08-20');

INSERT INTO Course (CourseID, CourseName, Credits, DepartmentID, Description) VALUES
(101, 'Database Systems', 3, 1, 'Introduction to relational databases'),
(102, 'Calculus I', 4, 2, 'Differential and integral calculus');

INSERT INTO Enrollment (StudentID, CourseID, EnrollmentDate, Grade) VALUES
(1001, 101, '2023-09-01', 'A'),
(1002, 102, '2023-09-01', 'B');

-- Create Customer Table
CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

-- Create Product Table
CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT
);

-- Create CustomerOrder Table
CREATE TABLE CustomerOrder (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailsID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES CustomerOrder(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
CREATE TABLE Payroll (
    PayrollID INT AUTO_INCREMENT PRIMARY KEY,
    ProfessorID INT,
    Salary DECIMAL(10, 2),
    Month VARCHAR(20),
    Year INT,
    FOREIGN KEY (ProfessorID) REFERENCES Professor(ProfessorID)
);

