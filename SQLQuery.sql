-- 1. List all the products
SELECT * FROM product

-- 2. List product name and product price
select productname,price from product

-- 3. List all customers
select * from customer

-- 4. List Customername and mobile no
select customername,mobileno from customer

-- 5. List all orders
select * from orderd

-- 6. List customer id and orderd date
select customerid,orderdate from orderd

-- 7. List all the order item
select * from orderitem

-- 8. List all the product with product id 100
select * from product where productid = 100

-- 9. List all the info of product with name Vivo V3
select * from dbo.product where productname like '%vivo%'

-- 10. List pid, productname, price of the phone named "Samsung GalaxyNote-4"
select productid,productname,price from dbo.product where productname='Samsung GalaxyNote-4' 

-- 11. Print product info for all the product with category id 2003
select * from dbo.product where categoryid = 2003

-- 12. List all the customers address with city as 'Bangalore'
select * from dbo.customeraddress where city  = 'bangalore'

-- 13. List all the orders which was ordered on '2013-02-02'
select * from dbo.orderd where orderdate = '2013-02-02'

-- 14. Print all the orders of the customer with id 1
select c.customername,o.* 
from dbo.customer as c 
inner join dbo.orderd as o 
on o.customeraddressid = c.customerid 
where c.customerid = 1

-- 15. List all the product with company id 1001 or 1002
select * from dbo.product where companyid IN (1001,1002)

-- 16. List all the product with price more than 30000
select * from dbo.product where price > 30000

-- 17. List all the products of the category id 2001 or 2003 with 
-- the price more than 30000
select * 
from dbo.product 
where categoryid IN (2001,2003) AND price > 30000

-- 18. List all the order customer id 1 or 4 ordered on '2013-02-02' 
-- or '2013-02-07'
select * from dbo.orderd
where customerid in (1,4) 
and orderdate in ('2013-02-02','2013-02-07')

-- 19. List all the customer whos name starts with character 'A'
select * from dbo.customer
where customername like 'A%'

-- 20. List all the customer who name ends with character 'i'
select * from dbo.customer
where customername like '%i'

-- 21. List all the customer whos name starts with 'R' and ends with 'i'
select * from dbo.customer
where customername like 'R%i'

-- 22. List all the orders for the year 2013
select * from dbo.orderd
where orderdate like'%2013%'

-- 23. List all the products which are not from the category 10001
select * 
from product
where categoryid not in(10001)

-- 24. List all the products which are not from the category 10001
-- or 10003 with the price more than 30000 and product name starts 
-- with '6'
select * 
from product
where categoryid not in(10001,10003) and price > 30000 and productname like '6%'

-- 25. List all the customers whos mobile no doesnt start with 9
select * 
from dbo.customer
where mobileno not like '9%'

-- 26. List all the nokia phones
select * 
from dbo.product
where productname like '%nokia%'

-- 27. List all the samsung phones
select * 
from dbo.product
where productname like '%samsung%'

-- 28. List all the iphone phones
select * 
from dbo.product
where productname like '%iphone%'

-- 29. List all the customers from Bangalore
select * 
from dbo.customer as c
inner join dbo.customeraddress as ca
on c.customerid = ca.customerid
where ca.city  = 'bangalore'

-- 30. List all the customers who are not from Bangalore
select * 
from dbo.customer as c
inner join dbo.customeraddress as ca
on c.customerid = ca.customerid
where ca.city  != 'bangalore'

-- 31. List all the customer who have orderd on the date '2013-02-02'
select * 
from dbo.customer as c
inner join dbo.orderd as o
on c.customerid = o.customerid
where orderdate = '2013-02-02'

-- 32. List all the customer who have orderd for phone '6S'
select * 
from dbo.customer as c
inner join dbo.product as p
on c.customerid = p.productid
where p.productname like '%6s'

-- 33. List all the customers who have ordered for Apple I-Pad Mini from bangalore
select * 
from dbo.customer as c
inner join dbo.product as p
on c.customerid = p.productid
inner join dbo.customeraddress as ca
on ca.customeraddressid = c.customerid
where p.productname like '%apple i-pad mini%'

-- 34. List all the phones which Goutham orderd for
select * 
from dbo.customer as c
left join dbo.product as p
on c.customerid = p.productid
where c.customername like '%goutham%'

-- 35. List all the phones which Amrutha orderd for in the 2014
SELECT productname,customername,orderdate 
FROM dbo.orderd
INNER JOIN customer ON orderd.customerid = customer.customerid 
INNER JOIN orderitem ON orderd.orderid = orderitem.orderid 
INNER JOIN product ON orderitem.productid = product.productid
where customername like '%amrutha%' and orderdate like '%2014%'

-- 36. List all the customer who have not bought any product
SELECT customername
FROM orderitem INNER JOIN
product ON orderitem.productid = product.productid INNER JOIN
orderd ON orderitem.orderid = orderd.orderid INNER JOIN
customer ON orderd.customerid = customer.customerid
where productname = null

-- 37. List Fav phones of Bangalorean

-- 38. List all the products which were sold in the year 2013
select * 
from dbo.product as p
inner join dbo.orderd as o
on p.productid = o.orderid
where o.orderdate like '%2013%'
 
-- 39. List all the Nokia phones orderd by 'Ravi'
SELECT customername,productname
FROM product INNER JOIN
orderitem ON product.productid = orderitem.productid CROSS JOIN
customer where customername like '%ravi%' and productname like '%nokia%'

-- 40. List all the phones with its company name
SELECT productname,companyname
FROM product INNER JOIN
company ON product.companyid = company.companyid

-- 41. List companyid, companyname, productname, product price of all products
select c.companyid,c.companyname,p.productname,p.price from dbo.company as c 
inner join dbo.product as p
on c.companyid = p.companyid

-- 42. List customer name, stname and city of all the customer.
select c.customername,ca.stName,ca.city
from dbo.customer as c
inner join dbo.customeraddress as ca
on c.customerid = ca.customeraddressid

-- 43. List customer name and customer city  of all the customer
-- who have never bought any product
SELECT customername,city
FROM orderitem INNER JOIN
product ON orderitem.productid = product.productid 
INNER JOIN
orderd ON orderitem.orderid = orderd.orderid 
INNER JOIN
customer INNER JOIN
customeraddress ON customer.customerid = customeraddress.customerid 
ON orderd.customerid = customer.customerid 
AND orderd.customeraddressid = customeraddress.customeraddressid
where productname is null

-- 44. List Customer id, customer name, orderdate, of all the orders
SELECT customer.customerid,customername,orderdate
FROM customer INNER JOIN
orderd ON customer.customerid = orderd.customerid

-- 45. List Customer id, customer name, orderdate, company and 
-- product name with qty, price of all the orders
SELECT customer.customerid,customername,orderdate,companyname,productname,qty,price
FROM orderd INNER JOIN
customer ON orderd.customerid = customer.customerid INNER JOIN
orderitem ON orderd.orderid = orderitem.orderid INNER JOIN
company INNER JOIN
product ON company.companyid = product.companyid ON orderitem.productid = product.productid


/* 47. List Customer id, customer name, orderdate, company and 
product name with qty, price and amount of all the orders  
where amount > 50,000 (amount is qty*price) */
SELECT customer.customerid,customername,orderdate,companyname,productname,qty,price,amount
FROM customer INNER JOIN
orderd ON customer.customerid = orderd.customerid INNER JOIN
company INNER JOIN
product ON company.companyid = product.companyid INNER JOIN
orderitem ON product.productid = orderitem.productid 
ON orderd.orderid = orderitem.orderid
where amount > 50000


/* 48. List customerid, customername, city, companyname, productname,
qty, price and amount of all the products orderd */
SELECT customername,city,companyname,productname,qty,price,amount
FROM company INNER JOIN
orderitem INNER JOIN
product ON orderitem.productid = product.productid ON company.companyid = product.companyid CROSS JOIN
customeraddress INNER JOIN
customer ON customeraddress.customerid = customer.customerid


/* 49. List all product, company, customer and 
customer address details for all orders
which were ordered in the year 2014
*/
SELECT customername,productname,companyname,city,stName
FROM customeraddress INNER JOIN
customer ON customeraddress.customerid = customer.customerid 
INNER JOIN
orderd ON customeraddress.customeraddressid = orderd.customeraddressid 
AND customer.customerid = orderd.customerid 
CROSS JOIN
product INNER JOIN
company ON product.companyid = company.companyid
where orderdate like '%2014%'
  
/* 51. Get the total sales based on orderid  */
SELECT sum(price) as total_sales
FROM  product INNER JOIN
orderitem ON product.productid = orderitem.productid
group by orderid

/* 52. Get the total sales based on given month  */
SELECT sum(price) as total_sales,MONTH(orderdate) as month
FROM  product INNER JOIN
orderitem ON product.productid = orderitem.productid
inner join orderd on orderd.orderid = orderitem.orderid
group by MONTH(orderdate)

/* 53. Get the total sales based on year  */
SELECT sum(price) as total_sales,year(orderdate) as year
FROM  product INNER JOIN
orderitem ON product.productid = orderitem.productid
inner join orderd on orderd.orderid = orderitem.orderid
group by year(orderdate)

/* 54. Get the total sales based on month and year */
SELECT sum(price) as total_sales,MONTH(orderdate) as month,year(orderdate) as year
FROM  product INNER JOIN
orderitem ON product.productid = orderitem.productid
inner join orderd on orderd.orderid = orderitem.orderid
group by MONTH(orderdate),YEAR(orderdate)

/* 55. Total sales based on product  */
SELECT sum(price) as total_sales,productname
FROM  product INNER JOIN
orderitem ON product.productid = orderitem.productid
group by productname

/* 56. Total sales based on company  */
SELECT sum(price) as total_sales,companyname
FROM company INNER JOIN
product ON company.companyid = product.companyid
group by companyname

/* 57. Display top 3 sold mobiles */
SELECT top 3 productname,count(qty)
FROM product INNER JOIN
orderitem ON product.productid = orderitem.productid
group by productname,qty 

/* 58. Top 3 customers based on billing amount */
SELECT top 3 customername,totalamount
FROM customer INNER JOIN
orderd ON customer.customerid = orderd.customerid
group by customername,totalamount
order by totalamount desc

/* 59. Top 3rd customer based on billing amount */
SELECT top 3 customername as thirdhighestcustomer
FROM customer INNER JOIN
orderd ON customer.customerid = orderd.customerid
where orderd.totalamount in (select distinct top 3 totalamount from orderd order by totalamount desc)

/* 60. Display all unique phones which are sold */
select distinct(productname)
from product

/* 61. Display all phones which are sold with the no. of quantity */
SELECT productname,count(qty) as quantity
FROM product INNER JOIN
orderitem ON product.productid = orderitem.productid
group by productname,qty

/* 62. Name of the top priced phone */
select max(productname) as toppricedphone
from dbo.product


































































































































