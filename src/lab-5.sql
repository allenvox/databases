USE computerdb;

-- 1. Перечень комплектующих изделий для компьютера с заданным названием
SELECT Comp_Parts.Part_ID, Comp_Parts.Name, Comp_Parts.Description
FROM Comp_Config
JOIN Computers ON Comp_Config.Comp_ID = Computers.Comp_ID
JOIN Comp_Parts ON Comp_Config.Part_ID = Comp_Parts.Part_ID
WHERE Computers.Name = 'Компьютер DNS Prestige';

-- 7. Список заказов с заданным компьютером
SELECT Orders.Ord_ID, Orders.Rec_Date, Orders.Ex_Date, Orders.Cust_ID
FROM Order_Items
JOIN Computers ON Order_Items.Comp_ID = Computers.Comp_ID
JOIN Orders ON Order_Items.Ord_ID = Orders.Ord_ID
WHERE Computers.Name = '14"" [Office] Ноутбук';

-- 15. Список клиентов, заказывавших компьютер с максимальной (MAX) или минимальной (MIN) стоимостью
UPDATE Computers
SET Price = 7000
WHERE Comp_ID = 6;

UPDATE Computers
SET Price = 9000
WHERE Comp_ID = 15;

UPDATE Computers
SET Price = 11500
WHERE Comp_ID = 20;

UPDATE Computers
SET Price = 13000
WHERE Comp_ID = 21;

UPDATE Computers
SET Price = 17700
WHERE Comp_ID = 29;

SELECT Customers.Cust_ID, Customers.Name, Customers.Address
FROM Order_Items
JOIN Computers ON Order_Items.Comp_ID = Computers.Comp_ID
JOIN Orders ON Order_Items.Ord_ID = Orders.Ord_ID
JOIN Customers ON Orders.Cust_ID = Customers.Cust_ID
WHERE Computers.Price = (SELECT MIN(Price) FROM Computers);

-- 33. Компьютер с максимальной (DESC) или минимальной (ASC) выручкой от заказов
SELECT Computers.Comp_ID, Computers.Name, SUM(Order_Items.Quantity * Computers.Price) AS Total_Revenue
FROM Order_Items
JOIN Computers ON Order_Items.Comp_ID = Computers.Comp_ID
GROUP BY Computers.Comp_ID, Computers.Name
ORDER BY Total_Revenue ASC
LIMIT 1;

-- 41. Общее число заказов для компьютеров с ценой в заданном диапазоне
SELECT COUNT(DISTINCT Orders.Ord_ID) AS Total_Orders
FROM Order_Items
JOIN Computers ON Order_Items.Comp_ID = Computers.Comp_ID
JOIN Orders ON Order_Items.Ord_ID = Orders.Ord_ID
WHERE Computers.Price BETWEEN 12000 AND 15000;

-- 43. Общее количество заказов для компьютеров заданного типа
SELECT COUNT(DISTINCT Orders.Ord_ID) AS Total_Orders
FROM Order_Items
JOIN Computers ON Order_Items.Comp_ID = Computers.Comp_ID
JOIN Comp_Types ON Computers.Type_ID = Comp_Types.Type_ID
JOIN Orders ON Order_Items.Ord_ID = Orders.Ord_ID
WHERE Comp_Types.Name = 'Моноблоки';
