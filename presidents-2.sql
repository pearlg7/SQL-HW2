create table customer (
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(200),
	address VARCHAR(150),
	city VARCHAR(150),
	customer_state VARCHAR(100),
	zipcode VARCHAR(50)
);

--Orders table for the presidents
create table order_ (
	order_id SERIAL primary key,
	order_date DATE default current_date,
	amount numeric(5,2),
	customer_id INTEGER,
	foreign key(customer_id) references customer(customer_id)
);

INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
VALUES(1,'George','Washington','gwash@usa.gov', '3200 Mt Vernon Hwy', 'Mt Vernon', 'VA', '22121');

INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
VALUES(2,'John','Adams','jadams@usa.gov', '1200 Hancock', 'Quincy', 'MA', '02169');

INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
VALUES(3,'Thomas','Jefferson', 'tjeff@usa.gov', '931 Thomas Jefferson Pkwy', 'Charlottesville', 'VA', '02169');

INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
VALUES(4,'James','Madison', 'jmad@usa.gov', '11350 Conway', 'Orange', 'VA', '02169');

INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
VALUES(5,'James','Monroe', 'jmonroe@usa.gov', '2050 James Monroe Parkway', 'Charlottesville', 'VA', '02169');

--INSERT INFO INTO ORDER TABLE
INSERT INTO order_(order_id,amount,customer_id)
VALUES(1,234.56,1);

INSERT INTO order_(order_id,amount,customer_id)
VALUES(2,78.50,3);

INSERT INTO order_(order_id,amount,customer_id)
VALUES(3,124.00,2);

INSERT INTO order_(order_id,amount,customer_id)
VALUES(4,65.50,3);

INSERT INTO order_(order_id,amount,customer_id)
VALUES(5,55.50,NULL);

select *
from ORDER_;

--customer == table a
--order_  == table b

-- inner join 
select first_name, last_name, order_date, amount
from customer
inner join order_
on customer.customer_id = order_.customer_id

-- Left join 
select first_name, last_name, order_date, amount
from customer 
left join order_ 
on customer.customer_id = order_.Customer_id
where order_date is not null

-- Right join 
select first_name, last_name, order_date, amount
from customer 
right join order_ 
on customer.customer_id = order_.customer_id

-- Full join 
select first_name, last_name, order_date, amount
from customer 
full join order_ 
on customer.customer_id = order_.customer_id

-- Returns everything but mutual inner section
select first_name, last_name, order_date, amount
from customer
full join order_ 
on customer.customer_id = order_.customer_id
where customer.customer_id is null 
or order_.customer_id is null
























