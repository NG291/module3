Create database QuanLyBanHang;
use QuanLyBanHang;
Create table Customer(
CID varchar(20) primary key not null,
cName varchar(20) not null,
cAge varchar(20) not null
);

Create table Order1(
OID varchar(20) not null primary key,
CID varchar(20) not null,
ODATE date not null,
ototalPrice TINYINT  not null
);

Create table Product(
PID Varchar(20) primary key not null,
PName Varchar (50) not null,
PPrice TINYINt not null
);

Create table OrderDetail(
OID varchar (20) not null,
PID varchar (20) not null,
ODQTY varchar(20) not null,
UniQue( OID,PID),
 FOREIGN KEY (OID) REFERENCES Order1(OID),
 FOREIGN KEY (PID) REFERENCES Product(PID)
);
