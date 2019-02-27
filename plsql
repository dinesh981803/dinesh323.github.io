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
