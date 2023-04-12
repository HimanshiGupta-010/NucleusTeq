SQL Queries

--CREATING DATABASE

CREATE DATABASE Training;

--USING TRAINING DATABASE

USE Training;

--CREATING TABLES

CREATE TABLE Teacher(T_ID INT PRIMARY KEY, T_NAME VARCHAR(50));

CREATE TABLE Course(C_ID INT PRIMARY KEY, C_NAME VARCHAR(30), TEACHER INT, FOREIGN KEY(TEACHER) REFERENCES Teacher(T_ID));

CREATE TABLE Student(S_ID INT PRIMARY KEY, S_NAME VARCHAR(30), COURSE INT, FOREIGN KEY(COURSE) REFERENCES Course(C_ID));

--INSERT INTO COMMAND

--INSERTING DATA INTO TEACHER TABLE.

INSERT INTO TEACHER VALUES(101, 'JASMEET KAUR');

INSERT INTO TEACHER VALUES(102, 'POOJA GUPTA'), (103, 'UPENDRA SINGH'), (104, 'SHUBHANGI PANDEY'), (105, 'RUCHI SHARMA');

INSERT INTO TEACHER VALUES(106, 'SUNITA VERMA'), (107, 'ROHIT JAIN'), (108, 'PREETI SENGAR'), (109, 'CHANDRA PRAKASH');

INSERT INTO TEACHER VALUES(110, 'KAVITA LODHI');

INSERT INTO TEACHER VALUES(112, 'ROHIT SINGH THAKUR');

INSERT INTO TEACHER VALUES(113, 'NEHA AGARWAL');


--INSERTING DATA INTO COURSE TABLE.

INSERT INTO COURSE VALUES(20001, 'JAVA', 103);

INSERT INTO COURSE VALUES(20002, 'OPERATING SYSTEM', 101);

INSERT INTO COURSE VALUES(20003, 'C/C++', 103);

INSERT INTO COURSE VALUES(20004, 'MACHINE LEARNING', 104);

INSERT INTO COURSE VALUES(20005, 'CLOUD COMPUTING', 102);

INSERT INTO COURSE VALUES(20006, 'INFORMATION SECURITY', 101);

INSERT INTO COURSE VALUES(20007, 'INTERNET & WEB TECHNOLOGIES', 105);

INSERT INTO COURSE VALUES(20008, 'SEMINAR', 113);

INSERT INTO COURSE VALUES(20009, 'COA', 110);

INSERT INTO COURSE VALUES(20010, 'SOFTWARE ENGINEERING', 109);

INSERT INTO COURSE VALUES(20011, 'DBMS', 107);

INSERT INTO COURSE VALUES(20012, 'STATISTICS', 108);


--INSERTING DATA INTO STUDENT TABLE.

INSERT INTO STUDENT VALUES(001, 'AANSHI GUPTA', 20001);

INSERT INTO STUDENT VALUES(002, 'AAYUSHI MANDLOI', 20002);

INSERT INTO STUDENT VALUES(003, 'ABHISHEK GARG', 20008);

INSERT INTO STUDENT VALUES(004, 'AGIN PUROHIT', 20009);

INSERT INTO STUDENT VALUES(005, 'AYUSHI VISHWAKARMA', 20010);

INSERT INTO STUDENT VALUES(006, 'HARSHIT VYAS', 20007);

INSERT INTO STUDENT VALUES(007, 'HIMANSHI GUPTA', 20011);

INSERT INTO STUDENT VALUES(008, 'RITUJA KEKATPURE', 20006);

INSERT INTO STUDENT VALUES(009, 'SNEHA BHATE', 20004);

INSERT INTO STUDENT VALUES(010, 'SHIVANI PARMAR', 20005);

INSERT INTO STUDENT VALUES(011, 'MEGHA MATHE', 20003);

INSERT INTO STUDENT VALUES(012, 'KANIKA PATIDAR', 20001);

INSERT INTO STUDENT VALUES(013, 'ANKIT SAINI', 20005);

INSERT INTO STUDENT VALUES(014, 'NISHANT GOEL', 20004);

INSERT INTO STUDENT (S_ID, S_NAME) VALUES(015, 'PRATIK KUSHWAH'), (016, 'DIVYA SHARMA');



--TEACHER TABLE AFTER INSERTING DATA

mysql> SELECT * FROM TEACHER;
+------+--------------------+
| T_ID | T_NAME             |
+------+--------------------+
|  101 | JASMEET KAUR       |
|  102 | POOJA GUPTA        |
|  103 | UPENDRA SINGH      |
|  104 | SHUBHANGI PANDEY   |
|  105 | RUCHI SHARMA       |
|  106 | SUNITA VERMA       |
|  107 | ROHIT JAIN         |
|  108 | PREETI SENGAR      |
|  109 | CHANDRA PRAKASH    |
|  110 | KAVITA LODHI       |
|  111 | MANJEET SONI       |
|  112 | ROHIT SINGH THAKUR |
|  113 | NEHA AGARWAL       |
+------+--------------------+
13 rows in set (0.00 sec)


--COURSE TABLE AFTER INSERTING DATA

mysql> SELECT * FROM COURSE;
+-------+-----------------------------+---------+
| C_ID  | C_NAME                      | TEACHER |
+-------+-----------------------------+---------+
| 20001 | JAVA                        |     103 |
| 20002 | OPERATING SYSTEM            |     101 |
| 20003 | C/C++                       |     103 |
| 20004 | MACHINE LEARNING            |     104 |
| 20005 | CLOUD COMPUTING             |     102 |
| 20006 | INFORMATION SECURITY        |     101 |
| 20007 | INTERNET & WEB TECHNOLOGIES |     105 |
| 20008 | SEMINAR                     |     113 |
| 20009 | COA                         |     110 |
| 20010 | SOFTWARE ENGINEERING        |     109 |
| 20011 | DBMS                        |     107 |
| 20012 | STATISTICS                  |     108 |
+-------+-----------------------------+---------+
12 rows in set (0.00 sec)


--STUDENT TABLE AFTER INSERTING DATA

mysql> SELECT * FROM STUDENT;
+------+--------------------+--------+
| S_ID | S_NAME             | COURSE |
+------+--------------------+--------+
|    1 | AANSHI GUPTA       |  20001 |
|    2 | AAYUSHI MANDLOI    |  20002 |
|    3 | ABHISHEK GARG      |  20008 |
|    4 | AGIN PUROHIT       |  20009 |
|    5 | AYUSHI VISHWAKARMA |  20010 |
|    6 | HARSHIT VYAS       |  20007 |
|    7 | HIMANSHI GUPTA     |  20011 |
|    8 | RITUJA KEKATPURE   |  20006 |
|    9 | SNEHA BHATE        |  20004 |
|   10 | SHIVANI PARMAR     |  20005 |
|   11 | MEGHA MATHE        |  20003 |
|   12 | KANIKA PATIDAR     |  20001 |
|   13 | ANKIT SAINI        |  20005 |
|   14 | NISHANT GOEL       |  20004 |
|   15 | PRATIK KUSHWAH     |   NULL |
|   16 | DIVYA SHARMA       |   NULL |
+------+--------------------+--------+
16 rows in set (0.00 sec)

-- PERFORMING QUERIES

--IS NULL

(1) WRITE AN SQL QUERY TO SELECT THOSE STUDENT NAMES WHO HAVEN'T ENROLLED IN ANY COURSE.

mysql> SELECT S_NAME FROM STUDENT WHERE COURSE IS NULL;
+----------------+
| S_NAME         |
+----------------+
| PRATIK KUSHWAH |
| DIVYA SHARMA   |
+----------------+
2 rows in set (0.00 sec)

--WHERE CLAUSE

(2) WRITE AN SQL QUERY TO SELECT THE STUDENT DETAILS WHOSE COURSE ID IS 20011.

mysql> SELECT * FROM STUDENT WHERE COURSE = 20011;
+------+----------------+--------+
| S_ID | S_NAME         | COURSE |
+------+----------------+--------+
|    7 | HIMANSHI GUPTA |  20011 |
+------+----------------+--------+
1 row in set (0.00 sec)

--LIKE KEYWORD

(3) WRITE AN SQL QUERY TO SELECT THOSE STUDENT DETAILS WHOSE NAME START WITH 'A'.

mysql> SELECT * FROM STUDENT WHERE S_NAME LIKE 'A%';
+------+--------------------+--------+
| S_ID | S_NAME             | COURSE |
+------+--------------------+--------+
|    1 | AANSHI GUPTA       |  20001 |
|    2 | AAYUSHI MANDLOI    |  20002 |
|    3 | ABHISHEK GARG      |  20008 |
|    4 | AGIN PUROHIT       |  20009 |
|    5 | AYUSHI VISHWAKARMA |  20010 |
|   13 | ANKIT SAINI        |  20005 |
+------+--------------------+--------+
6 rows in set (0.01 sec)

--UPDATE COMMAND

(4) WRITE AN SQL QUERY TO UPDATE COURSE OF THAT STUDENT WHOSE STUDENT ID IS 016.

mysql> UPDATE STUDENT SET COURSE = 20010 WHERE S_ID = 016;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM STUDENT;
+------+--------------------+--------+
| S_ID | S_NAME             | COURSE |
+------+--------------------+--------+
|    1 | AANSHI GUPTA       |  20001 |
|    2 | AAYUSHI MANDLOI    |  20002 |
|    3 | ABHISHEK GARG      |  20008 |
|    4 | AGIN PUROHIT       |  20009 |
|    5 | AYUSHI VISHWAKARMA |  20010 |
|    6 | HARSHIT VYAS       |  20007 |
|    7 | HIMANSHI GUPTA     |  20011 |
|    8 | RITUJA KEKATPURE   |  20006 |
|    9 | SNEHA BHATE        |  20004 |
|   10 | SHIVANI PARMAR     |  20005 |
|   11 | MEGHA MATHE        |  20003 |
|   12 | KANIKA PATIDAR     |  20001 |
|   13 | ANKIT SAINI        |  20005 |
|   14 | NISHANT GOEL       |  20004 |
|   15 | PRATIK KUSHWAH     |   NULL |
|   16 | DIVYA SHARMA       |  20010 |
+------+--------------------+--------+

--AGGREGATE FUNCTION COUNT

(5) WRITE AN SQL QUERY TO COUNT STUDENTS AND GROUP THEM COURSE WISE COURSE WISE.  

mysql> SELECT COURSE, COUNT(S_ID) FROM STUDENT GROUP BY COURSE;
+--------+-------------+
| COURSE | COUNT(S_ID) |
+--------+-------------+
|   NULL |           2 |
|  20001 |           2 |
|  20002 |           1 |
|  20003 |           1 |
|  20004 |           2 |
|  20005 |           2 |
|  20006 |           1 |
|  20007 |           1 |
|  20008 |           1 |
|  20009 |           1 |
|  20010 |           1 |
|  20011 |           1 |
+--------+-------------+
12 rows in set (0.00 sec)

--INNER JOIN

(6) WRITE AN SQL QUERY TO PERFORM INNER JOIN BETWEEN COURSE AND TEACHER TABLE.

mysql> SELECT COURSE.C_ID, COURSE.C_NAME, TEACHER.T_NAME FROM COURSE INNER JOIN TEACHER ON TEACHER.T_ID = COURSE.TEACHER;
+-------+-----------------------------+------------------+
| C_ID  | C_NAME                      | T_NAME           |
+-------+-----------------------------+------------------+
| 20001 | JAVA                        | UPENDRA SINGH    |
| 20002 | OPERATING SYSTEM            | JASMEET KAUR     |
| 20003 | C/C++                       | UPENDRA SINGH    |
| 20004 | MACHINE LEARNING            | SHUBHANGI PANDEY |
| 20005 | CLOUD COMPUTING             | POOJA GUPTA      |
| 20006 | INFORMATION SECURITY        | JASMEET KAUR     |
| 20007 | INTERNET & WEB TECHNOLOGIES | RUCHI SHARMA     |
| 20008 | SEMINAR                     | NEHA AGARWAL     |
| 20009 | COA                         | KAVITA LODHI     |
| 20010 | SOFTWARE ENGINEERING        | CHANDRA PRAKASH  |
| 20011 | DBMS                        | ROHIT JAIN       |
| 20012 | STATISTICS                  | PREETI SENGAR    |
+-------+-----------------------------+------------------+
12 rows in set (0.01 sec)

--RIGHT JOIN

(7) WRITE AN SQL QUERY TO PERFORM RIGHT JOIN BETWEEN COURSE AND TEACHER TABLE.

mysql> SELECT COURSE.C_ID, COURSE.C_NAME, TEACHER.T_NAME FROM COURSE RIGHT JOIN TEACHER ON TEACHER.T_ID = COURSE.TEACHER;
+-------+-----------------------------+--------------------+
| C_ID  | C_NAME                      | T_NAME             |
+-------+-----------------------------+--------------------+
| 20002 | OPERATING SYSTEM            | JASMEET KAUR       |
| 20006 | INFORMATION SECURITY        | JASMEET KAUR       |
| 20005 | CLOUD COMPUTING             | POOJA GUPTA        |
| 20001 | JAVA                        | UPENDRA SINGH      |
| 20003 | C/C++                       | UPENDRA SINGH      |
| 20004 | MACHINE LEARNING            | SHUBHANGI PANDEY   |
| 20007 | INTERNET & WEB TECHNOLOGIES | RUCHI SHARMA       |
|  NULL | NULL                        | SUNITA VERMA       |
| 20011 | DBMS                        | ROHIT JAIN         |
| 20012 | STATISTICS                  | PREETI SENGAR      |
| 20010 | SOFTWARE ENGINEERING        | CHANDRA PRAKASH    |
| 20009 | COA                         | KAVITA LODHI       |
|  NULL | NULL                        | MANJEET SONI       |
|  NULL | NULL                        | ROHIT SINGH THAKUR |
| 20008 | SEMINAR                     | NEHA AGARWAL       |
+-------+-----------------------------+--------------------+
15 rows in set (0.00 sec)

--LEFT JOIN

(8) WRITE AN SQL QUERY TO PERFORM LEFT JOIN BETWEEN COURSE AND TEACHER TABLE.

mysql> SELECT COURSE.C_ID, COURSE.C_NAME, TEACHER.T_NAME FROM COURSE LEFT JOIN TEACHER ON TEACHER.T_ID = COURSE.TEACHER;
+-------+-----------------------------+------------------+
| C_ID  | C_NAME                      | T_NAME           |
+-------+-----------------------------+------------------+
| 20001 | JAVA                        | UPENDRA SINGH    |
| 20002 | OPERATING SYSTEM            | JASMEET KAUR     |
| 20003 | C/C++                       | UPENDRA SINGH    |
| 20004 | MACHINE LEARNING            | SHUBHANGI PANDEY |
| 20005 | CLOUD COMPUTING             | POOJA GUPTA      |
| 20006 | INFORMATION SECURITY        | JASMEET KAUR     |
| 20007 | INTERNET & WEB TECHNOLOGIES | RUCHI SHARMA     |
| 20008 | SEMINAR                     | NEHA AGARWAL     |
| 20009 | COA                         | KAVITA LODHI     |
| 20010 | SOFTWARE ENGINEERING        | CHANDRA PRAKASH  |
| 20011 | DBMS                        | ROHIT JAIN       |
| 20012 | STATISTICS                  | PREETI SENGAR    |
+-------+-----------------------------+------------------+
12 rows in set (0.00 sec)

--DISTINCT KEYWORD

(9) WRITE AN SQL QUERY TO SELECT DISTINCT COURSE FROM THE STUDENT TABLE.

mysql> SELECT DISTINCT COURSE FROM STUDENT;
+--------+
| COURSE |
+--------+
|   NULL |
|  20001 |
|  20002 |
|  20003 |
|  20004 |
|  20005 |
|  20006 |
|  20007 |
|  20008 |
|  20009 |
|  20010 |
|  20011 |
+--------+
12 rows in set (0.01 sec)

--ALTER COMMAND

(10) WRITE AN SQL QUERY TO ADD CITY COLUMN IN STUDENT TABLE.

mysql> ALTER TABLE STUDENT ADD COLUMN CITY VARCHAR(50);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0


(11) WRITE AN SQL QUERY TO ADD CITY COLUMN IN TEACHER TABLE.

mysql> ALTER TABLE TEACHER ADD COLUMN CITY VARCHAR(50);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

--DESC COMMAND

(12) WRITE AN SQL QUERY TO DESCRIBE STUDENT TABLE.

mysql> DESC STUDENT;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| S_ID   | int         | NO   | PRI | NULL    |       |
| S_NAME | varchar(30) | YES  |     | NULL    |       |
| COURSE | int         | YES  | MUL | NULL    |       |
| CITY   | varchar(50) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)


(13) WRITE AN SQL QUERY TO DESCRIBE TEACHER TABLE.


mysql> DESC TEACHER;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| T_ID   | int         | NO   | PRI | NULL    |       |
| T_NAME | varchar(50) | YES  |     | NULL    |       |
| CITY   | varchar(50) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

--UPDATE COMMAND

(14) WRITE AN SQL QUERY TO UPDATE CITY TO INDORE OF THOSE STUDENTS WHOSE STUDENT ID IS 1, 3, 5, 6, 11.

mysql>  UPDATE STUDENT SET CITY = 'INDORE' WHERE S_ID IN (1, 3, 5, 6, 11);
Query OK, 5 rows affected (0.02 sec)
Rows matched: 5  Changed: 5  Warnings: 0

(15) WRITE AN SQL QUERY TO UPDATE CITY TO RATLAM OF THOSE STUDENTS WHOSE STUDENT ID IS 4, 14, 16.

mysql>  UPDATE STUDENT SET CITY = 'RATLAM' WHERE S_ID IN (4, 14, 16);
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

(16) WRITE AN SQL QUERY TO UPDATE CITY TO KHANDWA OF THOSE STUDENTS WHOSE STUDENT ID IS 2, 9.

mysql>  UPDATE STUDENT SET CITY = 'KHANDWA' WHERE S_ID IN (2, 9);
Query OK, 2 rows affected (0.02 sec)
Rows matched: 2  Changed: 2  Warnings: 0


(17) WRITE AN SQL QUERY TO UPDATE CITY TO RAJPUR OF THAT STUDENT WHOSE STUDENT ID IS 7.

mysql>  UPDATE STUDENT SET CITY = 'RAJPUR' WHERE S_ID = 7;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

(18) WRITE AN SQL QUERY TO UPDATE CITY TO MAHOO OF THOSE STUDENTS WHOSE STUDENT ID IS 12, 13.

mysql>  UPDATE STUDENT SET CITY = 'MAHOO' WHERE S_ID IN (12, 13);
Query OK, 2 rows affected (0.00 sec)
Rows matched: 2  Changed: 2  Warnings: 0

(19) WRITE AN SQL QUERY TO UPDATE CITY TO SURAT OF THAT STUDENT WHOSE STUDENT ID IS 15.

mysql> UPDATE STUDENT SET CITY = 'SURAT' WHERE S_ID = 15;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

(20)  WRITE AN SQL QUERY TO UPDATE CITY TO INDORE OF THOSE STUDENTS WHOSE STUDENT ID IS 8, 10.

mysql>  UPDATE STUDENT SET CITY = 'INDORE' WHERE S_ID IN (8, 10);
Query OK, 2 rows affected (0.03 sec)
Rows matched: 2  Changed: 2  Warnings: 0

(21) WRITE AN SQL QUERY TO UPDATE CITY TO INDORE OF THOSE TEACHERS WHOSE TEACHER ID IS 102, 103, 106, 107, 110, 111, 113.

mysql>  UPDATE TEACHER SET CITY = 'INDORE' WHERE T_ID IN (102, 103, 106, 107, 110, 111, 113);
Query OK, 7 rows affected (0.01 sec)
Rows matched: 7  Changed: 7  Warnings: 0

(22) WRITE AN SQL QUERY TO UPDATE CITY TO AMRITSAR OF THAT TEACHER WHOSE TEACHER ID IS 101.

mysql>  UPDATE TEACHER SET CITY = 'AMRITSAR' WHERE T_ID = 101;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

(23) WRITE AN SQL QUERY TO UPDATE CITY TO GWALIOR OF THAT TEACHER WHOSE TEACHER ID IS 108.

mysql>  UPDATE TEACHER SET CITY = 'GWALIOR' WHERE T_ID = 108;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0


(24) WRITE AN SQL QUERY TO UPDATE CITY TO JABALPUR OF THAT TEACHER WHOSE TEACHER ID IS 112.

mysql>  UPDATE TEACHER SET CITY = 'JABALPUR' WHERE T_ID = 112;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

(25) WRITE AN SQL QUERY TO UPDATE CITY TO INDORE OF THAT TEACHER WHOSE TEACHER ID IS 109.

mysql>  UPDATE TEACHER SET CITY = 'INDORE' WHERE T_ID = 109;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

--TEACHER TABLE AFTER UPDATION 

mysql> SELECT * FROM TEACHER;
+------+--------------------+----------+
| T_ID | T_NAME             | CITY     |
+------+--------------------+----------+
|  101 | JASMEET KAUR       | AMRITSAR |
|  102 | POOJA GUPTA        | INDORE   |
|  103 | UPENDRA SINGH      | INDORE   |
|  104 | SHUBHANGI PANDEY   | MAHOO    |
|  105 | RUCHI SHARMA       | MAHOO    |
|  106 | SUNITA VERMA       | INDORE   |
|  107 | ROHIT JAIN         | INDORE   |
|  108 | PREETI SENGAR      | GWALIOR  |
|  109 | CHANDRA PRAKASH    | INDORE   |
|  110 | KAVITA LODHI       | INDORE   |
|  111 | MANJEET SONI       | INDORE   |
|  112 | ROHIT SINGH THAKUR | JABALPUR |
|  113 | NEHA AGARWAL       | INDORE   |
+------+--------------------+----------+
13 rows in set (0.00 sec)

--STUDENT TABLE AFTER UPDATION

mysql> SELECT * FROM STUDENT;
+------+--------------------+--------+---------+
| S_ID | S_NAME             | COURSE | CITY    |
+------+--------------------+--------+---------+
|    1 | AANSHI GUPTA       |  20001 | INDORE  |
|    2 | AAYUSHI MANDLOI    |  20002 | KHANDWA |
|    3 | ABHISHEK GARG      |  20008 | INDORE  |
|    4 | AGIN PUROHIT       |  20009 | RATLAM  |
|    5 | AYUSHI VISHWAKARMA |  20010 | INDORE  |
|    6 | HARSHIT VYAS       |  20007 | INDORE  |
|    7 | HIMANSHI GUPTA     |  20011 | RAJPUR  |
|    8 | RITUJA KEKATPURE   |  20006 | INDORE  |
|    9 | SNEHA BHATE        |  20004 | KHANDWA |
|   10 | SHIVANI PARMAR     |  20005 | INDORE  |
|   11 | MEGHA MATHE        |  20003 | INDORE  |
|   12 | KANIKA PATIDAR     |  20001 | MAHOO   |
|   13 | ANKIT SAINI        |  20005 | MAHOO   |
|   14 | NISHANT GOEL       |  20004 | RATLAM  |
|   15 | PRATIK KUSHWAH     |   NULL | SURAT   |
|   16 | DIVYA SHARMA       |   NULL | RATLAM  |
+------+--------------------+--------+---------+
16 rows in set (0.00 sec)

--UNION AND UNION ALL

(26) WRITE AN SQL QUERY TO PERFORM UNION BETWEEN TEACHER AND STUDENT TABLE.

mysql> SELECT CITY FROM STUDENT UNION SELECT CITY FROM TEACHER ORDER BY CITY;
+----------+
| CITY     |
+----------+
| AMRITSAR |
| GWALIOR  |
| INDORE   |
| JABALPUR |
| KHANDWA  |
| MAHOO    |
| RAJPUR   |
| RATLAM   |
| SURAT    |
+----------+
9 rows in set (0.00 sec)


(27) WRITE AN SQL QUERY TO PERFORM UNION ALL BETWEEN TEACHER AND STUDENT TABLE.

mysql> SELECT CITY FROM STUDENT UNION ALL SELECT CITY FROM TEACHER ORDER BY CITY;
+----------+
| CITY     |
+----------+
| AMRITSAR |
| GWALIOR  |
| INDORE   |
| INDORE   |
| INDORE   |
| INDORE   |
| INDORE   |
| INDORE   |
| INDORE   |
| INDORE   |
| INDORE   |
| INDORE   |
| INDORE   |
| INDORE   |
| INDORE   |
| INDORE   |
| INDORE   |
| JABALPUR |
| KHANDWA  |
| KHANDWA  |
| MAHOO    |
| MAHOO    |
| MAHOO    |
| MAHOO    |
| RAJPUR   |
| RATLAM   |
| RATLAM   |
| RATLAM   |
| SURAT    |
+----------+
29 rows in set (0.00 sec)

--AGGREGATE FUNCTION

(28) WRITE AN SQL QUERY TO COUNT TEACHERS.

mysql> SELECT COUNT(T_ID) FROM TEACHER;
+-------------+
| COUNT(T_ID) |
+-------------+
|          13 |
+-------------+
1 row in set (0.03 sec)



--WINDOW FUNCTIONS

--CREATIUNG NEW TABLE NAMED EMPLOYEE_SALES

mysql> CREATE TABLE EMPLOYEE_SALES(EMPLOYEE_ID INT PRIMARY KEY, DEPARTMENT_ID INT, PRODUCT_ID INT, QUANTITY INT, SALES INT, SALES_YEAR INT);
Query OK, 0 rows affected (0.07 sec)

--INSERTING DATA INTO EMPLOYEE_SALES TABLE

mysql> INSERT INTO EMPLOYEE_SALES VALUES(100, 1, 1, 21, 200, 2000), (101, 1, 1, 21, 150, 2001), (102, 2, 2, 45, 211, 2002), (103, 3, 2, 21, 2345, 2003);
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT INTO EMPLOYEE_SALES VALUES(104, 1, 3, 45, 322, 2004), (105, 3, 2, 45, 4000, 2005), (106, 1, 3, 56, 322, 2006), (107, 2, 2, 32, 322, 2007);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT INTO EMPLOYEE_SALES VALUES(108, 2, 3, 22, 322, 2008), (109, 3, 3, 44, 3211, 2009), (110, 3, 2, 66, 4000, 2010);
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0


--EMPLOYEE_SALES TABLE AFTER INSERTING DATA

mysql> SELECT * FROM EMPLOYEE_SALES;
+-------------+---------------+------------+----------+-------+------------+
| EMPLOYEE_ID | DEPARTMENT_ID | PRODUCT_ID | QUANTITY | SALES | SALES_YEAR |
+-------------+---------------+------------+----------+-------+------------+
|         100 |             1 |          1 |       21 |   200 |       2000 |
|         101 |             1 |          1 |       21 |   150 |       2001 |
|         102 |             2 |          2 |       45 |   211 |       2002 |
|         103 |             3 |          2 |       21 |  2345 |       2003 |
|         104 |             1 |          3 |       45 |   322 |       2004 |
|         105 |             3 |          2 |       45 |  4000 |       2005 |
|         106 |             1 |          3 |       56 |   322 |       2006 |
|         107 |             2 |          2 |       32 |   322 |       2007 |
|         108 |             2 |          3 |       22 |   322 |       2008 |
|         109 |             3 |          3 |       44 |  3211 |       2009 |
|         110 |             3 |          2 |       66 |  4000 |       2010 |
+-------------+---------------+------------+----------+-------+------------+
11 rows in set (0.00 sec)



--QUERIES 

(1)

mysql> SELECT EMPLOYEE_ID, PRODUCT_ID, SUM(SALES) OVER() AS TOTAL_SALES FROM EMPLOYEE_SALES;
+-------------+------------+-------------+
| EMPLOYEE_ID | PRODUCT_ID | TOTAL_SALES |
+-------------+------------+-------------+
|         100 |          1 |       15405 |
|         101 |          1 |       15405 |
|         102 |          2 |       15405 |
|         103 |          2 |       15405 |
|         104 |          3 |       15405 |
|         105 |          2 |       15405 |
|         106 |          3 |       15405 |
|         107 |          2 |       15405 |
|         108 |          3 |       15405 |
|         109 |          3 |       15405 |
|         110 |          2 |       15405 |
+-------------+------------+-------------+
11 rows in set (0.02 sec)

--OVER()

(2) WRITE AN SQL QUERY TO FIND SALES DEPARTMENT WISE WITH EMPLOYEE ID AND PRODUCT ID DETAILS.

mysql> SELECT EMPLOYEE_ID, PRODUCT_ID, SUM(SALES) OVER(PARTITION BY DEPARTMENT_ID) AS TOTAL_SALES FROM EMPLOYEE_SALES;
+-------------+------------+-------------+
| EMPLOYEE_ID | PRODUCT_ID | TOTAL_SALES |
+-------------+------------+-------------+
|         100 |          1 |         994 |
|         101 |          1 |         994 |
|         104 |          3 |         994 |
|         106 |          3 |         994 |
|         102 |          2 |         855 |
|         107 |          2 |         855 |
|         108 |          3 |         855 |
|         103 |          2 |       13556 |
|         105 |          2 |       13556 |
|         109 |          3 |       13556 |
|         110 |          2 |       13556 |
+-------------+------------+-------------+
11 rows in set (0.01 sec)


--RANK()

(3)

mysql> SELECT EMPLOYEE_ID, PRODUCT_ID, DEPARTMENT_ID, SALES, RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALES DESC) AS SALES_RANK FROM EMPLOYEE_SALES;
+-------------+------------+---------------+-------+------------+
| EMPLOYEE_ID | PRODUCT_ID | DEPARTMENT_ID | SALES | SALES_RANK |
+-------------+------------+---------------+-------+------------+
|         104 |          3 |             1 |   322 |          1 |
|         106 |          3 |             1 |   322 |          1 |
|         100 |          1 |             1 |   200 |          3 |
|         101 |          1 |             1 |   150 |          4 |
|         107 |          2 |             2 |   322 |          1 |
|         108 |          3 |             2 |   322 |          1 |
|         102 |          2 |             2 |   211 |          3 |
|         105 |          2 |             3 |  4000 |          1 |
|         110 |          2 |             3 |  4000 |          1 |
|         109 |          3 |             3 |  3211 |          3 |
|         103 |          2 |             3 |  2345 |          4 |
+-------------+------------+---------------+-------+------------+
11 rows in set (0.00 sec)


--DENSE_RANK()

(4)

mysql> SELECT EMPLOYEE_ID, PRODUCT_ID, DEPARTMENT_ID, SALES, RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALES DESC) AS SALES_RANK, DENSE_RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALES DESC) AS DENSE_SALES_RANK FROM EMPLOYEE_SALES;
+-------------+------------+---------------+-------+------------+------------------+
| EMPLOYEE_ID | PRODUCT_ID | DEPARTMENT_ID | SALES | SALES_RANK | DENSE_SALES_RANK |
+-------------+------------+---------------+-------+------------+------------------+
|         104 |          3 |             1 |   322 |          1 |                1 |
|         106 |          3 |             1 |   322 |          1 |                1 |
|         100 |          1 |             1 |   200 |          3 |                2 |
|         101 |          1 |             1 |   150 |          4 |                3 |
|         107 |          2 |             2 |   322 |          1 |                1 |
|         108 |          3 |             2 |   322 |          1 |                1 |
|         102 |          2 |             2 |   211 |          3 |                2 |
|         105 |          2 |             3 |  4000 |          1 |                1 |
|         110 |          2 |             3 |  4000 |          1 |                1 |
|         109 |          3 |             3 |  3211 |          3 |                2 |
|         103 |          2 |             3 |  2345 |          4 |                3 |
+-------------+------------+---------------+-------+------------+------------------+
11 rows in set (0.00 sec)

--ROW_NUMBER()

(5)

mysql> SELECT EMPLOYEE_ID, PRODUCT_ID, DEPARTMENT_ID, SALES, ROW_NUMBER() OVER(ORDER BY SALES DESC) AS 'ROW_NUMBER' FROM EMPLOYEE_SALES;
+-------------+------------+---------------+-------+------------+
| EMPLOYEE_ID | PRODUCT_ID | DEPARTMENT_ID | SALES | ROW_NUMBER |
+-------------+------------+---------------+-------+------------+
|         105 |          2 |             3 |  4000 |          1 |
|         110 |          2 |             3 |  4000 |          2 |
|         109 |          3 |             3 |  3211 |          3 |
|         103 |          2 |             3 |  2345 |          4 |
|         104 |          3 |             1 |   322 |          5 |
|         106 |          3 |             1 |   322 |          6 |
|         107 |          2 |             2 |   322 |          7 |
|         108 |          3 |             2 |   322 |          8 |
|         102 |          2 |             2 |   211 |          9 |
|         100 |          1 |             1 |   200 |         10 |
|         101 |          1 |             1 |   150 |         11 |
+-------------+------------+---------------+-------+------------+
11 rows in set (0.00 sec)

--NTILE()

(6)

mysql> SELECT EMPLOYEE_ID, PRODUCT_ID, DEPARTMENT_ID, SALES, NTILE(2) OVER(ORDER BY SALES DESC) AS 'ROW_NUMBER' FROM EMPLOYEE_SALES;
+-------------+------------+---------------+-------+------------+
| EMPLOYEE_ID | PRODUCT_ID | DEPARTMENT_ID | SALES | ROW_NUMBER |
+-------------+------------+---------------+-------+------------+
|         105 |          2 |             3 |  4000 |          1 |
|         110 |          2 |             3 |  4000 |          1 |
|         109 |          3 |             3 |  3211 |          1 |
|         103 |          2 |             3 |  2345 |          1 |
|         104 |          3 |             1 |   322 |          1 |
|         106 |          3 |             1 |   322 |          1 |
|         107 |          2 |             2 |   322 |          2 |
|         108 |          3 |             2 |   322 |          2 |
|         102 |          2 |             2 |   211 |          2 |
|         100 |          1 |             1 |   200 |          2 |
|         101 |          1 |             1 |   150 |          2 |
+-------------+------------+---------------+-------+------------+
11 rows in set (0.00 sec)

--LAG()

(7)

mysql> SELECT EMPLOYEE_ID, PRODUCT_ID, DEPARTMENT_ID, SALES, LAG(SALES) OVER(ORDER BY SALES_YEAR ASC) AS 'PREVIOUS YEAR' FROM EMPLOYEE_SALES;
+-------------+------------+---------------+-------+---------------+
| EMPLOYEE_ID | PRODUCT_ID | DEPARTMENT_ID | SALES | PREVIOUS YEAR |
+-------------+------------+---------------+-------+---------------+
|         100 |          1 |             1 |   200 |          NULL |
|         101 |          1 |             1 |   150 |           200 |
|         102 |          2 |             2 |   211 |           150 |
|         103 |          2 |             3 |  2345 |           211 |
|         104 |          3 |             1 |   322 |          2345 |
|         105 |          2 |             3 |  4000 |           322 |
|         106 |          3 |             1 |   322 |          4000 |
|         107 |          2 |             2 |   322 |           322 |
|         108 |          3 |             2 |   322 |           322 |
|         109 |          3 |             3 |  3211 |           322 |
|         110 |          2 |             3 |  4000 |          3211 |
+-------------+------------+---------------+-------+---------------+
11 rows in set (0.01 sec)

--LEAD()

(8)

mysql> SELECT EMPLOYEE_ID, PRODUCT_ID, DEPARTMENT_ID, SALES, LAG(SALES) OVER(ORDER BY SALES_YEAR ASC) AS 'PREVIOUS YEAR', LEAD(SALES) OVER(ORDER BY SALES_YEAR ASC) AS 'NEXT YEAR' FROM EMPLOYEE_SALES;
+-------------+------------+---------------+-------+---------------+-----------+
| EMPLOYEE_ID | PRODUCT_ID | DEPARTMENT_ID | SALES | PREVIOUS YEAR | NEXT YEAR |
+-------------+------------+---------------+-------+---------------+-----------+
|         100 |          1 |             1 |   200 |          NULL |       150 |
|         101 |          1 |             1 |   150 |           200 |       211 |
|         102 |          2 |             2 |   211 |           150 |      2345 |
|         103 |          2 |             3 |  2345 |           211 |       322 |
|         104 |          3 |             1 |   322 |          2345 |      4000 |
|         105 |          2 |             3 |  4000 |           322 |       322 |
|         106 |          3 |             1 |   322 |          4000 |       322 |
|         107 |          2 |             2 |   322 |           322 |       322 |
|         108 |          3 |             2 |   322 |           322 |      3211 |
|         109 |          3 |             3 |  3211 |           322 |      4000 |
|         110 |          2 |             3 |  4000 |          3211 |      NULL |
+-------------+------------+---------------+-------+---------------+-----------+
11 rows in set (0.00 sec)