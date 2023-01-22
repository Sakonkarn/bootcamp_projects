CREATE TABLE order_detail (
	order_id INT PRIMARY KEY,
	customer_id INT,
  order_date DATE,
	branch_code INT,
  product_code INT,
	product_name TEXT,
	sizeofcup TEXT,
	sales REAL,
	payment_method TEXT,
	staff_id INT,
	FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
	FOREIGN KEY (branch_code) REFERENCES branch  (branch_code),
	FOREIGN KEY (product_code) REFERENCES product (product_code),
	FOREIGN KEY (payment_method) REFERENCES payment (payment_method),
	FOREIGN KEY (staff_id) REFERENCES staff (staff_id)
);

INSERT INTO order_detail VALUES 
	(1001, 1 ,	'2022-08-01' ,1 ,1 , 'americano','medium', 70, 'cash' , 101),
	(1002, 7 ,	'2022-08-01' ,1 ,7 , 'signature chocolate','medium', 75,'transfer', 101),
	(2001, 2 ,	'2022-08-01' ,2 ,3 , 'cappuccino','medium', 80 ,'cash', 201),
	(1003, 8 ,	'2022-08-02' ,1 ,2 , 'latte','medium',75,'debitcard',102),
	(1004, 1 ,	'2022-08-02' ,1 ,6 , 'cold milk','medium',	60,	'cash',102),
	(2002, 3 ,	'2022-08-02' ,2 ,8 , 'lychee earl grey tea','medium',	70,	'transfer',202),
	(2003, 2 ,	'2022-08-02' ,2 ,4 , 'espresso','medium',	75,	'transfer',202),
	(1005, 5 ,	'2022-08-03' ,1 ,5 , 'strawberry with Lemonade','medium',	80,	'debitcard'	,101),
	(1006, 4 ,	'2022-08-03' ,1 ,7 , 'signature chocolate','medium',	75,	'creditcard',101),
	(2004, 6 ,	'2022-08-03' ,2 ,1 , 'americano','large',	80 ,'cash'	,201),
	(2005, 1 , 	'2022-08-03' ,2 ,3 , 'cappuccino','large',90,'creditcard',201),
	(1007, 5 ,	'2022-08-04' ,1 ,2 , 'latte',	'medium', 75, 'cash',102),
	(1008, 7 ,	'2022-08-04' ,1 ,3 , 'cappuccino','large',90, 'cash',	102),
	(2006, 3 ,	'2022-08-04' ,2 ,4 , 'espresso','medium',	75, 'cash',202),
	(2007, 6 ,	'2022-08-04' ,2 ,8 , 'lychee earl grey tea','large',	80, 'transfer',202),
	(2008, 2 ,	'2022-08-04' ,2 ,2 , 'latte',	'medium',	75,	'transfer',	202);


CREATE TABLE branch  (
	branch_code INT PRIMARY KEY,
  branch_name TEXT
);

INSERT INTO branch VALUES
	(1,	'Bangkok'),
	(2,	'Chiangmai');

CREATE TABLE customer  (
	customer_ID INT PRIMARY KEY,
  customer_name TEXT,
	phone INT
);

INSERT INTO customer VALUES
		(1,	'John' , 1801111111),
 		(2,	'Marry', 1801111112),
		(3,	'Bella', 1801111113),
		(4,	'Winter', 1801111114),
		(5,	'Summer', 1801111115),
		(6,	'Dream', 1801111116),
		(7,	'Cream', 1801111117),
		(8,	'June', 1801111118);

CREATE TABLE product (
	product_code INT PRIMARY KEY,
  product_name TEXT,
	product_type TEXT
);

INSERT INTO product VALUES
	(1,	'americano','coffee'),
	(2,	'latte', 'coffee'),
	(3,	'cappuccino','coffee'),
	(4,	'espresso',	'coffee'),
	(5,	'strawberry with Lemonade','non-coffee'),
	(6,	'cold milk','non-coffee'),
	(7,	'signature chocolate','non-coffee'),
	(8,	'lychee earl grey tea','non-coffee');


CREATE TABLE staff (
	staff_id INT PRIMARY KEY,
  staff_name TEXT,
	branch_code INT,
	branch_name TEXT
);

INSERT INTO staff VALUES
	(101,	'A',	1,	'Bangkok'),
	(102,	'B',	1,	'Bangkok'),
	(201,	'C',	2,	'Chiangmai'),
	(202,	'D',	2,	'Chiangmai');


.mode markdown
.header on

-- Write SQL Query below
  
select 
  payment_method ,
  count(sales), 
	sum(sales) amount,
	round(avg(sales),2) AS Average
from order_detail 
group by payment_method;


select 
  branch_name, 
  product_type, 
  sum(sales) AS amount,
  count(*) AS Quantity
from order_detail 
JOIN product on order_detail.product_code = product. product_code
JOIN branch on order_detail.branch_code = branch.branch_code
group by branch_name ,product_type;


select 
  sizeofcup, 
  branch_name, 
  count(sizeofcup)
from order_detail, branch 
where order_detail.branch_code = branch.branch_code
group by sizeofcup ,branch_name
order by sizeofcup DESC;


select 
  branch_name, 
  sum(sales) as amount, 
  count(sales) as quantity
from order_detail 
JOIN branch on order_detail.branch_code = branch.branch_code
JOIN product on order_detail.product_code = product. product_code  
group by branch_name;


 with sub AS (
    select staff_name , branch_name, sales
    from order_detail
    JOIN staff on order_detail.staff_id = staff. staff_id
    GROUP by staff_name
)
 select staff_name, sales
 from sub
 where branch_name = 'Chiangmai';


select staff_name, sales
  from(
    select staff_name , branch_name, sales
    from order_detail
    JOIN staff on order_detail.staff_id = staff. staff_id
    GROUP by staff_name
  )
 where branch_name = 'Chiangmai';


select 
  customer_name , 
  sales 
from order_detail, customer 
WHERE order_detail.customer_id = customer.customer_id
GROUP by customer_name;


with sub AS (  
  select 
    customer_name , 
    sales 
  from order_detail, customer 
  WHERE order_detail.customer_id = customer.customer_id
  GROUP by customer_name
  )
select 
  customer_name,
  sales
From sub
Where customer_name like 'J%';


select 
  product_name ,
	count(*) AS Quantity
from order_detail
Group by product_name;
