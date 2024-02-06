-- date: 02/01/2024
-- Adapted from code provided in the canvas module
-- url: https://canvas.oregonstate.edu/courses/1946034/pages/activity-5-sql-queries-of-multiple-tables-joins?module_item_id=23809309

SELECT Customers.CustomerName, Invoices.InvoiceID, SUM(InvoiceDetails.LineTotal) AS LineSum
FROM Customers
JOIN Invoices ON Customers.CustomerID = Invoices.CustomerID
JOIN InvoiceDetails ON Invoices.InvoiceID = InvoiceDetails.InvoiceID
GROUP BY Invoices.InvoiceID
ORDER BY LineSum DESC;