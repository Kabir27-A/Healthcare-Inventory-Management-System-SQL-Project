USE Healthcare_Inventory_Management;
GO

-- Show each customer’s name, phone, and the total amount of their orders.

Select
Orders.CustomerID,
Phone,
Email, 
sum(TotalAmount)as totalspent,
Count(OrderID)AS TotalOrders
FROM CustomerPatients 
INNER JOIN Orders 
    ON CustomerPatients.CustomerID = Orders.CustomerID
GROUP BY Orders.CustomerID,Phone,Email
ORDER BY TotalSpent DESC;


--List all orders along with the employee (pharmacist/manager/clerk) who processed them.

SELECT O.OrderID,
    O.OrderDate,
    O.TotalAmount,
    E.Name,
    E.Role
FROM Orders O
    JOIN Employees E
    ON O.EmployeeID= E.EmployeeID
ORDER BY OrderDate desc;


--Show all medicines with their supplier’s name and contact person.


SELECT 
    S.SupplierID,
    S.Name AS SupplierName,
    S.Contactperson ,
    M.Name AS MedicineName
FROM Suppliers S
    JOIN Medicines M
    ON M.SupplierID = S.SupplierID ;


    --Find medicines from the inventory whose available quantity is below the reorder level, along with supplier details.

    
    SELECT 
    S.SupplierID,
    S.Name,
    S.Contactperson,
    M.MedicineID,
    M.Name AS MedicineName,
    M.Category,
    I.Quantity AS Currentstock,
    M.RecoderLevel

    FROM Inventory I
    JOIN Medicines M
    ON I.MedicineID=M.MedicineID

    JOIN Suppliers S
    ON S.SupplierID=M.SupplierID;


    --Create a view that shows each customer’s name, total orders, and total amount spent.

    GO
    CREATE VIEW order_summary AS
    SELECT 
    C.CustomerID,
    Count(O.OrderID)AS TOTALORDERS,
    Sum(O.TotalAmount) AS TOTALSPENT
    From CustomerPatients C
    LEFT JOIN Orders O
    ON C.CustomerID = O.CustomerID
    GROUP BY c.CustomerID;
    GO

    SELECT * FROM order_summary;
    GO


    
    

    

    --Find the top 5 customers who spent more than 10,000 in total purchases.


    SELECT Top 5 C.CustomerID,
        C.Email,
        C.Address, 
        SUM (O.TotalAmount) AS TOTALSPENT 
      FROM CustomerPatients C
      RIGHT JOIN Orders O 
      ON C.CustomerID=O.CustomerID
      GROUP BY C.CustomerID
      HAVING SUM(O.TotalAmount) > 50
      ORDER BY TOTALSPENT DESC;
    



    


 --Show all medicines expiring within the next 60 days along with supplier name, category, and current stock quantity.

SELECT 
 S.Name AS Suppliername,
 S.Contactperson,
 M.Category,
 M.MedicineID,
 M.Name AS Medicinename,
 M. ExpiryDATE,
 I.Quantity AS currentstock

FROM Medicines M
JOIN Suppliers S
ON M.SupplierID = S.SupplierID

JOIN Inventory I
ON M.MedicineID = I.MedicineID

WHERE M.ExpiryDate <= DATEADD(DAY,60,GETDATE())
ORDER BY M.ExpiryDate ASC;






