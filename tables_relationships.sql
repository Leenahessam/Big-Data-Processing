
CREATE TABLE countries(
   code int primary key not null,
   name varchar not null,
   continent_name varchar not null	
);
CREATE TABLE users(
   id INT primary key not null,
   full_name varchar not null,
   email varchar not null,
   gender varchar not null,
   date_of_birth varchar not null,
   country_code int references countries(code),
   created_at varchar not null
);
CREATE TABLE merchants(
   id int PRIMARY KEY not null,
   merchant_name varchar not null,
   admin_id int references users(id) not null,
   country_code int references countries(code),
   created_at varchar not null
);
CREATE TABLE products(
   id INT primary key not null,
   merchant_id INT references merchants(id),
   name varchar not null,
   price int not null,
   status varchar not null,
   created_at varchar not null	
);

CREATE TABLE orders(
   id INT primary key not null,
   user_id INT references users(id),
   status varchar not null,
   created_at varchar not null	
);
CREATE TABLE order_items(
   order_id INT references orders(id),
   product_id INT references products(id),
   quantity INT not null
);

/*insert dummy values in table*/

INSERT INTO countries VALUES(1,'Egypt','Africa');
INSERT INTO countries VALUES(2,'US','North America');
INSERT INTO countries VALUES(3,'India','Asia');
INSERT INTO users VALUES(1,'ahmed Mohamed Ahmed','ahmed@gmail.com','male','3/5/1996',1,'Egypt');
INSERT INTO users VALUES(2,'William Will','will33@gmail.com','male','31/7/1988',2,'US');
INSERT INTO users VALUES(3,'Sarah Tamer','sara77@gmail.com','female','1/1/2002',1,'Egypt');
INSERT INTO users VALUES(4,'Ang Akeno','Akenoo@gmail.com','male','17/8/1950',3,'India');
INSERT INTO merchants VALUES(1,'Samy',3,2,'US');
INSERT INTO merchants VALUES(2,'Fathy',1,1,'Egypt');
INSERT INTO merchants VALUES(3,'Samar',2,2,'US');
INSERT INTO merchants VALUES(4,'Ryan',4,3,'India');
INSERT INTO products VALUES(1,1,'table',10,'available','Egypt');
INSERT INTO products VALUES(2,3,'necklace',150,'available','US');
INSERT INTO products VALUES(3,2,'fruit',4,'available','Egypt');
INSERT INTO products VALUES(4,4,'pens',6,'available','US');
INSERT INTO orders VALUES(1,1,'ready','Egypt');
INSERT INTO orders VALUES(2,2,'On Its Way','US');
INSERT INTO orders VALUES(3,4,'not ready','US');
INSERT INTO orders VALUES(4,3,'ready','Egypt');
INSERT INTO order_items VALUES(1,1,7);
INSERT INTO order_items VALUES(2,2,10);
INSERT INTO order_items VALUES(3,4,5);
INSERT INTO order_items VALUES(4,1,12);
INSERT INTO order_items VALUES(4,3,7);

/*queries that show total order price for each user */

select users.full_name as user_name, orders.id as order_id, sum(order_items.quantity*products.price) as total_price
from users 
inner join orders on (users.id = orders.user_id)
inner join order_items on (order_items.order_id = orders.id) 
inner join products on (products.id=order_items.product_id)
group by users.full_name, orders.id
order by orders.id



