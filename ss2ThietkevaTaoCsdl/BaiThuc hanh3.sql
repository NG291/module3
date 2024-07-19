	CREATE DATABASE Quanlysinhvien;
    use Quanlysinhvien;
    CREATE TABLE Class(

		ClassID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		ClassName VARCHAR(60) NOT NULL,
		StartDate DATETIME NOT NULL,
		Status BIT
);
 CREATE TABLE Student(
 StudentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 StudentName VARCHAR(30) NOT NULL,
 Address VARCHAR(50) NOT NULL,
 Phone VARCHAR(20),
Status BIT,
ClassID INT NOT NULL
 );
 CREATE TABLE Subject(
 SubID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 SubName VARCHAR(30) NOT NULL,
 Credit TINYiNT NOT NULL DEFAULT 1 CHECK(Credit >=1),
 Status BIT  DEFAULT 1);
 
 CREATE TABLE Mark(
 MarkID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 SubID INT NOT NULL,
 StudentID INT NOT NULL,
 Mark FLOAT DEFAULT 0 CHECK(Mark BETWEEN 0 AND 100),
 ExamTime TINYINT DEFAULT 1,
 UNIQUE(SubID,StudentID),
 FOREIGN KEY (SubID) REFERENCES Subject(SubID),
 FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
 ) ;
 insert class(ClassID,ClassName,StartDate,Status) value(1,"lopC04",'2015-12-25 15:30:00',1);
 insert class(ClassID,ClassName,StartDate,Status) value(2,"lopC05",'2015-12-25 14:30:00',0);
 insert class(ClassID,ClassName,StartDate,Status) value(3,"lopC06",'2015-12-25 16:30:00',1);
 insert Student(StudentID,StudentName,Address,Phone,Status,ClassID) value(1,'Nguyen','ND','963548571',1,1);
 insert Student(StudentID,StudentName,Address,Phone,Status,ClassID) value(2,'Nam','HN','963548571',1,1);
 insert Student(StudentID,StudentName,Address,Phone,Status,ClassID) value(3,'Vinh','TB','012345678',1,2);
 insert Student(StudentID,StudentName,Address,Phone,Status,ClassID) value(4,'Long','HN','987456123',1,3);
 insert Subject(SubID,SubName,Credit,Status) value(1,'Toan',3,1);
 insert Subject(SubID,SubName,Credit,Status) value(2,'Van',2,0);
 insert Subject(SubID,SubName,Credit,Status) value(3,'Anh',5,0);
 insert Subject(SubID,SubName,Credit,Status) value(4,'Lap Tring',4,0);
 insert Mark(MarkID,SubID,StudentID,Mark,Examtime) value(1,1,1,10,2);
 insert Mark(MarkID,SubID,StudentID,Mark,Examtime) value(2,2,1,9,2);
 insert Mark(MarkID,SubID,StudentID,Mark,Examtime) value(3,3,2,9,2);
 insert Mark(MarkID,SubID,StudentID,Mark,Examtime) value(4,4,3,9,2);
 -- 2: Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
 SELECT Address, COUNT(studentID) AS 'Số lượng học viên'
FROM Student
GROUP BY Address;
--  3: Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
SELECT 
    AVG(mark) AS avgtb, s.StudentName
FROM
    Mark AS m
        JOIN
    student s ON m.studentID = s.StudentID
GROUP BY StudentName;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 9;
SELECT 
    AVG(mark) avgtb, s.studentName
FROM
    Mark AS m
        JOIN
    student s ON m.studentID = s.studentID
GROUP BY studentName
HAVING AVG(mark) > 9;
-- Hiển thị những bạn học viên co điểm trung bình các môn học max
SELECT  S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentID);