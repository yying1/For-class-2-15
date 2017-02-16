use AdventureWorks2012;

/*Activity 1. Using the HumanResource.Employee table, provide a count of the number of employees by job title.  The query should consider only current employees (the CurrentFlag must equal 1).  */
select jobtitle,
	count (BusinessEntityID) as number_of_employee
from HumanResources.Employee
Where currentflag = 1 
Group by jobtitle; 


/*Activity 2. Modify the query you created in Activity 1 so that the output shows only those job titles for which there is more than 1 employee.  */
select jobtitle,
	count (BusinessEntityID) as number_of_employee
from HumanResources.Employee
Where currentflag = 1 
Group by jobtitle
having count(businessentityid) >1 
order by count(businessentityid) desc;

/*Activity 3. For each product, show its ProductID and Name (FROM the ProductionProduct table) and the location of its inventory (FROM the Product.Location table) and amount of inventory held at that location (FROM the Production.ProductInventory table).*/
Select P.ProductID, P.Name as Productname, L.Name as Locationame, I.quantity as Amount
FROM Production.product as P 
left outer join Production.ProductInventory as I
on P.ProductID = I.ProductID
Left outer join Production.location as L
on  I.LocationID = L.LocationID
order by p.ProductID asc; 


/*Activity 4. Find the product model IDs that have no product associated with them.  
To do this, first do an outer join between the Production.Product table and the Production.ProductModel table in such a way that the ID FROM the ProductModel table always shows, even if there is no product associate with it.  
Then, add a WHERE clause to specify that the ProductID IS NULL 
*/
Select PM.productmodelID, p.productid as ProductIDStatus
from production.productmodel as pm
left outer join production.product as p
on pm.name = p.name 
where p.productid is Null 
Order by pm.ProductModelID asc;
