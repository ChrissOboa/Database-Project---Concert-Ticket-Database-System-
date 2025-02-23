/* Elijah, Nathan and Chriss

Project

*/


# SQL/DDL exercise


use nar2db;


DROP TABLE IF EXISTS Order_Ticket;
DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS Concert;
DROP TABLE IF EXISTS Customer_Order;
DROP TABLE IF EXISTS Song;
DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS Venue;
DROP TABLE IF EXISTS Ticket_Category;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Genre;


CREATE TABLE Genre (

g_id 	int unique,
g_name 	CHAR(30) not null,
PRIMARY KEY (g_id)
);


CREATE TABLE Customer (

cust_id 	int unique,
email 		VARCHAR(200),
username 	VARCHAR(200) NOT NULL UNIQUE,
password 	VARCHAR(200) NOT NULL,
PRIMARY KEY (cust_id)

);


CREATE TABLE Ticket_Category (

tc_id 			int unique,
tc_Desc 		VARCHAR(500),
tc_Price_Range	VARCHAR,
PRIMARY KEY (tc_id),

);

CREATE TABLE Venue (

v_id 		int unique,
v_name 		VARCHAR(200),
v_Address 	VARCHAR(200),
v_city 		VARCHAR(95),  
v_capacity 	int,
PRIMARY KEY (v_id)

);


CREATE TABLE Artist (

a_id 	int unique,
a_name 	VARCHAR(30),
g_id 	int unique,
PRIMARY KEY (a_id, g_id),
FOREIGN KEY (g_id) REFERENCES Genre (g_id)

);


CREATE TABLE Song (

s_id 		int unique,
s_name 		VARCHAR(30),
s_length 	TIME,
g_id 		int unique,
PRIMARY KEY (s_id, g_id),
FOREIGN KEY (g_id) REFERENCES Genre (g_id)

);

CREATE TABLE Customer_Order (

co_id 			int unique,  
order_time 		DATETIME,
co_date 		DATE,
total_price 	FLOAT,
address 		VARCHAR(200),   
delivery_email 	VARCHAR(200),
cust_id 		int unique,
PRIMARY KEY (co_id, cust_id),
FOREIGN KEY (cust_id) REFERENCES Customer (cust_id),

);

  

CREATE TABLE Concert (

c_id 	int unique,   
c_date 	DATE,
c_name 	CHAR(30),
a_id 	int unique,
v_id 	int unique,
PRIMARY KEY (c_id, a_id, v_id),
FOREIGN KEY (a_id) REFERENCES Artist (a_id),
FOREIGN KEY (v_id) REFERENCES Venue (v_id)

);

CREATE TABLE Ticket (

t_id 			int unique,
t_seat 			int unique,
t_Purchase_Date DATETIME,
c_id 			int unique,     
tc_id 			int unique,
PRIMARY KEY (t_id, c_id, tc_id),
FOREIGN KEY (c_id) REFERENCES Concert (c_id),
FOREIGN KEY (tc_id) REFERENCES Ticket_Category (tc_id)

);

  


CREATE TABLE Order_Ticket (

o_id 	int unique,
cust_id int unique,
t_id 	int unique,
PRIMARY KEY (o_id, cust_id, t_id),
FOREIGN KEY (cust_id) REFERENCES Customer (cust_id),
FOREIGN KEY (t_id) REFERENCES Ticket (t_id) 

);