DROP DATABASE IF EXISTS E_COMMERCE;
CREATE DATABASE E_COMMERCE;

use E_COMMERCE;

/*1: You are required to create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the
	  data for the E-commerce with the schema definition given below. */
CREATE TABLE supplier (
    SUPP_ID INT PRIMARY KEY,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50) NOT NULL,
    SUPP_PHONE VARCHAR(50) NOT NULL
);

CREATE TABLE customer (
    CUS_ID INT PRIMARY KEY,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR
);

CREATE TABLE category (
    CAT_ID INT PRIMARY KEY,
    CAT_NAME VARCHAR(20) NOT NULL
);

CREATE TABLE product (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC VARCHAR(60),
    CAT_ID INT,
    FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
);

CREATE TABLE supplier_pricing (
    PRICING_ID INT PRIMARY KEY,
    PRO_ID INT,
    SUPP_ID INT,
    SUPP_PRICE INT DEFAULT 0,
    FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID),
    FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);

CREATE TABLE order_table (
    ORD_ID INT PRIMARY KEY,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT,
    PRICING_ID INT,
    FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
    FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

alter table order_table 
rename `order`;

CREATE TABLE rating (
    RAT_ID INT PRIMARY KEY,
    ORD_ID INT,
    RAT_RATSTARS INT NOT NULL,
    FOREIGN KEY (ORD_ID) REFERENCES `order`(ORD_ID)
);

-- 2) Insert the following data in the table created above
-- Inserting data into the supplier table
INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE)
VALUES 
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

-- Inserting data into the customer table
INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER)
VALUES 
(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

-- Inserting data into the category table
INSERT INTO category (CAT_ID, CAT_NAME)
VALUES 
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONICS'),
(5, 'CLOTHES');

-- Inserting data into the product table
INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID)
VALUES 
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
(9, 'Project IGI', 'compatible with windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);


-- Inserting data into the supplier_pricing table
INSERT INTO supplier_pricing (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE)
VALUES 
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000);

-- Inserting data into the order table
INSERT INTO `order` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES
  (101, 1500, '2021-10-06', 2, 1),
  (102, 1000, '2021-10-12', 3, 5),
  (103, 30000, '2021-09-16', 5, 2),
  (104, 1500, '2021-10-05', 1, 1),
  (105, 3000, '2021-08-16', 4, 3),
  (106, 1450, '2021-08-18', 1, 1),
  (107, 789, '2021-09-01', 3, 5),
  (108, 780, '2021-09-07', 5, 1),
  (109, 3000, '2021-09-10', 5, 3),
  (110, 2500, '2021-09-10', 2, 4),
  (111, 1000, '2021-09-15', 4, 5),
  (112, 789, '2021-09-16', 4, 5),
  -- (113, 31000, '2021-09-16', 1, 8),
  (113, 1000, '2021-09-16', 3, 5),
  (114, 3000, '2021-09-16', 5, 3),
  (115, 99, '2021-09-17', 2, 1);
  
  INSERT INTO RATING (RAT_ID, ORD_ID, RAT_RATSTARS)
  VALUES
  (1, 101, 4),
  (2, 102, 3),
  (3, 103, 1),
  (4, 104, 2),
  (5, 105, 4),
  (6, 106, 3),
  (7, 107, 4),
  (8, 108, 4),
  (9, 109, 3),
  (10, 110, 5),
  (11, 111, 3),
  (12, 112, 4),
  -- (13, 113, 2),
  (13, 113, 1),
  (14, 114, 1),
  (15, 115, 0);
  
  
-- QUERY3: Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
  SELECT CUS_GENDER, count(DISTINCT CUS_ID) AS TOTAL_CUSTOMER
	FROM CUSTOMER
    WHERE CUS_ID IN (
		SELECT CUS_ID
        FROM `order`
        GROUP BY CUS_ID
        WHERE (ORD_AMOUNT) >= 3000
        )
GROUP BY CUS_GENDER;

-- QUERY4: Display all the orders along with product name ordered by a customer having Customer_Id=2
select `order`.*,product.pro_name from `order`, supplier_pricing, product
where `order`.cus_id = 2 
and `order`.PRICING_ID = supplier_pricing.pricing_id
and supplier_pricing.pro_id = product.pro_id;

-- QUERY5: Display the Supplier details who can supply more than one product. 
select supplier.* from supplier,supplier_pricing 
where supplier.supp_id 
in (select p.supp_id from supplier_pricing as p group by p.supp_id having count(p.supp_id)>1) 
group by supplier.supp_id ;

/* QUERY6: Find the least expensive product from each category and print the table with category id, name, 
           product name and price of the product */
select category.cat_id,category.cat_name, min(t3.min_price) as Min_Price from category inner join
(select product.cat_id, product.pro_name, t2.* from product inner join 
(select pro_id, min(supp_price) as Min_Price from supplier_pricing group by pro_id)
as t2 where t2.pro_id = product.pro_id)
as t3 where t3.cat_id = category.cat_id group by t3.cat_id;
 
-- QUERY7: Display the Id and Name of the Product ordered after “2021-10-05”.
select product.pro_id as Pro_Id, product.pro_name as Pro_Name from 
`order` , supplier_pricing , product 
where `order`.ord_date>"2021-10-05"
and 
supplier_pricing.pricing_id = `order`.pricing_id 
and 
product.pro_id = supplier_pricing.pro_id ;

-- QUERY8: Display customer name and gender whose names start or end with character 'A'.
select c.cus_name , c.cus_gender from customer as c
where c.cus_name like 'A%' 
or c.cus_name like '%A';



/* query9: Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
	       For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, 
           If rating >2 print “Average Service” else print “Poor Service”. */
/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `rating_procedure`()
BEGIN
select B.supp_id,B.supp_name,B.Average,
CASE
	WHEN B.Average =5 THEN 'Excellent Service'
	WHEN B.Average >4 THEN 'Good Service'
	WHEN B.Average >2 THEN 'Average Service'
	ELSE 'Poor Service'
END AS Type_of_Service from
(select A.supp_id, S.supp_name, A.Average from
	(select Q.supp_id, avg(Q.rat_ratstars) as Average from
		(select SP.supp_id, P.ord_id, P.rat_ratstars from 
			supplier_pricing  as SP 
            inner join
			    (select O.pricing_id, R.ord_id, R.rat_ratstars from 
			     `order` as O
			     inner join 
			     rating as R
   		        on R.ord_id = O.ord_id )   as P
		on P.pricing_id = SP.pricing_id) as Q
	group by SP.supp_id) as A
	inner join 
	supplier as S
where A.supp_id = S.supp_id) as B;
END$$
DELIMITER ;
*/
          -- OR

/*select report.supp_id,report.supp_name,report.Average,
CASE
        	WHEN report.Average =5 THEN 'Excellent Service'
	    	WHEN report.Average >4 THEN 'Good Service'
	    	WHEN report.Average >2 THEN 'Average Service'
	    	ELSE 'Poor Service'
END AS Type_of_Service from
(select final.supp_id, supplier.supp_name, final.Average from
(select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from
(select supplier_pricing.supp_id, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing inner join
(select `order`.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS from `order` inner join rating on rating.`ord_id` = `order`.ord_id ) as test
on test.pricing_id = supplier_pricing.pricing_id)
as test2 group by supplier_pricing.supp_id)
as final inner join supplier where final.supp_id = supplier.supp_id) as report;
*/

call sp_display_supplier_info();
