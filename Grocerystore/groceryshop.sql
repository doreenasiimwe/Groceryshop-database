--CREATING RELATIONS
--GROCERYSHOP RELATION
CREATE TABLE grocery_shops(
id VARCHAR(12) NOT NULL PRIMARY KEY,
name VARCHAR(20) NOT NULL UNIQUE,
location VARCHAR(13) NOT NULL,
street_no INT);

--CATEGORIES RELATION
CREATE TABLE categories(
cat_id VARCHAR(12) NOT NULL PRIMARY KEY,
name VARCHAR(20),
description VARCHAR(20)	
);

--PRODUCTS RELATION
CREATE TABLE products(
p_id VARCHAR(12) NOT NULL PRIMARY KEY,
name VARCHAR(20) UNIQUE,
image VARCHAR(200) UNIQUE,
cat_id VARCHAR(12),
FOREIGN KEY(cat_id) REFERENCES categories(cat_id));


--PRODUCT WISHLIST RELATION
CREATE TABLE product_wishlists(
id VARCHAR(12) NOT NULL PRIMARY KEY,
p_id VARCHAR(12),
is_liked BOOLEAN,
is_added BOOLEAN,
FOREIGN KEY(p_id) REFERENCES products(p_id)	
);


--ORDERS RELATION
CREATE TABLE orders(
o_id VARCHAR(12) NOT NULL PRIMARY KEY,
p_id VARCHAR(12),
_date VARCHAR(12),
_time VARCHAR(12),
status VARCHAR(20),
FOREIGN KEY(p_id) REFERENCES products(p_id));

--CUSTOMERS RELATION
CREATE TABLE customers(
c_id VARCHAR(12) NOT NULL PRIMARY KEY,
fname VARCHAR(20) NOT NULL,
lname VARCHAR(20) NOT NULL,
email_address VARCHAR(35) NOT NULL UNIQUE,
contact VARCHAR(12) NOT NULL UNIQUE,
_location VARCHAR(20),
p_id VARCHAR(12),
o_id VARCHAR(12),
FOREIGN KEY(p_id) REFERENCES products(p_id),
FOREIGN KEY(o_id) REFERENCES orders(o_id));

--ADMIN RELATION
CREATE TABLE admins(
a_id VARCHAR(12) NOT NULL PRIMARY KEY,
names VARCHAR(30) NOT NULL,
c_id VARCHAR(12),
p_id VARCHAR(12),
o_id VARCHAR(12),
FOREIGN KEY(c_id) REFERENCES customers(c_id),
FOREIGN KEY(p_id) REFERENCES products(p_id),
FOREIGN KEY(o_id) REFERENCES orders(o_id));


--VENDORS RELATION
CREATE TABLE vendors(
v_id VARCHAR(12) NOT NULL PRIMARY KEY,
_name VARCHAR(20) NOT NULL,
_location VARCHAR(20) NOT NULL,
p_id VARCHAR(12),
c_id VARCHAR(12),
o_id VARCHAR(12),
FOREIGN KEY(p_id) REFERENCES products(p_id),
FOREIGN KEY(c_id) REFERENCES customers(c_id),
FOREIGN KEY(o_id) REFERENCES orders(o_id));

--DELIVERY MEN RELATION
CREATE TABLE delivery_men(
d_id VARCHAR(12) NOT NULL PRIMARY KEY,
names VARCHAR(30),
email_address VARCHAR(35) NOT NULL UNIQUE,
o_id VARCHAR(12),
p_id VARCHAR(12),
c_id VARCHAR(12),
FOREIGN KEY(o_id) REFERENCES orders(o_id),
FOREIGN KEY(p_id) REFERENCES products(p_id),
FOREIGN KEY(c_id) REFERENCES customers(c_id));

--USERS RELATION
CREATE TABLE users(
u_id VARCHAR(12) NOT NULL PRIMARY KEY,
user_type VARCHAR(30));

--CAKES RELATION
CREATE TABLE cakes(
ck_id VARCHAR(12) NOT NULL PRIMARY KEY,
type VARCHAR(12) NOT NULL,
c_id VARCHAR(12),
image VARCHAR(300),
price REAL,
description VARCHAR(40),
recipes VARCHAR(30),
v_id VARCHAR(12),
FOREIGN KEY(v_id) REFERENCES vendors(v_id));

--PAYMENTS RELATION
CREATE TABLE payments(
pa_id VARCHAR(12) NOT NULL PRIMARY KEY,
p_id VARCHAR(12),
c_id VARCHAR(12),
o_id VARCHAR(12),
modeof_payment VARCHAR(30),
FOREIGN KEY(p_id) REFERENCES products(p_id),
FOREIGN KEY(c_id) REFERENCES customers(c_id),
FOREIGN KEY(o_id) REFERENCES orders(o_id));

--INSERTING INTO RELATIONS
INSERT INTO grocery_shops VALUES('G101','DOCE groceries','Bugolobi',7);

SELECT * FROM grocery_shops;

--CATEGORIES
INSERT INTO categories VALUES('C101','Snacks','Bakery');
INSERT INTO categories VALUES('C102','Meat','Red meats');
INSERT INTO categories VALUES('C103','fruits','Perishable');

SELECT * FROM categories;

--PRODUCTS
INSERT INTO products VALUES('P001','Bananas','http//banana/','C103');
INSERT INTO products VALUES('P002','Mutton','http//mutton/','C102');
INSERT INTO products VALUES('P003','Apples','http//apples/','C103');
INSERT INTO products VALUES('P004','Daddies','http//daddies/','C101');
INSERT INTO products VALUES('P005','ice cream','http//ice cream/','C101');
INSERT INTO products VALUES('P006','Beef','http//beef/','C102');

SELECT * FROM products;
SELECT * FROM products WHERE name  = 'ice cream';

--PRODUCT WISHLIST
INSERT INTO product_wishlists VALUES('PR1001','P001','0','1');
INSERT INTO product_wishlists VALUES('PR1002','P006','1','1');
INSERT INTO product_wishlists VALUES('PR1003','P002','0','0');
INSERT INTO product_wishlists VALUES('PR1004','P003','1','0');
INSERT INTO product_wishlists VALUES('PR1005','P002','1','1');
INSERT INTO product_wishlists VALUES('PR1006','P001','1','0');

SELECT * FROM product_wishlists;

--ORDERS
INSERT INTO orders VALUES('O1001','P006','24-11-2022','08:40am', 'Confirmed');
INSERT INTO orders VALUES('O1002','P004','20-10-2022','09:40am', 'Pending');
INSERT INTO orders VALUES('O1003','P006','14-12-2022','10:40pm', 'Confirmed');
INSERT INTO orders VALUES('O1004','P002','26-09-2022','11:40am', 'Pending');
INSERT INTO orders VALUES('O1005','P003','04-08-2022','12:40pm', 'Confirmed');
INSERT INTO orders VALUES('O1006','P001','30-06-2022','01:40pm', 'Confirmed');
INSERT INTO orders VALUES('O1007','P005','24-11-2022','02:40pm', 'Pending');

SELECT * FROM orders;

--CUSTOMERS
INSERT INTO customers VALUES('C1001','Mukama','Kenneth','kennethmukama@gmail.com','0706661663','Muyenga','P004','O1002');
INSERT INTO customers VALUES('C1002','Asiimwe','Doreen','doreenasiimwe@gmail.com','0706661664','Bukoto','P005','O1007');
INSERT INTO customers VALUES('C1003','Nankya','Martha','marthanankya@gmail.com','0706661665','Kamwokya','P006','O1001');
INSERT INTO customers VALUES('C1004','Atim','Sarah','sarahatim@gmail.com','0706661666','Busiro','P006','O1003');
INSERT INTO customers VALUES('C1005','Adde','Joyce','joyceadde@gmail.com','0706661667','Muyenga','P002','O1004');
INSERT INTO customers VALUES('C1006','Martha','Gloria','marthagloria@gmail.com','0706661668','Munyonyo','P003','O1005');
INSERT INTO customers VALUES('C1007','Magara','Collins','collinsmagara@gmail.com','0706661669','Ntinda','P001','O1006');

SELECT * FROM customers;

--ADMINS
INSERT INTO admins VALUES('A001','Bali Annet','C1001','P004','O1002');
INSERT INTO admins VALUES('A002','Nganda Gladys','C1005','P002','O1004');
INSERT INTO admins VALUES('A003','Mugabe Timothy','C1002','P005','O1007');
INSERT INTO admins VALUES('A004','Amongin Sharon','C1007','P001','O1006');

SELECT * FROM admins;
SELECT a_id,names, p_id FROM admins;

--VENDORS RELATION
INSERT INTO vendors VALUES('V001','Bashir','Bukoto','P005','C1002','O1007');
INSERT INTO vendors VALUES('V002','Brenda','Kamwokya','P006','C1003','O1001');
INSERT INTO vendors VALUES('V003','Gloria','Ntinda','P001','C1007','O1006');
INSERT INTO vendors VALUES('V004','Bridget','Muyenga','P004','C1001','O1002');
INSERT INTO vendors VALUES('V006','Shmoopie','Munyonyo','P003','C1006','O1005');

SELECT * FROM vendors;
SELECT v_id,_name,p_id FROM vendors;

--DELIVERY MEN
INSERT iNTO delivery_men VALUES('D1001','Kabuzi Moses','moseskabuzi@gmail.com','O1007','P005','C1002');
INSERT iNTO delivery_men VALUES('D1002','Muhame Alon','alonmuhame@gmail.com','O1001','P006','C1003');
INSERT iNTO delivery_men VALUES('D1003','Wakabala Kenneth','wakabalakenneth@gmail.com','O1006','P001','C1007');
INSERT iNTO delivery_men VALUES('D1004','James Sewava','jamessewava@gmail.com','O1002','P004','C1001');
INSERT iNTO delivery_men VALUES('D1005','Kiwalala Samuel','samuelkiwalala@gmail.com','O1005','P003','C1006');

SELECT * FROM delivery_men;

--USERS
INSERT INTO users VALUES('V2001','Admin');
INSERT INTO users VALUES('V2002','Vendor');
INSERT INTO users VALUES('V2003','buyer');
INSERT INTO users VALUES('V2004','Admin');
INSERT INTO users VALUES('V2005','Vendor');
INSERT INTO users VALUES('V2006','buyer');

SELECT * FROM users;
SELECT * FROM users WHERE user_type = 'Vendor';
SELECT * FROM users WHERE user_type = 'Admin';
SELECT * FROM users WHERE user_type = 'buyer';
--CAKES
INSERT INTO cakes VALUES('CK1001','Birthday','C1001','\http\mhhfhftyfyutgyuu\\cake',34.5,'Black forest','Chocolate','V004');
INSERT INTO cakes VALUES('CK1002','Wedding','C1005','\http\mhhfhftyfyutgyuu\\cakes',38.5,'Vanilla','Vanilla and Milk','V001');
INSERT INTO cakes VALUES('CK1001','Baptism','C1004','\http\mhhfhftyfyutgyuu\\cakepap',44.5,'Berry','Straw_berries','V003');

SELECT * FROM cakes;

--PAYMENTS
INSERT INTO payments VALUES('PA001','P004','C1001','O1002','Cash on delivery');
INSERT INTO payments VALUES('PA002','P006','C1003','O1001','VISA');
INSERT INTO payments VALUES('PA003','P003','C1006','O1005','MOMOPAY');
INSERT INTO payments VALUES('PA004','P001','C1001','O1006','Master Card');
INSERT INTO payments VALUES('PA005','P005','C1007','O1002','Cash on delivery');

SELECT * FROM payments;



















