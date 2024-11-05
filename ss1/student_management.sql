create database student_management;
use student_management;

create table class(
	id varchar(8),
	name varchar(20)
);

create table teacher(
	id varchar(8),
    name varchar(20),
    age int,
    country varchar(10)
);