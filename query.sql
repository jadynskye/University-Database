-- Getting the first and last names of students along with the courses they're in 
SELECT Student.FirstName, Student.LastName, Course.CourseName 
FROM Student, Enrollment, Course 
WHERE Student.StudentID = Enrollment.StudentID 
AND Course.CourseID = Enrollment.CourseID;

-- Finding out which professor teaches which course  
SELECT Professor.FirstName, Professor.LastName, Course.CourseName 
FROM Professor 
JOIN Course ON Professor.DepartmentID = Course.DepartmentID;

-- Making a list of only the Computer Science students (because CS is the best!)
WITH CS_Students AS (
    SELECT * FROM Student WHERE Major = 'Computer Science'
)
SELECT * FROM CS_Students;

-- Getting all the classrooms that can fit more than 50 students (big rooms!)  
WITH High_Capacity AS (
    SELECT * FROM Classroom WHERE Capacity > 50
)
SELECT * FROM High_Capacity;

-- Counting how many professors work in each department
SELECT DepartmentID, COUNT(*) AS NumProfessors 
FROM Professor 
GROUP BY DepartmentID;

-- Checking the average number of credits per course
SELECT CourseID, AVG(Credits) AS AvgCredits 
FROM Course 
GROUP BY CourseID;

-- Finding students who are enrolled in course 101
SELECT FirstName, LastName FROM Student 
WHERE StudentID IN (SELECT StudentID FROM Enrollment WHERE CourseID = 101);

-- Checking what courses student 1001 is taking
SELECT CourseName FROM Course 
WHERE CourseID IN (SELECT CourseID FROM Enrollment WHERE StudentID = 1001);

-- Finding all students who are enrolled in at least one course
SELECT FirstName, LastName FROM Student s
WHERE EXISTS (SELECT 1 FROM Enrollment e WHERE e.StudentID = s.StudentID);

-- Finding all courses that have at least one student enrolled
SELECT CourseName FROM Course c
WHERE EXISTS (SELECT 1 FROM Enrollment e WHERE e.CourseID = c.CourseID);

-- Updating student 1001’s grade in course 101 to an A+ 
UPDATE Enrollment SET Grade = 'A+' WHERE StudentID = 1001 AND CourseID = 101;

-- Changing student 1002’s major to Physics
UPDATE Student SET Major = 'Physics' WHERE StudentID = 1002;

-- Sorting students by their last names 
SELECT FirstName, LastName 
FROM Student 
ORDER BY LastName;

-- Removing student 1001 from course 101
DELETE FROM Enrollment 
WHERE StudentID = 1001 
AND CourseID = 101;

-- Adding student 1001 to course 102 with a grade of B+
INSERT INTO Enrollment (StudentID, CourseID, EnrollmentDate, Grade) VALUES (1001, 102, '2023-09-01', 'B+');

-- Getting courses that have at least 3 credits
SELECT CourseName, Credits 
FROM Course 
WHERE Credits >= 3;

-- Finding students whose email ends with 'university.edu'
SELECT FirstName, LastName, Major 
FROM Student 
WHERE Email 
LIKE '%university.edu';

-- Showing all students and their grades, even if they don’t have one yet
SELECT s.FirstName, s.LastName, e.Grade 
FROM Student s 
LEFT OUTER JOIN Enrollment e ON s.StudentID = e.StudentID;

-- Creating a view for all CS courses
CREATE VIEW CS_Courses AS 
SELECT * FROM Course WHERE DepartmentID = 1;

-- Checking all the CS courses
SELECT * FROM CS_Courses;

-- Adding a rule to make sure course credits are always greater than 0
ALTER TABLE Course 
ADD CONSTRAINT chk_Credits 
CHECK (Credits > 0);











