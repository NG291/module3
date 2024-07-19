create database Quanlysinhvien1;
use QuanlySinhVien1;
create table Class(
classID int not null primary key auto_increment,
className varchar(50) not null,
StartDate date not null,
status bit
);

create table Student(
studentID int not null primary key auto_increment,
studentName varchar(50) not null,
address  varchar(50) not null,
phone varchar(10) not null ,
status bit,
classID int not null,
foreign key(classID) references Class(classID)
);
create table Subject(
subID int not null primary key auto_increment,
subName varchar(50) not null,
credit int not null,
status bit
);
create table Mark(
MarkID int not null primary key auto_increment,
subID int not null,
studentID int not null,
mark int not null,
examTimes int, 
foreign key(subID) references Subject(subID),
foreign key (studentID) references Student(studentID)
);

insert into Class(className, StartDate ,status) value( 'A1','2001-12-12',0);
insert into Class(className, StartDate ,status) value( 'A2','2024-12-12',1);
insert into Class(className, StartDate ,status) value( 'A3','2020-12-12',0);
select *from class;
-- them thong tin hoc sinh
insert into Student(studentName, address, phone, status, classID) value('nguyen','hn','0123456789',0,1);
insert into Student(studentName, address, phone, status, classID) value('van','ND','0123456789',1,1);
insert into Student(studentName, address, phone, status, classID) value('thi','hn','0123456789',0,1);
insert into Student(studentName, address, phone, status, classID) value('nam','hn','0123456789',0,1);
insert into Student(studentName, address, phone, status, classID) value('ham','hn','0123456789',0,1);
-- them thong tin ban ghi  subject
insert into Subject(subName,credit,status) value('Lap Trinh Mang',4,0);
insert into Subject(subName,credit,status) value('Lap Trinh Huong Doi Tuong',2,1);
insert into Subject(subName,credit,status) value('Lap Trinh website',3,1);
insert into Subject(subName,credit,status) value('Lap c++',5,0);

# bai thu hanh 2
-- Thong thong tin ban ghi 
insert into Mark(subID,studentID,mark,examTimes) value(1,2,10,1);
insert into Mark(subID,studentID,mark,examTimes) value(1,1,9,1);
insert into Mark(subID,studentID,mark,examTimes) value(1,3,10,1);
insert into Mark(subID,studentID,mark,examTimes) value(2,2,8,1);

-- Hiển thị danh sách tất cả các học viên
select* from student;
-- Hiển thị danh sách các học viên đang theo học.
select* from Student where status = true; 
-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
SELECT 
    *
FROM
    subject
WHERE
    Credit < 10;

-- Hiển thị danh sách học viên lớp A1
select * from student where ClassID = 1;
SELECT 
    *
FROM
    student AS s
        JOIN
    Class AS c ON s.classID = c.classID
WHERE
    c.className = 'A2'; 

-- hien thi diem mon cua cac hoc vien
SELECT 
    studentName, subName, mark
FROM
    student AS s
        JOIN
    Mark AS m ON s.studentID = m.studentID
        JOIN
    subject AS sb ON m.subID = sb.subID
WHERE
    sb.subName = 'Lap Trinh Mang';

# bai tap 1
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student where studentName like 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
select * from class where StartDate like '%-12-%';
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
select * from subject where Credit between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘nguyen’ là 2.
UPDATE Student SET status = 1 where studentName= 'nguyen';
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT 
    s.studentName, sb.SubName, m.Mark
FROM
    Mark AS m
        JOIN
    Student s ON m.studentID = s.studentID
        JOIN
    Subject AS sb ON m.subID = sb.subID
ORDER BY mark DESC;


