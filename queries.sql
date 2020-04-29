-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT "Product"."ProductName", "Category"."CategoryName"
FROM "Product"
JOIN "Category"
ON "Product"."CategoryId" = "Category"."Id"

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o."Id", s."CompanyName"
FROM "Order" as o
LEFT JOIN "Shipper" as s 
ON o."EmployeeId" = s."Id"
WHERE o."OrderDate" < "2012-08-09"

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p."ProductName", o."Quantity"
FROM "OrderDetail" as o
JOIN "Product" as p
ON p."Id" = o."ProductId"
WHERE o."OrderId" = 10251
ORDER BY p."ProductName"

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT "Order"."Id" as OrderID, c."CompanyName", e."LastName" as EmployeesLastName
FROM "Order"
JOIN "Customer" as c
ON "Order"."CustomerId" = c."Id"
JOIN "Employee" as e
ON e."Id" = "Order"."EmployeeId"