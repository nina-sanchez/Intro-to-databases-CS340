-- date: 02/01/2024
-- Adapted from code provided in the canvas module
-- url: https://canvas.oregonstate.edu/courses/1946034/pages/activity-5-sql-queries-of-multiple-tables-joins?module_item_id=23809309

SELECT Invoices.InvoiceID, Customers.CustomerName, Customers.City, Customers.State, CURDATE() AS Date, Invoices.TotalDue
FROM Customers
INNER JOIN Invoices ON Customers.CustomerID = Invoices.CustomerID
WHERE Invoices.InvoiceID = 3;