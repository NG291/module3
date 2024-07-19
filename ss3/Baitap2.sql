create database Quanlybanhang1;
use Quanlybanhang1;

create table Customer(
customerID int primary key  not null auto_increment,
customerName varchar(25) not null,
customerAge tinyint not null
);

create table Orders(
orderID int primary key not null auto_increment,
customerID int not null,
orderDate date,
orderTotalPrice int,
foreign key(customerID) references Customer(customerID)

);

create table Product(
productID int primary key not null auto_increment,
productName varchar(25)  not null,
producPrice int not null
);
create table OrderDetail(
orderID int not null,
productID int not null,
orderDetailQty int not null,
foreign key(orderID) references Orders(orderID),
foreign key(productID) references Product(productID)
);

-- Them thong tin
insert into Customer(customerName, customerAge) value('Minh Quan', 10);
insert into Customer(customerName, customerAge) value('Kieu Oanh', 20);
insert into Customer(customerName, customerAge) value('Hong Ha', 50);
insert into Customer(customerName, customerAge) value('Huu Trang', 32);
select * from Customer;

insert into Orders(customerID, orderDate) value(1,'2006-03-31');
insert into Orders(customerID, orderDate) value(2,'2006-03-23');
insert into Orders(customerID, orderDate) value(1,'2006-03-16');
select * from Orders;
insert into Product(productName, producPrice) value ('May giat',3);
insert into Product(productName, producPrice) value ('Tu Lanh',5);
insert into Product(productName, producPrice) value ('Dieu hoa',7);
insert into Product(productName, producPrice) value ('Quat',1);
insert into Product(productName, producPrice) value ('Bep Dien',2);

insert into OrderDetail(orderID,productID,orderDetailQty) value(1,1,3);
insert into OrderDetail(orderID,productID,orderDetailQty) value(1,3,7);
insert into OrderDetail(orderID,productID,orderDetailQty) value(1,4,2);
insert into OrderDetail(orderID,productID,orderDetailQty) value(2,1,1);
insert into OrderDetail(orderID,productID,orderDetailQty) value(3,1,8);
insert into OrderDetail(orderID,productID,orderDetailQty) value(2,5,4);
insert into OrderDetail(orderID,productID,orderDetailQty) value(2,3,3);
 select *from orderdetail;
-- Hien thi
select * from Orders;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT 
    c.customerName, 
    p.productName
FROM
    Customer AS c
JOIN
    Orders AS o ON c.customerID = o.customerID
JOIN
    OrderDetail AS ot ON o.orderID = ot.orderID
JOIN
    Product AS p ON ot.productID = p.productID;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT 
    c.customerName
FROM
    Customer c
        LEFT JOIN
    Orders o ON c.customerID = o.customerID
WHERE
    o.customerID IS NULL;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

SELECT 
    o.orderID, 
    o.orderDate, 
    SUM(od.orderDetailQty * p.producPrice) AS totalAmount
FROM
    Orders AS o
JOIN
    OrderDetail AS od ON o.orderID = od.orderID
JOIN
    Product AS p ON od.productID = p.productID
GROUP BY 
    o.orderID, 
    o.orderDate;