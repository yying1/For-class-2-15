use AdventureWorks2012;

/*Find out info of all the customers*/
SELECT*
FROM Sales.Customer


/*Find out info of all the sales orders*/
Select*
From sales.SalesOrderHeader


/*Find out sales info about productID 843*/
Select*
from sales.SalesOrderDetail
where ProductID = 843



/*Sales info of all the products of which unit price is between 100 and 200*/
Select*
from sales.SalesOrderDetail
where unitprice between 100 and 200 /*between is inclusive*/
/*where unitprice >=100 and unitprice<= 200*/

/*All the store names*/
select name 
from sales.store;


/*Find out store names that contain "Bike" */
select name
from sales.store
where name like '%bike%' /*case does not matter for like unless --> */ COLLATE SQL_Latin1_General_CP1_CS_AS;


/*info of all the credit cards*/
Select*
from sales.CreditCard;



/* A list of credit card types*/
Select distinct cardtype 
from sales.CreditCard; 

