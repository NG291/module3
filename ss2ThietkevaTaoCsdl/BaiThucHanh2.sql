create database QuanLyDiemThi;
use QuanLyDiemThi;

create table HocSinh(
MaHS varchar(20) PRIMARY KEY,
TenHS Varchar(50),
NgaySinh date,
Lop varchar(20),
GT varchar (20)
);

create table Monhoc(
MaMH varchar(20) PRIMARY KEY,
TenMH varchar(50),
MaGV varchar(20)
);

create table BangDiem(
MaHS varchar(20),
MaMH varchar(20),
DiemThi int,
NgayKT datetime,
PRIMARY KEY (MaHS,MaMH),
FOREIGN KEY(MaHS) REFERENCES HocSinh(MaHS),
FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
);

create table Giaovien(
MaGV varchar(20) PRIMARY KEY,
TenGV varchar(50),
SDT varchar (10)
);

ALTER TABLE MonHoc ADD CONSTRAINT FK_MaGV FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV);
insert HocSinh(MaHS,TenHS,NgaySinh,Lop,GT) values ('1','Nguyen','2001-09-02','C04','2');
insert HocSinh(MaHS,TenHS,NgaySinh,Lop,GT) values ('2','Nam','2001-09-02','C04','2');
insert HocSinh(MaHS,TenHS,NgaySinh,Lop,GT) values ('3','Nu','2001-09-02','C04','2');

insert Monhoc(MaMH, TenMH, MaGV) values('1','Co so du lieu','1');
insert Monhoc(MaMH, TenMH, MaGV) values('2','java','1');
insert Monhoc(MaMH, TenMH, MaGV) values('3','Lap Trinh Huong Doi Tuong','1');
insert GiaoVien(MaGV, TenGV, SDT) values('1','Nam','0963548571');

insert BangDiem(MaHS, MaMH, DiemThi,NgayKT) values('1','3',9,'1000-01-01 00:00:00');
insert BangDiem(MaHS, MaMH, DiemThi,NgayKT) values('2','1',9,'1000-01-01 00:00:00');
insert BangDiem(MaHS, MaMH, DiemThi,NgayKT) values('3','2',9,'1000-01-01 00:00:00');
select * from Monhoc;