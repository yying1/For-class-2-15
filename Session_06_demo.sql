use AdventureWorks2012;

/*In PPT: GROUP BY*/
SELECT OnlineOrderFlag,
		Count(SalesOrderID) as Number, /*pink letter as aggregation functions, always end with group by*/
		Avg(TotalDue) as Avg_Due,
		Max(TotalDue) as Max_Due
FROM Sales.SalesOrderHeader
GROUP BY OnlineOrderFlag;


/*In PPT: Having */
SELECT TerritoryID, OrderDate, Count(SalesOrderID) as Number, Sum(TotalDue) as Amt_Due
FROM Sales.SalesOrderHeader
WHERE OrderDate < '2007-01-01'
Group by TerritoryID, OrderDate
having sum(TotalDue) >= 5000 /*where is used before group by, but having us used after it. they are indeed similar*/
Order by Sum(TotalDue) DESC; 


/*IN PPT: Inner Join* + inner join will exclude all entries from both tables that does not contain data form the other one/
SELECT  s.SalesOrderID,
s.OrderQty,
s.UnitPrice,
s.LineTotal,
p.Name
FROM sales.SalesOrderDetail as s Inner Join production.product as p /*four type of joins* + the same as using where, in + 'as' also could shortend the table name* /
on  s.ProductID=p.ProductID;

/*left outer join will only show all entries from the left table (which is also the first one), same with left outer join./
/*full outer join will include all entries and put null in join table for missing matches, to find rows with null, use where ** is null after outer join/

/* IN PPT: without 'INNER JOIN'*/
SELECT s.SalesOrderID,
s.OrderQty,
s.UnitPrice,
s.LineTotal,
p.Name
FROM sales.SalesOrderDetail as s, production.product as p
WHERE s.ProductID=p.ProductID;


/*In PPT: Sequential JOINs*/
SELECT S.Name as store, PA.City, SP.Name as State, CR.Name as CountryRegion
FROM Sales.store as S JOIN Person.BusinessEntityAddress as A
on a.BusinessEntityID=s.BusinessEntityID
JOIN person.Address as PA
on A.AddressID =pa.AddressID
JOIN Person.StateProvince as SP
on SP.StateProvinceID = PA.stateProvinceID
JOIN Person.CountryRegion as CR
on CR.CountryRegionCode = SP.CountryRegionCode
ORDER BY S.Name;


/*In PPT: Outer Join. Check out the bottom of the resuls. Compare the results with the results of INNER JOIN*/
SELECT s.SalesOrderID,
s.OrderQty,
p.ProductID,
p.Name
FROM sales.SalesOrderDetail as s
RIGHT OUTER JOIN production.product as p
ON s.ProductID=p.ProductID;


/* In PPT: Example of a subquery*/
Select TerritoryID, Sum(TotalDue) as Total_Due,
100*sum(totalDue)/
	(select Sum(totaldue)
	From Sales.SalesOrderHeader)
 as Pct_total_due
From Sales.SalesOrderHeader
group by TerritoryID
order by TerritoryID;



/* The above query is actually equal to the following two queries.*/
select Sum(totaldue)
From Sales.SalesOrderHeader;



Select TerritoryID, Sum(TotalDue) as Total_Due,
100*sum(totalDue)/123216786.1159 as Pct_total_due
From Sales.SalesOrderHeader
group by TerritoryID
order by TerritoryID;