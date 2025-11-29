## This is a test from cxrus

### Steps
1. Make sure you have Java 25 and PostgreSQL on your test machine.
2. Clone the project.
3. Create a database called "cxrus" in PostgreSQL and use table.sql file to create tables and dummy data.
4. Put username and password into application.properties file and run Maven build.
5. Start the project and visit localhost:8081

### 1. SQL statements

```sql
-- a. List all the customer names who do not have any single order.
select s.CompanyName, o.OrderID
from Customers s left join Orders o on s.CustomerID = o.CustomerID
where OrderID is null;

-- b. List all the unique customer names who had ordered products that contain the word “Lager”.
select s.CompanyName
from Customers s join Orders o on s.CustomerID = o.CustomerID
where o.OrderID in (
    select o.OrderID from Order_Details o where ProductID in (
        select ProductID from Products where ProductName like '%Lager%'
        )
    )
group by s.CompanyName;

-- c. For each customer, display the number of orders with the order date in the year of 1998.
select CompanyName, count(OrderYear) from(
    select s.CompanyName, EXTRACT(YEAR FROM o.OrderDate) AS OrderYear
    from Customers s join Orders o on s.CustomerID = o.CustomerID
)
where OrderYear = '1998'
group by CompanyName;
```