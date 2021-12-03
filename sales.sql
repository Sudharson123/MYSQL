/* --------------------------------- TABLE 1(SALESPEOPLE) ------------------------------------------------*/
CREATE TABLE SALESPEOPLE(Snum INT NOT NULL,Sname VARCHAR(20) DEFAULT NULL,City VARCHAR(15) DEFAULT NULL,
Commission DECIMAL(10,2),
PRIMARY KEY(Snum),UNIQUE(Sname));
INSERT INTO SALESPEOPLE VALUES(1001,'Peel','London',0.12);
INSERT INTO SALESPEOPLE VALUES(1002,'Serres','Sanjose',0.13),
(1004,'Motika','London',0.11),(1007,'Rifkin','Barcelona',0.15)
,(1003,'Axelrod','Newyork',0.10);

/* --------------------------------- TABLE 2(CUSTOMERS) ------------------------------------------------*/


CREATE TABLE CUSTOMERS(Cnum INT,Cname VARCHAR(20) NOT NULL,City VARCHAR(20) NOT NULL,
Snum INT,PRIMARY KEY(Cnum));
INSERT INTO CUSTOMERS VALUES(2001,'Hoffman','London',1001),(2002,'Giovanni','Rome',1003),(2003,'Liu','Sanjose',1002)
,(2004,'Grass','Berlin',1002),(2006,'Clemens','London',1001),(2008,'Cisneros','Sanjose',1007),(2007,'Pereira','Rome',1004);

/* --------------------------------- TABLE 3(ORDERS) ------------------------------------------------*/


CREATE TABLE ORDERS(Onum INT NOT NULL,Amt DECIMAL (10,2),Odate DATE,Cnum INT,Snum INT,PRIMARY KEY(Onum));
INSERT INTO ORDERS VALUES(3001,18.69,'1990-10-03',2008,1007)
,(3003,767.19,'1990-10-03',2001,1001),(3002,1900.10,'1990-10-03',2007,1004),
(3005,5160.45,'1990-10-03',2003,1002),(3006,1098.16,'1990-10-03',2008,1007),
(3009,1713.23,'1990-10-04',2002,1003),(3007,75.75,'1990-10-04',2004,1002),
(3008,4273.00,'1990-10-05',2006,1001),(3010,1309.95,'1990-10-06',2004,1002),(3011,9891.88,'1990-10-06',2006,1001);

/* ----------------------ADDING FOREIGN KEY----------------*/
ALTER TABLE CUSTOMERS ADD FOREIGN KEY(Snum) REFERENCES SALESPEOPLE(Snum) ON DELETE SET NULL;
ALTER TABLE ORDERS ADD FOREIGN KEY(Snum) REFERENCES SALESPEOPLE(Snum) ON DELETE SET NULL;
ALTER TABLE ORDERS ADD FOREIGN KEY(Cnum) REFERENCES customers(Cnum) ON DELETE SET NULL;
/*
----------------------------------------Question 01----------------------------------------
Count the number of Salesperson whose name begin with ‘a’/’A’.
*/
SELECT COUNT(Sname) FROM salespeople WHERE Sname LIKE '%A' or Sname LIKE '%a';
/*
----------------------------------------Question 02----------------------------------------
Display all the Salesperson whose all orders worth is more than Rs. 2000.
*/
SELECT SALESPEOPLE.Sname,SALESPEOPLE.snum,ORDERS.AMT FROM salespeople 
INNER JOIN ORDERS ON salespeople.SNUM=ORDERS.SNUM WHERE amt>2000;
/*
----------------------------------------Question 03----------------------------------------
Count the number of Salesperson belonging to Newyork
*/
SELECT COUNT(Sname) AS 'BELONGS TO NEWORK' FROM SALESPEOPLE WHERE City='Newyork';
/*
----------------------------------------Question 04----------------------------------------
Display the number of Salespeople belonging to London and belonging to Paris.
*/
SELECT * FROM SALESPEOPLE WHERE City IN ('London','Paris');
/*
----------------------------------------Question 05----------------------------------------
Display the number of orders taken by each Salesperson and their date of orders.
*/
SELECT ODATE,ORDERS.SNUM,COUNT(*) AS ORDERS,salespeople.SNAME
FROM orders INNER JOIN salespeople ON salespeople.SNUM=ORDERS.SNUM
group bY SNAME ORDER BY ODATE;