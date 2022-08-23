CREATE DATABASE CustomerData

USE CustomerData

CREATE TABLE dbo.Customers
   (id int PRIMARY KEY NOT NULL,  
   forename varchar(50) NOT NULL,  
   surename varchar(50) NOT NULL,
   postcode varchar(10) NULL, 
   phone varchar(12) NOT NULL,
   registered bit NOT NULL);

INSERT dbo.Customers (id, forename, surename, postcode, phone, registered)  
    VALUES  (1, 'Peggie', 'Pallent', null, '521-107-9777', 1), 
            (2, 'Mathias', 'Foister', '56528', '545-991-1112', 0),
            (3, 'Tamarra', 'Le Merchant', '551 84', '808-768-9467', 1),
            (4, 'Janetta', 'Helin', null, '686-355-4931', 1),
            (5, 'Reinhold', 'Martijn', null, '795-679-7136', 0),
            (6, 'Lauritz', 'Provest', null, '296-351-8061', 0),
            (7, 'Con', 'Kupizt', null, '184-411-1830', 1),
            (8, 'Beatrisa', 'Tomowicz', null, '979-772-1232', 1),
            (9, 'Nathanial', 'Rupert', '3025-419', '636-290-1463', 0),
            (10, 'Etta', 'Edginton', '48100', '862-845-2560', 1);

SELECT * from Orders

CREATE TABLE dbo.DeliveryAddresses (
    id int NOT NULL,
    forename varchar(50) NOT NULL,  
    surename varchar(50) NOT NULL,
    add1 varchar(100) NOT NULL,
    add2 varchar(100) NULL,
    add3 varchar(100) NULL,
    postcode varchar(10) NULL,
    phone varchar(12) NOT NULL,
    email varchar(50) NOT NULL,
    PRIMARY KEY (id));

INSERT dbo.DeliveryAddresses (id, forename, surename, add1, add2, add3, postcode, phone, email)  
    VALUES  (1, 'Harry', 'Blamires', '5 NorthWestern Point', null, null, 'K67', '709-178-2038', 'hblamires@lulu.com'),
            (2, 'Adi', 'Carlon', '37136 Macpherson Street', null, null, null, '522-562-4973', 'acarlon@discuz.net'),
            (3, 'Barty', 'Monkley', '55 Hauk Trail', null, null, null, '879-792-1014', 'bmonkley@ihg.com'),
            (4, 'Salem', 'Ewert', '81078 Oakridge Circle', null, null, null, '223-256-8714', 'ksewert3@hostgator.com'),
            (5, 'Vihelmina', 'Bairnfather', '72949 Eastwood Street', null, null, '2402', '632-170-9234', 'vbairnsfather@psu.edu'),
            (6, 'Hayyim', 'Lisamore', '388 Birchwood Place', null, null, '71122', '901-562-9922', 'hlisamore5@prweb.com'),
            (7, 'Mareah', 'Gustans', '6 Tony Terrace', null, null, null, '142-802-2019', 'mgustans6@ucoz.com'),
            (8, 'Garret', 'Grayston', '64394 Clove Place', null, null, null, '580-799-7576', 'ggrayston7@prweb.com'),
            (9, 'Roxine', 'Booler', '69 Lakewood Gardens Place', null, null, '241551', '857-659-8653', 'rbooler8@springer.com'),
            (10, 'Filbert', 'Brougham', '8756 Village Green Place', null, null, '5049', '476-610-5525', 'fbroughman9@si.edu'),
            (11, 'Tri', 'Ana', '6 NorthWestern Point', null, null, 'K67', '111-145-2022', 'triana@lala.com'),
            (12, 'Intan', 'Purnama', '37123 Macpherson Street', null, null, null, '512-123-2345', 'acarlon@discuz.net'),
            (13, 'Tina', 'Agustina', '51 Hauk Trail', null, null, null, '234-123-2345', 'tinaagustina@mongo.com'),
            (14, 'Siska', 'Amelia', '23456 Oakridge Circle', null, null, null, '123-343-8714', 'siskaamelia@hostgator.com'),
            (15, 'Ana', 'Friska', '72922 Eastwood Street', null, null, '4502', '121-170-9234', 'anafriska@psu.edu'),
            (16, 'Tan', 'Siahaan', '12 Birchwood Place', null, null, '71342', '564-562-9234', 'tansiahaan@prweb.com'),
            (17, 'Mia', 'Gustia', '7 Tom Terrace', null, null, null, '147-888-2019', 'miagustia@lila.com'),
            (18, 'Gun', 'Gugun', '123 Clove Place', null, null, null, '555-678-7567', 'gungugun@anm.com'),
            (19, 'Rumas', 'Biars', '77 Green Gardens Place', null, null, '241534', '127-129-8653', 'rumasbiars@springergarden.com'),
            (20, 'Tian', 'Brham', '8734 Malibu Place', null, null, '1234', '434-622-2345', 'tianbrahm@twil.com');


CREATE TABLE dbo.Orders (
    id int NOT NULL,
    customer_id int NOT NULL,
    registered bit NOT NULL,
    delivery_add_id int NOT NULL,
    payment_type varchar(20) NOT NULL,
    date date NOT NULL,
    status varchar(10) NOT NULL,
    total int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
    FOREIGN KEY (delivery_add_id) REFERENCES DeliveryAddresses(id));

INSERT dbo.Orders (id, customer_id, registered, delivery_add_id, payment_type, date, status, total)  
    VALUES  (1, 6, 0, 1, 'diners-club-us-ca', '2019-05-31', 'Paid', 182389),
            (2, 6, 1, 1, 'jcb', '2019-12-24', 'Canceled', 385376),
            (3, 2, 0, 4, 'mastercard', '2019-04-07', 'Canceled', 404804),
            (4, 10, 1, 13, 'jcb', '2019-07-16', 'Canceled', 428182),
            (5, 5, 1, 10, 'visa-electron', '2020-01-13', 'Canceled', 370261),
            (6, 6, 1, 3, 'americanexpress', '2019-10-22', 'Canceled', 440665),
            (7, 3, 0, 14, 'jcb', '2020-01-30', 'Canceled', 427954),
            (8, 6, 0, 11, 'mastercard', '2019-08-30', 'Canceled', 250107),
            (9, 2, 0, 4, 'jcb', '2019-06-03', 'Paid', 144049),
            (10, 5, 0, 6, 'jcb', '2019-08-31', 'Pending', 144408);
		

SELECT * from Orders

CREATE TABLE dbo.Categories (
    id int NOT NULL,
    name varchar(30) NOT NULL,
    description varchar (max) NOT NULL,
    image varchar(max) NOT NULL,
    PRIMARY KEY (id));


INSERT dbo.Categories (id, name, description, image)  
    VALUES   (1, 'vegetables', 'Lorem ipsum integer tincidunt quisque tristique sollicitudin eros sapien', 'http://dummyimage.com/109x123.jpg/ff4444/ffffff'),
	     (2, 'vegetables', 'Quisque eu nibh mi. Aliquam erat volutpat. Integer semper interdum est, nec facilisis mi suscipit at', 'http://dummyimage.com/133x136.png/cc0000/ffffff'),
	     (3, 'fruits', 'Donec ullamcorper, erat at eleifend mollis, ipsum enim suscipit purus, sit amet varius sapien quam ac nisl', 'http://dummyimage.com/230x152.bmp/5fa2dd/ffffff'),
	     (4, 'fruits', 'Etiam non mauris nec lorem bibendum rutrum', 'http://dummyimage.com/168x104.jpg/ff4444/ffffff'),
	     (5, 'vegetables', 'Etiam consequat placerat elit sed tempus', 'http://dummyimage.com/242x201.jpg/dddddd/000000'),
	     (6, 'vegetables', 'Mauris quis urna vel nibh faucibus suscipit', 'http://dummyimage.com/223x206.bmp/5fa2dd/ffffff'),
	     (7, 'vegetables', 'Quisque ut purus diam, a iaculis turpis', 'http://dummyimage.com/118x121.bmp/5fa2dd/ffffff'),
	     (8, 'fruits', 'Quisque eu nibh mi. Aliquam erat volutpat', 'http://dummyimage.com/233x124.jpg/dddddd/000000'),
	     (9, 'fruits', 'Integer semper interdum est, nec facilisis', 'http://dummyimage.com/243x112.jpg/5fa2dd/ffffff'),
	     (10, 'fruits', 'Integer pellentesque tincidunt eros ut consequat', 'http://dummyimage.com/118x121.jpg/5fa2dd/ffffff');


CREATE TABLE dbo.Products (
    id int NOT NULL,
    cat_id int NOT NULL,
    name varchar(50) NOT NULL,
    description varchar (max) NOT NULL,
    image varchar(max) NOT NULL,
    price money NOT NULL
    PRIMARY KEY (id),
    FOREIGN KEY (cat_id) REFERENCES Categories(id));

INSERT dbo.Products (id, cat_id, name, description, image, price)  
    VALUES  (1, 1, 'Truffle Paste', 'Makanan dari pasta truffle', 'http://dummyimage.com/109x123.jpg/ff4444/ffffff', 8791),
            (2, 6, 'Carrots - Mini Reg Organic', 'Wortel Organik dengan size kecil', 'http://dummyimage.com/133x136.png/cc0000/ffffff', 9675),
            (3, 4, 'Sprouts Dikon', 'Also called "Japanese radish",', 'http://dummyimage.com/230x152.bmp/5fa2dd/ffffff', 9147),
            (4, 4, 'Mushrooms - Black, Dried', ' reserved for inedible or poisonous sporophores', 'http://dummyimage.com/168x104.jpg/ff4444/ffffff', 2019),
            (5, 6, 'Coffee - Flavoured', 'Kopi dengan beragam rasa', 'http://dummyimage.com/242x201.jpg/dddddd/000000', 5270),
            (6, 10, 'Juice - Orange', 'Jus Jeruk Asli', 'http://dummyimage.com/223x206.bmp/5fa2dd/ffffff', 9780),
            (7, 1, 'Energy Drink - Franks Original', 'Minuman dengan Original Franks', 'http://dummyimage.com/118x121.bmp/5fa2dd/ffffff', 9676),
            (8, 9, 'Energy - Boo - Koo', 'Minuman Energi', 'http://dummyimage.com/233x124.jpg/dddddd/000000', 2916),
            (9, 4, 'Tart - Lemon', 'Kue dari lemon', 'http://dummyimage.com/243x112.jpg/5fa2dd/ffffff', 2099),
            (10, 5, 'Beef Tenderloin Aaa', 'Beef Tenderloin high quality', 'http://dummyimage.com/118x121.jpg/5fa2dd/ffffff', 6888);

CREATE TABLE dbo.OrderItem (
    id int NOT NULL,
    order_id int NOT NULL,
    product_id int NOT NULL,
    qty int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Products(id));


INSERT dbo.OrderItem(id, order_id, product_id, qty)  
    VALUES (1, 4, 8, 4),
           (2, 8, 10, 11),
           (3, 8, 4, 11),
           (4, 1, 2, 3),
           (5, 7, 9, 15),
           (6, 1, 4, 13),
           (7, 10, 7, 6),
           (8, 9, 10, 12),
           (9, 7, 6, 11),
           (10, 6, 2, 16);


--1. Create query to show orders by customer

SELECT CONCAT(cust.forename,' ', cust.surename) as customer_name, 
ord.id AS order_id, prod.name AS ordered_product, ord.status, ord.total AS total_paid
from Customers as cust
INNER JOIN Orders AS ord ON ord.customer_id = cust.id
INNER JOIN OrderItem AS ordi ON ordi.order_id = ord.id
INNER JOIN Products AS prod ON prod.id = ordi.product_id


--2. Create query to show sum of orders by order status (“paid”, “cancelled”,"pending")

SELECT status AS order_status, SUM (total) as total_ordered 
from Orders
GROUP BY status

--3. Create query to show products by categories

SELECT prod.id AS product_id, prod.name AS product_name, cat.name AS Category
FROM Products AS prod
INNER JOIN Categories as cat ON cat.id = prod.cat_id
ORDER BY cat.name

--4. Create query to show address of customers orders

SELECT ord.id AS order_id, CONCAT(dadd.forename, ' ', dadd.surename) AS customer_name, dadd.add1 AS customer_address
FROM DeliveryAddresses AS dadd
INNER JOIN Orders AS ord ON ord.delivery_add_id = dadd.id

-- 5.Create query to show all product on orders

SELECT ord.id AS order_id, prod.name AS product,prod.price, cat.name AS category
FROM Orders AS ord
INNER JOIN OrderItem AS ordi ON ordi.order_id = ord.id
INNER JOIN Products AS prod ON prod.id = ordi.product_id
INNER JOIN Categories AS cat ON cat.id = prod.cat_id
ORDER BY cat.name