create table members(
    id VARCHAR2(30) not null,
    pw VARCHAR2(30) not null,
    name VARCHAR2(30),
    phone1 VARCHAR2(30),
    phone2 VARCHAR2(30),
    phone3 VARCHAR2(30),
    gender VARCHAR2(1)
);

alter table members add CONSTRAINT member_pk PRIMARY KEY (id);