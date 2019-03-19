create table dept(deptid number(5) primary key,deptname varchar2(40));

create table emp(empid number(8),empname varchar2(30) not null,
                                deptid number(5),doj date not null,
                                age int ,gender char(1) default 'F',
                                Salary number(12,2),
                                Constraints pk_emp primary key(empid),
                                Constraints chk_age check (age>20 and age<60),
                                Constraints fk_dept foreign key(deptid)references dept(deptid));
        
insert into dept values(1001,'Human resource');
insert into dept values(1002,'Information Technology');
insert into dept values(1004,'sales');
insert into dept values(1005,'finance');
insert into dept values(1003,'purchase');
insert into dept values(1007,'research dept');
insert into dept values(1006,'Procurment');

select * from dept;
commit;

insert into emp values(23003,'Mani',1001,to_date('2015-02-22','yyyy-mm-dd'),33,'M',500.55);
insert into emp values(23004,'Anand',1002,to_date('2018-03-02','yyyy-mm-dd'),33,'M',9400.55);
insert into emp values(23005,'Shanthi',1003,to_date('2018-03-02','yyyy-mm-dd'),33,'F',9590.55);
insert into emp values(23006,'Babu',1001,to_date('2018-07-16','yyyy-mm-dd'),33,'M',9640.55);
insert into emp values(23007,'Mani',1002,to_date('2018-05-22','yyyy-mm-dd'),33,'F',9120.55);
insert into emp values(23008,'David',1004,to_date('2018-09-27','yyyy-mm-dd'),33,'M',9739.55);

insert into emp values(23009,'Daisey',1004,to_date('2018-09-27','yyyy-mm-dd'),16,'F',97450.55);
-check constraint not allowed below 20

insert into emp values(23009,'Daisey',1004,to_date('2018-09-27','yyyy-mm-dd'),26,'F',9100.55);

insert into emp (empid,empname,doj,salary,deptid,age)values(23010,'Bala',to_date('2018-05-22','yyyy-mm-dd'),8230.55,1002,22);
insert into emp (empid,empname,doj,salary,age)values(23011,'Reshmi',to_date('2018-11-15','yyyy-mm-dd'),7020.55,26);
insert into emp (empid,empname,doj,salary,age)values(23014,'Josephine',to_date('2018-10-27','yyyy-mm-dd'),6900.34,31);
commit;
select * from emp;

create table emptbl(ID Number(5) NOT NULL,NAME VARCHAR(30) 
NOT NULL,AGE NUMBER(5) NOT NULL,ADDRESS CHAR(25),
SALARY DECIMAL(18,2),DEPTID NUMBER(3),PRIMARY KEY(ID));

INSERT INTO emptbl VALUES (1001,'Ramesh',32,'ahamedabad',7890.00,101);
INSERT INTO emptbl VALUES (1002,'david',25,'delhi',8500.00,102);
INSERT INTO emptbl VALUES (1003,'manikumar',23,'kota',8000.00,103);
INSERT INTO emptbl VALUES (1007,'anand',27,'tamil nadu',7500.00,102);
INSERT INTO emptbl VALUES (1008,'bala',25,'ahamedabad',9500.00,101);
INSERT INTO emptbl VALUES (1009,'mani',28,'mh',7000.00,101);
INSERT INTO emptbl VALUES (1004,'uthra',25,'mumbai',6500.00,101);
INSERT INTO emptbl VALUES (1005,'akshay',27,'bhopal',8500.00,102);
INSERT INTO emptbl VALUES (1006,'hima',22,'mh',4500.00,103);

begin
DBMS_OUTPUT.PUT_LINE('this is cheenai batch IN-CHN19DW006');
DBMS_OUTPUT.PUT_LINE('WELCOME TO PL/SQL');
END;

SET SERVEROUTPUT ON

DECLARE
gv-number:=20;
begin
    declare
        iv_number:=10;
        begin
            DBMS_OUTPUT.PUT_LINE('inside the block');
            dbms_output.put_line('the value of v_number Local='||v_number);
            dbms_output.put_line('the value of v_number global='||gv_number);
            END;

declare
gv_number number:=20;
begin
    declare
        lv_number number:=10;
        begin
            DBMS_OUTPUT.PUT_LINE('inside the block');
            DBMS_OUTPUT.PUT_LINE('the value of v_number local='||lv_number);
            DBMS_OUTPUT.PUT_LINE('the value of v_number= global'||gv_number);
            END;
            DBMS_OUTPUT.PUT_LINE('outside the block');
            DBMS_OUTPUT.PUT_LINE('the value of v_number global ='||gv_number);
            DBMS_OUTPUT.PUT_LINE('the value of v_number global ='||lv_number);
end;


declare
a number:=10;
b number:=20;
begin
if a>b then
DBMS_OUTPUT.PUT_LINE('A is greater'||a);
else
DBMS_OUTPUT.PUT_LINE('b is greater'||b);
end if;
end;


declare
a number:=&a;
b number:=&b;
c number:=&c;
begin
if a>b and a>c then
DBMS_OUTPUT.PUT_LINE('a is greater'||a);
elsif b>a and b>c then
dbms_output.put_line('b is greater'||b);
else
dbms_output.put_line('c is greater'||c);
end if;
end;

declare
edeptno emp.deptid%type;
begin
select deptid into edeptno from emp where empname like '&ss%';
dbms_output.put_line('++++++++++++++++++++++');
case
    when edeptno=1001 then
    dbms_output.put_line('information technology');
    when edeptno=1002 then
    dbms_output.put_line('human resource');
    when edeptno=1005 then
    dbms_output.put_line('sales');
    else
    dbms_output.put_line('department not assigned');
    end case;
    dbms_output.put_line('******************');
end;



--WEDNESDAY
set serveroutput on
declare
a varchar2(10):='&a';
begin
dbms_output.put_line('entered string is'||a);
end;



create or replace procedure GREET
as
begin 
dbms_output.put_line("welcome to chennai");
end greet;

exec greet;

create or replace procedure findmax
(x IN number, y IN number, z OUT number) IS
BEGIN
    IF x>y THEN
        z:=x;
    ELSE
        z:=y;
    END IF;
END findmax;

DECLARE
 a number:=0;
 b number:=0;
 c number:=0;
BEGIN
 a:=&a;
 b:=&b;
 findmax(a,b,c);--positional notation
 if C=a then
    dbms_output.put_line('A is maximum of ('||a||'):'||'Low value B'|| b);
else
    dbms_output.put_line('B is maximum of ('||b||'):'||'Low value A'|| a);
end if;
END;

create or replace procedure CubeNum(x IN OUT number) IS
BEGIN
x:= x*x*x;
END;

Declare
a number:=&aval;
aval Number;
BEGIN
 aval := a;
 CubeNum(a);
 dbms_output.put_line('cube of '|| a || 'is' || a);
END;




create or replace function get_deptname(p_deptid number) return varchar2
as
l_deptname varchar2(40);
begin
    select deptname into l_deptname from dept where deptid=p_deptid;
    return l_deptname;
end;

select * from dept;

BEGIN
dbms_output.put_line(get_deptname(1002));
END;

exec dbms_output.put_line(get_deptname(1001));
select empid ,empname,get_deptname(deptid),salary from emp;




set serveroutput on;
create or replace function factorial(a IN number)
RETURN number
IS
    fact number;
    BEGIN
        IF a=0 then
            fact :=1;
        ELSE
            fact := a * factorial(a-1);
        END IF;
    RETURN fact;
end;


DECLARE
 num number;
 fact number;
BEGIN
 num :=&numval;
 fact := factorial(num);
 dbms_output.put_line('factorial'||num||'is'||fact);
END;




----
create or replace function Nxtday(date_in DATE)
RETURN DATE IS
BEGIN 
RETURN TRUNC(date_in+1);
END NxtDay;

Declare
ndate Date:=sysdate;
nval Date;
BEGIN
    nval := NxtDay(ndate);
    dbms_output.put_line('ToDay ('||ndate ||'):Next Day ' || nval);
END;

--oracle in built functions
declare
greetings varchar2(30):='...Hello world.....';
Begin
dbms_output.put_line(RTRIM(greetings,'.'));
dbms_output.put_line(LTRIM(greetings,'.'));
dbms_output.put_line(TRIM(greetings,'.'));
END;
----

declare 
    greetings varchar2(30):='Hello all';
begin
    dbms_output.put_line('RPAD' || RPAD(greetings,20,'*'));
    dbms_output.put_line('LPAD' || LPAD(greetings,20,'@'));
    dbms_output.put_line('upper' || upper(greetings));
    dbms_output.put_line('Lower' || lower(greetings));
    dbms_output.put_line('Initcap' || initcap(greetings));
    dbms_output.put_line(instr('Jamjam','ja'));
    dbms_output.put_line('Concat in oracle' || upper(greetings)||'initcap(welcome in-CHN19DW006'||'DW Batch');
    dbms_output.put_line('left '|| substr(greetings,1,5));
    dbms_output.put_line('length '|| length(greetings));
    END;

set serveroutput on

declare
p varchar2(30);
n pls_integer:=&val;
begin
for j in 2..round(sqrt(n))
 loop
    if n mod j = 0 then
     p:='is not a prime number';
     goto result;
     end if;
end loop;
   p:='is a prime number';
<<result>>
dbms_output.put_line(to_char(n) ||p);
end;

declare
e_id emptb1.id%type :=&cc_id;
e_name emptb1.name%type;
e_addr emptb1.address%type;
ex_invalid_id exception;
begin
if e_id <= 0 then
raise ex_invalid_id;
else
select name,address into e_name,e_addr
from emptb1
where id=e_id;
dbms_output.put_line('Name:'||e_name);
dbms_output.put_line(Address:'||e_addr);
end if;
exception
when ex_invalid_id then 
dbms_output.put_line('ID must be greater than zero!');
when no_data_found then
dbms_output.put_line('No such employee!');
when others then
dbms_output.put_line('Sqlcode = '||sqlcode);
dbms_output.put_line('Sqlerrm = '||sqlerrm);
end; 

set serveroutput on
Create table LMS_MEMBERS
(
	MEMBER_ID Varchar2(10),
	MEMBER_NAME Varchar2(30) NOT NULL,
	CITY VARCHAR2(20),
	DATE_REGISTER Date NOT NULL,
	DATE_EXPIRE Date ,
	MEMBERSHIP_STATUS Varchar2(15)NOT NULL,
	Constraints LMS_cts1 PRIMARY KEY(MEMBER_ID)
);

Create table LMS_SUPPLIERS_DETAILS
(
	SUPPLIER_ID Varchar2(3),
	SUPPLIER_NAME Varchar2(30) NOT NULL,
	ADDRESS	Varchar2(50),
	CONTACT Number(10) NOT NULL,
	EMAIL Varchar2(15) NOT NULL,
	Constraints LMS_cts2 PRIMARY KEY(SUPPLIER_ID)
);

Create table LMS_FINE_DETAILS
(
	FINE_RANGE Varchar2(3),
	FINE_AMOUNT Number(10,2) NOT NULL,
	Constraints LMS_cts3 PRIMARY KEY(FINE_RANGE)
);


Create table LMS_BOOK_DETAILS
(
	BOOK_CODE Varchar2(10),	
	BOOK_TITLE Varchar2(50) NOT NULL,
	CATEGORY Varchar2(15) NOT NULL,
	AUTHOR Varchar2(30) NOT NULL,
	PUBLICATION Varchar2(30),
	PUBLISH_DATE Date,
	BOOK_EDITION Number(2),
	PRICE Number(8,2) NOT NULL,	
	RACK_NUM Varchar2(3),
	DATE_ARRIVAL Date NOT NULL, 		
	SUPPLIER_ID Varchar2(3) NOT NULL,
	Constraints LMS_cts4 PRIMARY KEY(BOOK_CODE), 
        Constraints LMS_cts41 FOREIGN KEY(SUPPLIER_ID) References LMS_SUPPLIERS_DETAILS(SUPPLIER_ID)
);


Create table LMS_BOOK_ISSUE
(
	BOOK_ISSUE_NO Number,
	MEMBER_ID Varchar2(10) NOT NULL,
	BOOK_CODE Varchar2(10) NOT NULL,
	DATE_ISSUE Date NOT NULL,
	DATE_RETURN Date NOT NULL,
        DATE_RETURNED Date NULL,
	BOOK_ISSUE_STATUS Varchar2(20) NOT NULL,
	FINE_RANGE vARCHAR2(3),
	Constraints LMS_cts5 PRIMARY KEY(BOOK_ISSUE_NO),
        Constraints LMS_Mem FOREIGN KEY(MEMBER_ID) References LMS_MEMBERS(MEMBER_ID),
        Constraints LMS_BookDetail FOREIGN KEY(BOOK_CODE) References LMS_BOOK_DETAILS(BOOK_CODE),
	Constraints LMS_FineDetail FOREIGN KEY(FINE_RANGE) References LMS_FINE_DETAILS(FINE_RANGE)
);



/* ** Insert values in table called LMS_MEMBERS ** 

*/


Insert into LMS_MEMBERS
Values('LM001', 'AMIT', 'CHENNAI', '2012-02-12', '2013-02-11','Temporary');



Insert into LMS_MEMBERS
Values('LM002', 'ABDHUL', 'DELHI', '2012-04-10', '2013-04-09','Temporary');



Insert into LMS_MEMBERS
Values('LM003', 'GAYAN', 'CHENNAI', '2013-05-12','2013-05-14', 'Permanent');



Insert into LMS_MEMBERS
Values('LM004', 'RADHA', 'CHENNAI', '2012-04-22', '2013-04-21', 'Temporary');



Insert into LMS_MEMBERS
Values('LM005', 'GURU', 'BANGALORE', '2012-03-30', '2013-03-29','Temporary');



Insert into LMS_MEMBERS
Values('LM006', 'MOHAN', 'CHENNAI', '2012-04-12', '2013-04-12','Temporary');










/* ** Insert values in table called LMS_SUPPLIERS_DETAILS ** */




Insert into  LMS_SUPPLIERS_DETAILS Values ('S01','SINGAPORE SHOPPEE', 'CHENNAI', 9894123555,'sing@gmail.com');





Insert into  LMS_SUPPLIERS_DETAILS  Values ('S02','JK Stores', 'MUMBAI', 9940123450 ,'jks@yahoo.com');





Insert into  LMS_SUPPLIERS_DETAILS Values ('S03','ROSE BOOK STORE', 'TRIVANDRUM', 9444411222,'rose@gmail.com');





Insert into  LMS_SUPPLIERS_DETAILS Values ('S04','KAVARI STORE', 'DELHI', 8630001452,'kavi@redif.com');





Insert into  LMS_SUPPLIERS_DETAILS Values ('S05','EINSTEN BOOK GALLARY', 'US', 9542000001,'eingal@aol.com');





Insert into  LMS_SUPPLIERS_DETAILS Values ('S06','AKBAR STORE', 'MUMBAI',7855623100 ,'akbakst@aol.com');







/* ** Insert values in table called LMS_FINE_DETAILS ** */




Insert into LMS_FINE_DETAILS Values('R1', 20);



insert into LMS_FINE_DETAILS Values('R2', 50);



Insert into LMS_FINE_DETAILS Values('R3', 75);



Insert into LMS_FINE_DETAILS Values('R4', 100);



Insert into LMS_FINE_DETAILS Values('R5', 150);



Insert into LMS_FINE_DETAILS Values('R6', 200);

      




/* ** Insert values in table called LMS_BOOK_DETAILS ** */




Insert into LMS_BOOK_DETAILS Values('BL000001', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-10-12', 6, 600.00, 'A1', '2011-05-10', 'S01');





Insert into LMS_BOOK_DETAILS Values('BL000002', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt',  'Tata Mcgraw Hill ', '2011-10-10', 5, 750.00, 'A1', '2011-05-10', 'S03');





Insert into LMS_BOOK_DETAILS Values('BL000003', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-10-12', 6, 600.00, 'A1', '2012-05-12', 'S01');





Insert into LMS_BOOK_DETAILS Values('BL000004', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', '2011-10-10', 5, 750.00, 'A1', '2012-5-12', 'S01');





Insert into LMS_BOOK_DETAILS Values('BL000005', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel',  'Prentice Hall', '1999-12-10', 6, 600.00, 'A1', '2012-12-05', 'S01');





Insert into LMS_BOOK_DETAILS Values('BL000006', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', '2011-10-10', 5, 750.00, 'A1', '2012-12-05', 'S03');





Insert into LMS_BOOK_DETAILS  Values('BL000007', 'Let Us C', 'C', 'Yashavant Kanetkar ', 'BPB Publications', '2010-12-11',  9, 500.00 , 'A3', '2010-01-03', 'S03');





Insert into LMS_BOOK_DETAILS Values('BL000008', 'Let Us C', 'C', 'Yashavant Kanetkar ','BPB Publications', '2010-11-12',  9, 500.00 , 'A3', '2010-03-01', 'S04');





 

/* ** Insert values in table called LMS_BOOK_ISSUE ** */




Insert into LMS_BOOK_ISSUE Values (001, 'LM001', 'BL000001', '2012-05-01', '2012-05-16', '2012-05-16','N', 'R1');





Insert into LMS_BOOK_ISSUE  Values (002, 'LM002', 'BL000002', '2012-04-20', '2012-06-05','2012-05-12', 'N', 'R2');





Insert into LMS_BOOK_ISSUE Values (003, 'LM003', 'BL000007', '2012-01-04', '2012-04-16', '2012-04-20','Y','R1');





Insert into LMS_BOOK_ISSUE  Values (004, 'LM004', 'BL000005', '2012-04-01', '2012-04-16','2012-04-20', 'Y', 'R1');




Insert into LMS_BOOK_ISSUE Values (005, 'LM005', 'BL000008', '2012-03-30', '2012-04-15','2012-04-20' ,'N', 'R2');



























CREATE TABLE TRAINER_INFO(
	TRAINER_ID VARCHAR2(20) PRIMARY KEY,
	SALUTATION VARCHAR2(7),
	TRAINER_NAME VARCHAR2(30),
	TRAINER_LOCATION VARCHAR2(30),
	TRAINER_TRACK VARCHAR2(15),
	TRAINER_QUALIFICATION VARCHAR2(100),
	TRAINER_EXPERIENCE NUMBER(11),
	TRAINER_EMAIL VARCHAR2(40),
	TRAINER_PASSWORD VARCHAR2(20));

CREATE TABLE BATCH_INFO(
	BATCH_ID VARCHAR2(20) PRIMARY KEY,
	BATCH_OWNER VARCHAR2(30) NOT NULL,
	BATCH_BU_NAME VARCHAR2(30));

CREATE TABLE MODULE_INFO(
	MODULE_ID VARCHAR2(20) PRIMARY KEY,
	MODULE_NAME VARCHAR2(40),
	MODULE_DURATION NUMBER(3));

CREATE TABLE ASSOCIATE_INFO(
	ASSOCIATE_ID VARCHAR2(20) PRIMARY KEY,
	SALUTATION VARCHAR2(7),
	ASSOCIATE_NAME VARCHAR2(30),
	ASSOCIATE_LOCATION VARCHAR2(30),
	ASSOCIATE_TRACK VARCHAR2(15),
	ASSOCIATE_QUALIFICATION VARCHAR2(200),
	ASSOCIATE_EMAIL VARCHAR2(100),
	ASSOCIATE_PASSWORD VARCHAR2(20));

CREATE TABLE QUESTIONS(
	QUESTION_ID VARCHAR2(20) PRIMARY KEY,
	MODULE_ID VARCHAR2(20) REFERENCES MODULE_INFO(MODULE_ID),
	QUESTION_TEXT VARCHAR2(300));

CREATE TABLE ASSOCIATE_STATUS(
	ASSOCIATE_ID VARCHAR2(20) REFERENCES ASSOCIATE_INFO(ASSOCIATE_ID),
	MODULE_ID VARCHAR2(20) REFERENCES MODULE_INFO(MODULE_ID),
	START_DATE DATE,
	END_DATE DATE,
	ASSOCIATE_FEEDBACK_GIVEN VARCHAR2(20),
	TRAINER_FEEDBACK_GIVEN VARCHAR2(20));

CREATE TABLE TRAINER_FEEDBACK(
	TRAINER_ID VARCHAR2(20) REFERENCES TRAINER_INFO(TRAINER_ID),
	QUESTION_ID VARCHAR2(20) REFERENCES QUESTIONS(QUESTION_ID),
	BATCH_ID VARCHAR2(20) REFERENCES BATCH_INFO(BATCH_ID),
	MODULE_ID VARCHAR2(20) REFERENCES MODULE_INFO(MODULE_ID),
	TRAINER_RATING NUMBER(4) NOT NULL);

CREATE TABLE ASSOCIATE_FEEDBACK(
	ASSOCIATE_ID VARCHAR2(20) REFERENCES ASSOCIATE_INFO(ASSOCIATE_ID),
	QUESTION_ID VARCHAR2(20) REFERENCES QUESTIONS(QUESTION_ID),
	MODULE_ID VARCHAR2(20) REFERENCES MODULE_INFO(MODULE_ID),
	ASSOCIATE_RATING NUMBER(4) NOT NULL);

CREATE TABLE LOGIN_DETAILS(
	USER_ID VARCHAR2(20) PRIMARY KEY,
	USER_PASSWORD VARCHAR2(20) NOT NULL);


INSERT INTO TRAINER_INFO(TRAINER_ID,SALUTATION,TRAINER_NAME,TRAINER_LOCATION,TRAINER_TRACK,TRAINER_QUALIFICATION,TRAINER_EXPERIENCE,TRAINER_EMAIL,TRAINER_PASSWORD) VALUES ('F001','Mr.','PANKAJ GHOSH','Pune','Java','Bachelor of Technology',12,'Pankaj.Ghosh@alliance.com','fac1@123');
INSERT INTO TRAINER_INFO(TRAINER_ID,SALUTATION,TRAINER_NAME,TRAINER_LOCATION,TRAINER_TRACK,TRAINER_QUALIFICATION,TRAINER_EXPERIENCE,TRAINER_EMAIL,TRAINER_PASSWORD) VALUES ('F002','Mr.','SANJAY RADHAKRISHNAN','Bangalore','DotNet','Bachelor of Technology',12,'Sanjay.Radhakrishnan@alliance.com','fac2@123');
INSERT INTO TRAINER_INFO(TRAINER_ID,SALUTATION,TRAINER_NAME,TRAINER_LOCATION,TRAINER_TRACK,TRAINER_QUALIFICATION,TRAINER_EXPERIENCE,TRAINER_EMAIL,TRAINER_PASSWORD) VALUES ('F003','Mr.','VIJAY MATHUR','Chennai','Mainframe','Bachelor of Technology',10,'Vijay.Mathur@alliance.com','fac3@123');
INSERT INTO TRAINER_INFO(TRAINER_ID,SALUTATION,TRAINER_NAME,TRAINER_LOCATION,TRAINER_TRACK,TRAINER_QUALIFICATION,TRAINER_EXPERIENCE,TRAINER_EMAIL,TRAINER_PASSWORD) VALUES ('F004','Mrs.','NANDINI NAIR','Kolkata','Java','Master of Computer Applications',9,'Nandini.Nair@alliance.com','fac4@123');
INSERT INTO TRAINER_INFO(TRAINER_ID,SALUTATION,TRAINER_NAME,TRAINER_LOCATION,TRAINER_TRACK,TRAINER_QUALIFICATION,TRAINER_EXPERIENCE,TRAINER_EMAIL,TRAINER_PASSWORD) VALUES ('F005','Miss.','ANITHA PAREKH','Hyderabad','Testing','Master of Computer Applications',6,'Anitha.Parekh@alliance.com','fac5@123');
INSERT INTO TRAINER_INFO(TRAINER_ID,SALUTATION,TRAINER_NAME,TRAINER_LOCATION,TRAINER_TRACK,TRAINER_QUALIFICATION,TRAINER_EXPERIENCE,TRAINER_EMAIL,TRAINER_PASSWORD) VALUES ('F006','Mr.','MANOJ AGRAWAL','Mumbai','Mainframe','Bachelor of Technology',9,'Manoj.Agrawal@alliance.com','fac6@123');
INSERT INTO TRAINER_INFO(TRAINER_ID,SALUTATION,TRAINER_NAME,TRAINER_LOCATION,TRAINER_TRACK,TRAINER_QUALIFICATION,TRAINER_EXPERIENCE,TRAINER_EMAIL,TRAINER_PASSWORD) VALUES ('F007','Ms.','MEENA KULKARNI','Coimbatore','Testing','Bachelor of Technology',5,'Meena.Kulkarni@alliance.com','fac7@123');
INSERT INTO TRAINER_INFO(TRAINER_ID,SALUTATION,TRAINER_NAME,TRAINER_LOCATION,TRAINER_TRACK,TRAINER_QUALIFICATION,TRAINER_EXPERIENCE,TRAINER_EMAIL,TRAINER_PASSWORD) VALUES ('F009','Mr.','SAGAR MENON','Mumbai','Java','Master of Science in Information Technology',12,'Sagar.Menon@alliance.com','fac8@123');


INSERT INTO BATCH_INFO(BATCH_ID,BATCH_OWNER,BATCH_BU_NAME) VALUES ('B001','MRS.SWATI ROY','MSP');
INSERT INTO BATCH_INFO(BATCH_ID,BATCH_OWNER,BATCH_BU_NAME) VALUES ('B002','MRS.ARURNA K','HEALTHCARE');
INSERT INTO BATCH_INFO(BATCH_ID,BATCH_OWNER,BATCH_BU_NAME) VALUES ('B003','MR.RAJESH KRISHNAN','LIFE SCIENCES');
INSERT INTO BATCH_INFO(BATCH_ID,BATCH_OWNER,BATCH_BU_NAME) VALUES ('B004','MR.SACHIN SHETTY','BFS');
INSERT INTO BATCH_INFO(BATCH_ID,BATCH_OWNER,BATCH_BU_NAME) VALUES ('B005','MR.RAMESH PATEL','COMMUNICATIONS');
INSERT INTO BATCH_INFO(BATCH_ID,BATCH_OWNER,BATCH_BU_NAME) VALUES ('B006','MRS.SUSAN CHERIAN','RETAIL AND HOSPITALITY');
INSERT INTO BATCH_INFO(BATCH_ID,BATCH_OWNER,BATCH_BU_NAME) VALUES ('B007','MRS.SAMPADA JAIN','MSP');
INSERT INTO BATCH_INFO(BATCH_ID,BATCH_OWNER,BATCH_BU_NAME) VALUES ('B008','MRS.KAVITA REGE','BPO');
INSERT INTO BATCH_INFO(BATCH_ID,BATCH_OWNER,BATCH_BU_NAME) VALUES ('B009','MR.RAVI SEJPAL','MSP');



INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('O10SQL','Oracle 10g SQL',16);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('O10PLSQL','Oracle 10g PL/SQL',16);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('J2SE','Core Java SE 1.6',288);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('J2EE','Advanced Java EE 1.6',80);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('JAVAFX','JavaFX 2.1',80);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('DOTNET4','.Net Framework 4.0',50);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('SQL2008','MS SQl Server 2008',120);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('MSBI08','MS BI Studio 2008',158);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('SHRPNT','MS Share Point ',80);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('ANDRD4','Android 4.0',200);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('EM001','Instructor',0);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('EM002','Course Material',0);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('EM003','Learning Effectiveness',0);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('EM004','Environment',0);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('EM005','Job Impact',0);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('TM001','Attendees',0);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('TM002','Course Material',0);
INSERT INTO MODULE_INFO(MODULE_ID,MODULE_NAME,MODULE_DURATION) VALUES ('TM003','Environment',0);


INSERT INTO ASSOCIATE_INFO(ASSOCIATE_ID,SALUTATION,ASSOCIATE_NAME,ASSOCIATE_LOCATION,ASSOCIATE_TRACK,ASSOCIATE_QUALIFICATION,ASSOCIATE_EMAIL,ASSOCIATE_PASSWORD) VALUES('A001','Miss.','GAYATHRI NARAYANAN','Gurgaon','Java','Bachelor of Technology','Gayathri.Narayanan@hp.com','tne1@123');
INSERT INTO ASSOCIATE_INFO(ASSOCIATE_ID,SALUTATION,ASSOCIATE_NAME,ASSOCIATE_LOCATION,ASSOCIATE_TRACK,ASSOCIATE_QUALIFICATION,ASSOCIATE_EMAIL,ASSOCIATE_PASSWORD) VALUES('A002','Mrs.','RADHIKA MOHAN','Kerala','Java','Bachelor of Engineering In Information Technology','Radhika.Mohan@cognizant.com','tne2@123');
INSERT INTO ASSOCIATE_INFO(ASSOCIATE_ID,SALUTATION,ASSOCIATE_NAME,ASSOCIATE_LOCATION,ASSOCIATE_TRACK,ASSOCIATE_QUALIFICATION,ASSOCIATE_EMAIL,ASSOCIATE_PASSWORD) VALUES('A003','Mr.','KISHORE SRINIVAS','Chennai','Java','Bachelor of Engineering In Computers','Kishore.Srinivas@ibm.com','tne3@123');
INSERT INTO ASSOCIATE_INFO(ASSOCIATE_ID,SALUTATION,ASSOCIATE_NAME,ASSOCIATE_LOCATION,ASSOCIATE_TRACK,ASSOCIATE_QUALIFICATION,ASSOCIATE_EMAIL,ASSOCIATE_PASSWORD) VALUES('A004','Mr.','ANAND RANGANATHAN','Mumbai','DotNet','Master of Computer Applications','Anand.Ranganathan@finolex.com','tne4@123');
INSERT INTO ASSOCIATE_INFO(ASSOCIATE_ID,SALUTATION,ASSOCIATE_NAME,ASSOCIATE_LOCATION,ASSOCIATE_TRACK,ASSOCIATE_QUALIFICATION,ASSOCIATE_EMAIL,ASSOCIATE_PASSWORD) VALUES('A005','Miss.','LEELA MENON','Kerala','Mainframe','Bachelor of Engineering In Information Technology','Leela.Menon@microsoft.com','tne5@123');
INSERT INTO ASSOCIATE_INFO(ASSOCIATE_ID,SALUTATION,ASSOCIATE_NAME,ASSOCIATE_LOCATION,ASSOCIATE_TRACK,ASSOCIATE_QUALIFICATION,ASSOCIATE_EMAIL,ASSOCIATE_PASSWORD) VALUES('A006','Mrs.','ARTI KRISHNAN','Pune','Testing','Master of Computer Applications','Arti.Krishnan@cognizant.com','tne6@123');
INSERT INTO ASSOCIATE_INFO(ASSOCIATE_ID,SALUTATION,ASSOCIATE_NAME,ASSOCIATE_LOCATION,ASSOCIATE_TRACK,ASSOCIATE_QUALIFICATION,ASSOCIATE_EMAIL,ASSOCIATE_PASSWORD) VALUES('A007','Mr.','PRABHAKAR SHUNMUGHAM','Mumbai','Java','Bachelor of Technology','Prabhakar.Shunmugham@honda.com','tne7@123');



INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q001','EM001','Instructor knowledgeable and able to handle all your queries');
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q002','EM001','All the topics in a particular course handled by the trainer without any gaps or slippages');
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q003','EM002','The course materials presentation, handson,  etc. refered during the training are relevant and useful.');
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q004','EM002','The Hands on session adequate enough to grasp the understanding of the topic.');
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q005','EM002','The reference materials suggested for each module are adequate.');
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q006','EM003','Knowledge and skills presented in this training are applicatible at your work');
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q007','EM003','This training increases my proficiency level'); 
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q008','EM004','The physical environment e.g. classroom space, air-conditioning was conducive to learning.');
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q009','EM004','The software/hardware environment provided was sufficient for the purpose of the training.');
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q010','EM005','This training will improve your job performance.');
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q011','EM005','This training align with the business priorities and goals.');
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q012','TM001','Participants were receptive and had attitude towards learning.');
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q013','TM001','All participats gained the knowledge and the practical skills after this training.');
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q014','TM002','The course materials presentation, handson,  etc. available for the session covers the entire objectives of the course.');
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q015','TM002','Complexity of the course is adequate for the particpate level.');
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q016','TM002','Case study and practical demos helpful in understanding of the topic');
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q017','TM003','The physical environment e.g. classroom space, air-conditioning was conducive to learning.');
INSERT INTO QUESTIONS(QUESTION_ID,MODULE_ID,QUESTION_TEXT) VALUES('Q018','TM003','The software/hardware environment provided was adequate  for the purpose of the training.');


INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A001','O10SQL','B001','F001','15-Dec-2000','2000-12-25');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A002','O10SQL','B001','F001','15-Dec-2000','2000-12-25');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A003','O10SQL','B001','F001','15-Dec-2000','2000-12-25');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A001','O10PLSQL','B002','F002','1-Feb-2000','1-Feb-2002');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A002','O10PLSQL','B002','F002','1-Feb-2000','1-Feb-2002');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A003','O10PLSQL','B002','F002','1-Feb-2000','1-Feb-2002');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A001','J2SE','B003','F003','20-Sep-2002','25-Oct-2002');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A002','J2SE','B003','F003','20-Sep-2002','25-Oct-2002');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A001','J2EE','B004','F004','1-Dec-2005','25-Dec-2005');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A002','J2EE','B004','F004','1-Dec-2005','25-Dec-2005');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A003','J2EE','B004','F004','1-Dec-2005','25-Dec-2005');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A004','J2EE','B004','F004','1-Dec-2005','25-Dec-2005');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A005','JAVAFX','B005','F006','4-Dec-2005','20-Dec-2005');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A006','JAVAFX','B005','F006','4-Dec-2005','20-Dec-2005');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A006','SQL2008','B006','F007','21-Jun-2007','28-Jun-2007');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A007','SQL2008','B006','F007','21-Jun-2007','28-Jun-2007');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A002','MSBI08','B007','F006','26-Jun-2009','29-Jun-2009');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A003','MSBI08','B007','F006','26-Jun-2009','29-Jun-2009');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A004','MSBI08','B007','F006','26-Jun-2009','29-Jun-2009');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A002','ANDRD4','B008','F005','5-Jun-2010','28-Jun-2010');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A005','ANDRD4','B008','F005','5-Jun-2010','28-Jun-2010');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A003','ANDRD4','B009','F005','1-Sep-2011','20-Sep-2011');
INSERT INTO ASSOCIATE_STATUS(ASSOCIATE_ID,MODULE_ID,BATCH_ID,TRAINER_ID,START_DATE,END_DATE) VALUES('A006','ANDRD4','B009','F005','1-Sep-2011','20-Sep-2011');


select module_duration from module_info;

set serveroutput on;
declare
    a number:=6;
    b number;
begin
    select module_duration into b from module_info where module_duration=120 ;
    dbms_output.put_line(b);
end;

declare
    a number:=12;
begin
    loop
    a:=a+10;
    dbms_output.put_line(a);
    if a>100 then
        exit;
    end if;
    end loop;
    dbms_output.put_line('this is ending');
end;
set serveroutput on

begin
    dbms_output.put_line('Alliance Ltd .Welcome to the feedback system');
end;

select trainer_name from trainer_info;

set serveroutput on;

declare
    abc varchar2(250);
begin
select trainer_id into abc from trainer_info where trainer_id='F009';
    dbms_output.put_line(abc);
end;

select trainer_id from trainer_info where trainer_name='PANKAJ GHOSH'
select * from trainer_info;

declare
    trainer_id_ number;
    salutation_ varchar2(250);
    trainer_name_ varchar2(250);
    trainer_location_ varchar2(250);
    trainer_track_ varchar2(250);
    trainer_qualification_ varchar2(250);
    trainer_experience_ varchar2(250);
    trainer_email_ varchar2(250);
    trainer_password_ varchar2(250);
begin
    select trainer_id into trainer_
    
    
create table t(a int);

create or replace trigger t_event
before insert or delete or update or delete on t
begin
if inserting then
    dbms_output.put_line('insert fired');
elsif updating then
        dbms_output.put_line('update fired');
elsif deleting then
    dbms_output.put_line('delete fired');
end if;
end;


--set serveroutput on
insert into t values(3);

update t set a=20 where a=1;
update t set a=12 where a=2;

delete from t;






create or replace trigger stat_emp_update
before update on t
begin
    dbms_ouput.put_line('after update statement level');
end;

create or replace trigger trg_rowemp_update
after update on t
for each row 
begin
    dbms_ouput.put_line('after update row level');
end;

select * from emptbl;

create or replace trigger display_salary_changes
before delete or insert or update ON emptbl
for each row
when (NEW.id>0 or NEW.id is null)
declare
sal_dif number:=0;
begin
sal_dif:=:new.salary-:old.salary;
dbms_output.put_line('old salary'||:OLD.salary);
dbms_output.put_line('new salary:'||:NEW.salary);
dbms_output.put_line('salary difference:'||sal_dif);
end;

desc emptbl;

insert into emptbl values(3000,'din',20,'abc',1000,1);

update emptbl set salary=salary+500 where id=3000;


show errors;
set serveroutput on;
select * from emptbl;

declare
    total_rows number(2);
begin
    update emptbl set salary=salary+500 where id=1008;
    if sql%notfound then
        dbms_output.put_line('no change');
    elsif sql%found then
        total_rows:= sql%rowcount;
        dbms_output.put_line('row count is '||total_rows);
    end if;
end;


create table customers(id number,salary number);
alter table customers 
add address varchar2(250);
alter table customers 
drop column salary;
insert into customers values(1,'din','abc');
insert into customers values(2,'nitin','cba');
select * from customers;
set serveroutput on;
DECLARE  
   total_rows number(2); 
BEGIN 
   UPDATE customers 
   SET id = id + 500; 
   IF sql%notfound THEN 
      dbms_output.put_line('no customers selected'); 
   ELSIF sql%found THEN 
      total_rows:= sql%rowcount;
      dbms_output.put_line( total_rows || ' customers selected '); 
   END IF;  
END; 




select * from customers;





declare
    c_trainer_id trainer_info.trainer_id%type;
    c_salutation trainer_info.salutation%type;
    c_trainer_name trainer_info.trainer_name%type;
    c_trainer_location trainer_info.trainer_location%type;
    c_trainer_track trainer_info.trainer_track%type;
    c_trainer_qualification trainer_info.trainer_qualification%type;
    c_trainer_experience trainer_info.trainer_experience%type;
    c_trainer_email trainer_info.trainer_email%type;
    c_trainer_password trainer_info.trainer_password%type;
    cursor company IS
        select * from trainer_info;
begin
    open company;
    loop
    fetch company
    into c_trainer_id,c_salutation,c_trainer_name,c_trainer_location,c_trainer_track,c_trainer_qualification,c_trainer_experience,
    c_trainer_email,c_trainer_password;
        exit when company%notfound;
     dbms_output.put_line(c_trainer_id||' '||c_salutation||' '||c_trainer_name||' '||c_trainer_location||' '||c_trainer_track||' '||c_trainer_qualification||' '||c_trainer_experience||' '||
    c_trainer_email||' '||c_trainer_password);
    end loop;
    close company;
end;

select * from trainer_info;


select trainer_id,salutation,trainer_name,trainer_location,trainer_track,trainer_qualification,trainer_experience
        trainer_email, trainer_password from trainer_info;



DECLARE 
   c_id customers.id%type; 
   c_name customerS.No.ame%type; 
   c_addr customers.address%type; 
   CURSOR c_customers is 
      SELECT id, name, address FROM customers; 
BEGIN 
   OPEN c_customers; 
   LOOP 
   FETCH c_customers into c_id, c_name, c_addr; 
      EXIT WHEN c_customers%notfound; 
      dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr); 
   END LOOP; 
   CLOSE c_customers; 
END; 

select * from batch_info;

declare
    b_batch_id batch_info.batch_id%type;
    b_batch_owner batch_info.batch_owner%type;
    b_batch_bu_name batch_info.batch_bu_name%type;
    cursor batch is
    select batch_id , batch_owner , batch_bu_name from batch_info;
begin
    open batch;
    loop
    fetch batch into b_batch_id , b_batch_owner , b_batch_bu_name;
    exit when batch%notfound ;
    dbms_output.put_line(b_batch_id ||' '|| b_batch_owner ||' '|| b_batch_bu_name);
    end loop;
    close batch;
end;

select * from trainer_info;

declare
    tr_trainer_info trainer_info%rowtype;
begin
    select * into tr_trainer_info from trainer_info where trainer_id='F009' and trainer_track='Java' and trainer_location='Mumbai';
    dbms_output.put_line('trainer id'|| tr_trainer_info.trainer_id);
    dbms_output.put_line('salutation'|| tr_trainer_info.salutation);    
    dbms_output.put_line('trainer name'|| tr_trainer_info.trainer_name);
    dbms_output.put_line('location'|| tr_trainer_info.trainer_location);
    dbms_output.put_line('trainer track'|| tr_trainer_info.trainer_track);
    dbms_output.put_line('trainer qualification'|| tr_trainer_info.trainer_qualification);
    dbms_output.put_line('trainer experience'|| tr_trainer_info.trainer_experience);
    dbms_output.put_line('trainer email '|| tr_trainer_info.trainer_email);
    dbms_output.put_line('trainer password '|| tr_trainer_info.trainer_password);
end;

select * from questions;

declare
    g_countofquestion number;
begin
   select count(g_question_text) into countofquestion from questions;
   dbms_output.put_line('total no of questions:'||g_countofquestion);
end;

declare
    g_trainer_id trainer_info.trainer_id%type;
    g_trainer_name trainer_info.trainer_name%type;
    g_trainer_track trainer_info.trainer_track%type;
begin
    select trainer_id into 
    
--parameter ref cursor for 2 tables
decalre 
1_cursor sys_refcursor;
r1 emp%rowtype;
r2 dept%rowtype;
p_deptid emo.deptid%type:=&dept;
begin
open l_cursor
for select * from emp
    where deptid=p_deptid;
dbms_output.put_line('cursor opened for emp table');
dbms_output.put_line('*********************');
loop
fetch l_cursor into r1;
exit when l_cursor%notfound;
dbms_output.put_line('emp id :'|| r1.empid||'emp name:'||r1.empname||'age :'||r1.age);
if l_cursor%isopen then
    dbms_output.put_line('l_cursor is open'||l_cursor%rowcount);

select * from customers;

declare
    cursor poi is select id from customers;
    type tbl is table of varchar2(50);
var_tbl tbl;
begin
open poi;
fetch poi bulk collect into var_tbl limit 2000;
for iter in var_tbl.FIRST..var_tbl.LAST
loop
dbms_output.put_line('rows fetched'||iter);
end loop;
close poi;
end;

select * from module_info;
set serveroutput on;
declare
    g_module_id  module_info.module_id%type;
    g_module_name  module_info.module_name%type;
    g_module_duration  module_info.module_duration%type;
    --type ref_tbl of table 
    cursor c_module_info is select * from module_info where module_id='O10SQL' ;
begin
    open c_module_info;
    if c_module_info%found then
        loop
            fetch c_module_info into g_module_id,g_module_name,g_module_duration;
            if g_module_duration>20 then
                dbms_output.put_line(g_module_id||g_module_name||g_module_duration||'long duration  ');
            elsif g_module_duration>5 and g_module_duration<20 then
                dbms_output.put_line(g_module_id||g_module_name||g_module_duration||'short duration  ');
            else
                dbms_output.put_line(g_module_id||g_module_name||g_module_duration||'no duration  ');
             end if;   
            EXIT WHEN c_module_info%notfound;
            
        end loop;
    close c_module_info;
end;

select * from customers;
DECLARE 
   CURSOR customer_cur is 
      SELECT id, name, address  
      FROM customers; 
   customer_rec customer_cur%rowtype; 
BEGIN 
   OPEN customer_cur; 
   LOOP 
      FETCH customer_cur into customer_rec; 
      EXIT WHEN customer_cur%notfound; 
      DBMS_OUTPUT.put_line(customer_rec.id || ' ' || customer_rec.name); 
   END LOOP; 
END; 
/

    select * from associate_feedback;
set serveroutput on;
declare`
    a dept.deptid%type;
    a:=10;
begin
    dbms_ouptut.put_line(a);
end;
select * from dept;
declare 
    
    dep_it dept.deptid%type;
    dep_name dept.deptname%type;
    cursor c1 is select * from dept;
begin
    open c1;
    loop
        exit when c1%notfound;
        dbms_output.put_line(dep_it);
        dbms_output.put_line(dep_name);
     end loop;
    close c1;
end;
select * from dept;
select * from questions;
set serveroutput on;
create or replace procedure alliance(a in varchar,count1 out varchar) is
begin
count1:=cast(substr(a,2,4) AS int);
end;

declare
    ab varchar(10);
    b number(10);
begin
    select question_id into ab from questions where question_id='Q017';
    alliance(ab,b);
    insert into 
    dbms_output.put_line(b);
    end;
    
    

    

