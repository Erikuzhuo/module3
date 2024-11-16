create database QuanLySinhVien;
use QuanLySinhVien;

CREATE TABLE Class (
    ClassID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME NOT NULL,
    Status BIT
);

CREATE TABLE Student (
    StudentID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(30) NOT NULL,
    Address TEXT,
    Phone VARCHAR(20),
    Status BIT,
    ClassID INT NOT NULL,
    FOREIGN KEY (ClassID)
        REFERENCES Class (ClassID)
);

CREATE TABLE Subjects (
    SubID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    SubName VARCHAR(30) NOT NULL,
    Credit TINYINT NOT NULL DEFAULT 1 CHECK (credit >= 1),
    Status BIT DEFAULT 1
);

CREATE TABLE Mark (
    MarkID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    SubID INT NOT NULL,
    StudentID INT NOT NULL,
    Mark FLOAT DEFAULT 0 CHECK (Mark BETWEEN 0 AND 100),
    UNIQUE (SubID , StudentID),
    FOREIGN KEY (SubID)
        REFERENCES Subjects (SubID),
    FOREIGN KEY (StudentID)
        REFERENCES Student (StudentID),
    ExamTimes TINYINT DEFAULT 1
);

INSERT INTO Class (ClassName, StartDate, Status)
VALUES 
    ('A1', '2008-12-20', 1),
    ('A2', '2008-12-20', 1),
    ('B3', CURRENT_DATE(), 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES 
('Hung', 'Ha Noi', '0912113113', 1, 1),
('Hoa', 'Hai phong','',1, 1),
('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subjects
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);

INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 
SELECT 
    *
FROM
    student;
 
SELECT 
    s.*
FROM
    student s
WHERE
    status = TRUE;
 
SELECT 
    *
FROM
    Subjects
WHERE
    credit < 10;
 
SELECT 
    s.*, c.ClassName
FROM
    student s
        INNER JOIN
    class c ON s.classid = c.classid
WHERE
    classname = 'A1';
 
SELECT 
    s.studentname, m.mark, sub.Subname
FROM
    student s
        INNER JOIN
    mark m ON s.studentID = m.studentID
        INNER JOIN
    subjects sub ON m.SubID = sub.SubID
WHERE
    SubName = 'CF';
    
SELECT 
    *
FROM
    student
WHERE
    studentName LIKE 'h%';
    
SELECT 
    *
FROM
    class
WHERE
    MONTH(StartDate) = '12';
    
SELECT 
    *
FROM
    subjects
WHERE
    credit BETWEEN 3 AND 5;
    
SET SQL_SAFE_UPDATES = 0;

UPDATE Student 
SET 
    classID = 2
WHERE
    studentName = 'Hung';
    
SET SQL_SAFE_UPDATES = 1;

SELECT 
    s.StudentName, sub.SubName, m.Mark
FROM
    mark m
        JOIN
    Student s ON m.StudentID = s.StudentID
        JOIN
    Subjects sub ON m.SubID = sub.SubID
ORDER BY m.Mark DESC , s.StudentName ASC;

SELECT 
    Address, COUNT(StudentID) AS 'Number of Student'
FROM
    student
GROUP BY Address;

SELECT 
    s.studentName, AVG(mark)
FROM
    mark m
        JOIN
    Student s ON s.studentID = m.studentID
GROUP BY StudentName;

SELECT 
    s.studentName, AVG(mark)
FROM
    mark m
        JOIN
    Student s ON s.studentID = m.studentID
GROUP BY StudentName
HAVING AVG(mark) > 15;

SELECT 
    s.studentName, AVG(mark)
FROM
    mark m
        JOIN
    Student s ON s.studentID = m.studentID
GROUP BY StudentName
HAVING AVG(mark) >= ALL (SELECT 
        AVG(Mark)
    FROM
        Mark
    GROUP BY Mark.StudentId);
    
SELECT 
    *
FROM
    Subjects
WHERE
    credit = (SELECT 
            MAX(Credit)
        FROM
            Subjects);
    
    
SELECT 
    s.*, m.mark
FROM
    Subjects s
        JOIN
    Mark m ON s.SubID = m.SubID
WHERE
    mark = (SELECT 
            MAX(mark)
        FROM
            mark);