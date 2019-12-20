--дропаем
/*drop table ROLES;
drop table USERINFO;
drop table "USER";
drop table SUPPLIER;
drop table PRODUCT;
drop table "ORDER";
drop table ORDER2PRODUCT;*/

--создаем
create table "ORDER" (
id int ,
"user" int ,
created timestamp ,
PRIMARY KEY (id));

create table ORDER2PRODUCT(
"order" int, 
product int,
primary key ("order",product));

create table PRODUCT (
id int,
code varchar(255),
title varchar(255),
supplier int,
initial_price double,
retail_value double,
primary key (code),
unique (id));


create table "USER" (
id int,
email varchar(255),
password varchar(255),
info int,
"role" int,
primary key (email),
unique (id, info));

create table USERINFO (
id int,
"name" varchar(255) default 'test',
surname varchar(255) default 'test',
primary key (id));

create table ROLES (
id int,
"name" varchar(255),
primary key ("name"),
unique (id));

create table SUPPLIER (
id int,
"name" varchar(255),
address varchar(255) default 'test',
phone varchar(255),
representative varchar(255) default 'test',
primary key ("name"),
unique (id));
--навешиваем констрейнты
ALTER TABLE
ORDER2PRODUCT
ADD
FOREIGN KEY ( "order")
REFERENCES "ORDER" (id);

ALTER TABLE
ORDER2PRODUCT
ADD
FOREIGN KEY (product)
REFERENCES PRODUCT (id);

ALTER TABLE
"ORDER"
ADD
FOREIGN KEY ("user")
REFERENCES PRODUCT (id);

ALTER TABLE
"USER"
ADD
FOREIGN KEY (info)
REFERENCES USERINFO (id);

ALTER TABLE
"USER"
ADD
FOREIGN KEY ("role")
REFERENCES ROLES (id);

ALTER TABLE
PRODUCT
ADD
FOREIGN KEY (supplier)
REFERENCES SUPPLIER (id);

