create database QuanLyHocVien;
use QuanLyHocVien;
create table Address(
address_id int not null primary key auto_increment ,
address varchar(50)
);

create table Classes(
classes_id int not null primary key auto_increment,
name varchar(50) not null,
decscription varchar(50) 
);

create table Students(
student_id int not null primary key auto_increment,
fullname varchar(50),
address_id int not null,
age int not null,
phone varchar(10) not null unique,
classes_id int not null,
foreign key(address_id) references Address(address_id), 
foreign key(classes_id ) references  Classes(classes_id)
 );

create table Course(
course_id int not null primary key auto_increment,
name varchar(50)  not null,
description varchar(50)
);

create table Point(
id int not null  primary key auto_increment,
course_id  int not null,
student_id int not null,
point int not null,
foreign key (course_id) references course (course_id),
foreign key (student_id) references Students (student_id)
);

-- Thêm 5 bản ghi trong bảng Address

insert into Address (address_id, address) value(1,'HN');
insert into Address (address_id, address) value(2,'ND');
insert into Address (address_id, address) value(3,'HN');
insert into Address (address_id, address) value(4,'TN');
insert into Address (address_id, address) value(5,'NB');
insert into Address ( address) value('NB');

 -- Thêm 5 bản ghi trong bảng Classes
 
 insert into Classes (classes_id, name,decscription) value (1,'C02','tot');	
 insert into Classes (classes_id, name,decscription) value (2,'C03','tot');	
 insert into Classes (classes_id, name,decscription) value (3,'C04','tot');	
 insert into Classes (classes_id, name,decscription) value (4,'C05','tot');	
 insert into Classes (classes_id, name,decscription) value (5,'C06','tot');	
 
 -- Thêm 10 bản ghi trong bảng Student	
 
 insert into Students(fullname,address_id,age,phone,classes_id) value ('Nguyen',1,22,'0963548571',1);
 insert into Students(fullname,address_id,age,phone,classes_id) value ('Anh',1,10,'0123456789',1);
 insert into Students(fullname,address_id,age,phone,classes_id) value ('Nguyen',2,18,'0963546571',3);
 insert into Students(fullname,address_id,age,phone,classes_id) value ('Nguyen',1,22,'0963548171',1);
 insert into Students(fullname,address_id,age,phone,classes_id) value ('Nam',5,30,'0987456123',5);
 insert into Students(fullname,address_id,age,phone,classes_id) value ('Nu',4,12,'0951753462',2);
 insert into Students(fullname,address_id,age,phone,classes_id) value ('Anh',1,23,'0174852369',2);
 insert into Students(fullname,address_id,age,phone,classes_id) value ('Tuan',3,20,'089898666',3);
 insert into Students(fullname,address_id,age,phone,classes_id) value ('Van',5,24,'0200564879',1);
 insert into Students(fullname,address_id,age,phone,classes_id) value ('Thi',1,21,'0969696969',3);
 
-- Thêm 20 bản ghi thuộc bảng Course

insert into Course (name ,description ) value('LapTrinhHuongDoiTuong','KhoaHocJaVa');
insert into Course (name ,description ) value('Lap Trinh Mang','KhoaHocJaVa');
insert into Course (name ,description ) value('Lap Trinh Website','KhoaHocJaVa');
insert into Course (name ,description ) value('Lap Trinh','KhoaHocJaVa');
insert into Course (name ,description ) value('Lap Trinh CSDL','KhoaHocJaVa');
insert into Course (name ,description ) value('Lap Trinh Backend','Ngon ngu JaVa');
insert into Course (name ,description ) value('Lap trinh c/c++','Khoa hoc lap trinh co ban');
insert into Course (name ,description ) value('Lap trinh c#','Khoa hoc lap trinh co ban');
insert into Course (name ,description ) value('Kiem thu he thong','Khoa hoc lap trinh co ban');
insert into Course (name ,description ) value('Lap trinh c/c++ advanced','Khoa hoc lap trinh nang cao');
insert into Course (name ,description ) value('Lap trinh c#','Khoa hoc lap trinh nang cao');
insert into Course (name ,description ) value('Lap trinh frontend','Khoa hoc lap trinh web nang cao');
insert into Course (name ,description ) value('Lap trinh  frontend advanced','Khoa hoc lap trinh web nang cao');
insert into Course (name ,description ) value('Lap trinh python ','Khoa hoc lap co ban');
insert into Course (name ,description ) value('Lap trinh python advanced','Khoa hoc lap trinh nang cao');
insert into Course (name ,description ) value('Lap trinh game ','Ngon ngu java');
insert into Course (name ,description ) value('Lap trinh game',' Ngon ngu c#');
insert into Course (name ,description ) value('Lap trinh java1','Khoa hoc lap trinh  java co ban');
insert into Course (name ,description ) value('Lap trinh java2','Khoa hoc lap trinh nang cao');
insert into Course (name ,description ) value('Lap trinh java3','Khoa hoc lap trinh co ban');

-- Thêm 15 bản ghi trong bảng Point

insert into Point (course_id ,student_id,point) value (1,1,10);
insert into Point (course_id ,student_id,point) value (2,2,9);
insert into Point (course_id ,student_id,point) value (3,3,8);
insert into Point (course_id ,student_id,point) value (4,4,7);
insert into Point (course_id ,student_id,point) value (5,5,6);
insert into Point (course_id ,student_id,point) value (6,6,5);
insert into Point (course_id ,student_id,point) value (7,9,4);
insert into Point (course_id ,student_id,point) value (8,8,3);
insert into Point (course_id ,student_id,point) value (9,10,2);
insert into Point (course_id ,student_id,point) value (10,10,1);
insert into Point (course_id ,student_id,point) value (11,10,0);
insert into Point (course_id ,student_id,point) value (12,10,1);
insert into Point (course_id ,student_id,point) value (13,10,2);
insert into Point (course_id ,student_id,point) value (14,10,3);
insert into Point (course_id ,student_id,point) value (15,10,4);

-- thuc hien truy van
select *from  Students where fullname= 'nguyen';
select *from Students where age>18 && age <25;
select * from Students where student_id= 12 or student_id = 13;
SELECT 
    s.fullname, a.address
FROM
    Students as s
        JOIN
    Address as a ON  s .student_id = a.address_id; 
    -- Tính điểm trung bình của các khóa học (avg)
SELECT 
    AVG(point) AS counttb, c.name
FROM
    Point AS p
        JOIN
    Course AS c ON p.course_id = c.course_id
GROUP BY c.name;
--  Lấy ra điểm cao nhất, thấp nhất.
SELECT MIN(point) as min, max(point) as max from Point;
-- Lấy ra danh sách HS, Chuyển đổi tên HS thành chữ hoa
SELECT UPPER(fullname) NameINHOA
FROM Students;
-- Đưa ra khoá học có điểm trung bình cao nhất
SELECT 
    AVG(point) AS Maxtb, c.name
FROM
    Point AS p
        JOIN
    Course AS c ON p.course_id = c.course_id
GROUP BY c.name
HAVING AVG(point) <= all (select AVG(point) from Point p GROUP BY p.course_id); 