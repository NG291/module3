create database QuanLyTourDuLich;
use QuanLyTourDuLich;
CREATE TABLE Destination (
    destinationID INT PRIMARY KEY AUTO_INCREMENT,
    destinationName VARCHAR(255) NOT NULL,
    describes VARCHAR(255),
    cost INT,
    cityID INT NOT NULL,
    FOREIGN KEY (cityID)
        REFERENCES city (cityID)
);
  
CREATE TABLE CategoryTour (
    categoryID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    categoryCode VARCHAR(255),
    categoryName VARCHAR(255) NOT NULL
);
CREATE TABLE Tour (
    tourID INT PRIMARY KEY AUTO_INCREMENT,
    tourCode VARCHAR(255),
    categoryID INT NOT NULL,
    destinationID INT NOT NULL,
    dateStart DATE,
    dateEnd DATE,
    FOREIGN KEY (categoryID)
        REFERENCES Category (categoryID),
    FOREIGN KEY (destinationID)
        REFERENCES Destination (destinationID)
);

CREATE TABLE OrderTour (
    orderTourID INT PRIMARY KEY AUTO_INCREMENT,
    tourID INT NOT NULL,
    clientsID INT NOT NULL,
    statuss VARCHAR(255),
    FOREIGN KEY (tourID)
        REFERENCES Tour (tourID),
    FOREIGN KEY (clientsID)
        REFERENCES Clients (clientsID)
);
CREATE TABLE City (
    cityID INT PRIMARY KEY AUTO_INCREMENT,
    cityName VARCHAR(255)
);
CREATE TABLE Clients (
    clientsID INT PRIMARY KEY AUTO_INCREMENT,
    clientName VARCHAR(255),
    inNumber VARCHAR(255),
    dateBirth DATE,
    cityID INT NOT NULL,
    FOREIGN KEY (cityID)
        REFERENCES City (cityID)
);
 
   insert into City(cityName) values ('Ha noi');
   insert into City(cityName) values('HoChiMinh');
   insert into City(cityName) values('Hai Phong');
   insert into City(cityName) values('Da nang');
   insert into City(cityName) values('Can tho');
   --
   
  INSERT INTO Destination (destinationName, describes, cost, cityID) 
  Value (' Ho Hoan Kiem ', 'Hồ Hoàn Kiếm là biểu tượng lịch sử Hà Nội, nổi tiếng với Tháp Rùa và cảnh quan tuyệt đẹp.', 10.00, 1);
  INSERT INTO Destination (destinationName, describes, cost, cityID) 
  Value(' Cho Ben Thanh', ' Chợ Bến Thành là biểu tượng của TP. Hồ Chí Minh, nổi tiếng với hàng hóa đa dạng và ẩm thực đặc sắc. ', 20.00, 2);
  INSERT INTO Destination (destinationName, describes, cost, cityID) 
  Value (' Dao Cat Ba Island', 'Đảo Cát Bà nằm ở Vịnh Lan Hạ, nổi tiếng với rừng núi xanh, bãi biển đẹp và động Phục Vịnh nổi tiếng.', 50.00, 3);
  INSERT INTO Destination (destinationName, describes, cost, cityID) 
  Value (' Bien My Khe', 'Bãi biển Mỹ Khê nằm ở Đà Nẵng, Việt Nam, được biết đến với cát trắng mịn và nước biển xanh trong.', 30.00, 4);
  INSERT INTO Destination (destinationName, describes, cost, cityID)
  Value  (' Ben tau Ninh Kieu', 'Bến tàu Ninh Kiều là một điểm tham quan nổi tiếng ở Cần Thơ, nằm bên bờ sông Hậu, thu hút du khách bởi cảnh quan đẹp.', 40.00, 5);
  
 -- 
INSERT INTO Clients (clientName, inNumber, dateBirth, cityID)
VALUES ('Nguyễn Văn A', 'A123456', '1990-05-15', 1);
INSERT INTO Clients (clientName, inNumber, dateBirth, cityID)
VALUES ('Trần Thị B', 'B987654', '1985-09-20', 2);
INSERT INTO Clients (clientName, inNumber, dateBirth, cityID)
VALUES ('Lê Văn C', 'C456789', '1995-03-10', 3);
INSERT INTO Clients (clientName,  inNumber, dateBirth, cityID)
VALUES ('Phạm Thị D', 'D654321', '1988-07-25', 4);
INSERT INTO Clients (clientName,  inNumber, dateBirth, cityID)
VALUES ('Hoàng Văn E', 'E789123', '1992-01-05', 5);
INSERT INTO Clients (clientName, inNumber, dateBirth, cityID)
VALUES ('Đặng Thị F', 'F321987', '1987-11-30', 1);
INSERT INTO Clients (clientName,  inNumber, dateBirth, cityID)
VALUES ('Nguyễn Văn G', 'G234567', '1993-06-18', 2);
INSERT INTO Clients (clientName, inNumber, dateBirth, cityID)
VALUES ('Trần Thị H', 'H876543', '1989-04-12', 3);
INSERT INTO Clients (clientName,  inNumber, dateBirth, cityID)
VALUES ('Lê Văn I', 'I567891', '1991-08-22', 4);
INSERT INTO Clients (clientName, inNumber, dateBirth, cityID)
VALUES ('Phạm Thị K', 'K918273', '1994-02-08', 5);
--
set foreign_key_checks=0;
INSERT INTO Tour (tourCode, categoryID, destinationID, dateStart, dateEnd)
VALUES ('T001', 1, 1, '2020-08-01', '2020-08-05');
INSERT INTO Tour (tourCode, categoryID, destinationID, dateStart, dateEnd)
VALUES ('T002', 2, 2, '2020-09-10', '2020-09-15');
INSERT INTO Tour (tourCode, categoryID, destinationID, dateStart, dateEnd)
VALUES ('T003', 1, 1, '2020-10-05', '2020-10-10');
INSERT INTO Tour (tourCode, categoryID, destinationID, dateStart, dateEnd)
VALUES ('T004', 1, 1, '2020-11-12', '2020-11-18');
INSERT INTO Tour (tourCode, categoryID, destinationID, dateStart, dateEnd)
VALUES ('T005', 2, 5, '2020-12-20', '2020-12-25');
INSERT INTO Tour (tourCode, categoryID, destinationID, dateStart, dateEnd)
VALUES ('T006', 1, 1, '2020-01-05', '2020-01-10');
INSERT INTO Tour (tourCode, categoryID, destinationID, dateStart, dateEnd)
VALUES ('T007', 1, 3, '2020-02-15', '2020-02-20');
INSERT INTO Tour (tourCode, categoryID, destinationID, dateStart, dateEnd)
VALUES ('T008', 2, 3, '2020-03-20', '2020-03-25');
INSERT INTO Tour (tourCode, categoryID, destinationID, dateStart, dateEnd)
VALUES ('T009', 2, 4, '2020-03-10', '2020-04-15');
INSERT INTO Tour (tourCode, categoryID, destinationID, dateStart, dateEnd)
VALUES ('T010', 1, 5, '2020-03-08', '2020-05-12');
INSERT INTO Tour (tourCode, categoryID, destinationID, dateStart, dateEnd)
VALUES ('T011', 1, 2, '2020-03-15', '2020-06-20');
INSERT INTO Tour (tourCode, categoryID, destinationID, dateStart, dateEnd)
VALUES ('T012', 2, 3, '2020-03-10', '2020-07-15');
INSERT INTO Tour (tourCode, categoryID, destinationID, dateStart, dateEnd)
VALUES ('T013', 2 ,1, '2020-08-05', '2020-08-10');
INSERT INTO Tour (tourCode, categoryID, destinationID, dateStart, dateEnd)
VALUES ('T014', 1, 5, '2020-09-12', '2020-09-18');
INSERT INTO Tour (tourCode, categoryID, destinationID, dateStart, dateEnd)
VALUES ('T015', 2, 5, '2020-10-20', '2020-10-25');
 --
INSERT INTO CategoryTour ( categoryCode, categoryName)
VALUES ('tour1', 'Tour Binh thuong');
INSERT INTO CategoryTour ( categoryCode, categoryName)
VALUES ('tour2', 'Tour Vip');

-- 
INSERT INTO orderTour(tourID, clientsID, statuss) VALUES (1, 1, 'Hoat dong');
INSERT INTO orderTour(tourID, clientsID, statuss) VALUES (2, 2, 'Hoat dong');
INSERT INTO orderTour(tourID, clientsID, statuss) VALUES (3, 3, 'Hoat dong');
INSERT INTO orderTour(tourID, clientsID, statuss) VALUES (4, 4, 'Hoat dong');
INSERT INTO orderTour(tourID, clientsID, statuss) VALUES (5, 5, 'Hoat dong');
INSERT INTO orderTour(tourID, clientsID, statuss) VALUES (6, 6, 'Hoat dong');
INSERT INTO orderTour(tourID, clientsID, statuss) VALUES (7, 7, 'Hoat dong');
INSERT INTO orderTour(tourID, clientsID, statuss) VALUES (8, 8, 'Hoat dong');
INSERT INTO orderTour(tourID, clientsID, statuss) VALUES (9, 9, 'Hoat dong');
INSERT INTO orderTour(tourID, clientsID, statuss) VALUES (10, 10, 'Hoat dong');

-- Thống kê số lượng tour của các thành phố	
select *from tour;
-- Tính số tour có ngày bat dau trong tháng 3 năm 2020
SELECT COUNT(*)
FROM tour
WHERE MONTH(dateStart) = 3 AND YEAR(dateStart) = 2020;
-- Tính số tour có ngày kết thúc trong tháng 4 năm 2020
SELECT COUNT(*)
FROM tour
WHERE MONTH(dateEnd) = 4 AND YEAR(dateEnd) = 2020;
