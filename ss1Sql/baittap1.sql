CREATE DATABASE `my_database1`;
use my_database1;
create table class
( id int,name varchar(200));
create table teacher(
 id int, name varchar(200),age int);
 insert into teacher value( 1, 'Nam' , 14);
 insert into teacher (id,name, age) value( 'd', '1' , 45);
 select* from teacher 