-- 1. Создание новой БД
CREATE DATABASE computerdb;
USE computerdb;

-- 2-3. Импорт и проверка таблиц
CREATE TABLE Computers (
    Comp_ID INT PRIMARY KEY,         -- Идентификатор компьютера
    Name VARCHAR(255),               -- Название компьютера
    Description TEXT,                -- Описание компьютера
    Type_ID INT,                     -- Идентификатор типа компьютера
    Price DECIMAL(10,2)              -- Цена компьютера
);
INSERT INTO Computers (Comp_ID, Name, Description, Type_ID, Price)
VALUES
(1, '15.6"" [Gamer] Ноутбук', 'i7-3630(2.4), 8192, 750, NV GT650M 2Gb, DVD-Smulti, WiFi, BT, Cam, Win8', 1, NULL),
(2, '11.6"" [Travel] Ноутбук', 'Pentium B960(2.2), 2048, 320, Intel HD, WiFi, BT, Cam', 1, NULL),
(3, '15.6"" [Extreme] Ноутбук', 'i7-3610QM(2.3), 16384, Hybrid 500, AMD HD7970 2Gb, DVD-Smulti, WiFi, BT, Cam', 1, NULL),
(4, '15.6"" [Home] Ноутбук', 'Pentium B960(2.2), 4096, 500, NV GT640M 1Gb, DVD-Smulti, WiFi, BT, Cam', 1, NULL),
(5, '10.1"" [Mini] Ноутбук', 'Intel Atom N2800(1.86), 2048, 320, WiFi, BT, Cam, Red, 4400mAh', 1, NULL),
(6, '14"" [Office] Ноутбук', 'AMD C60(1.0), 2048, 320, AMD HD6290, WiFi, BT, NO DVD, Cam', 1, NULL),
(7, '14"" [Ultrabook] Ноутбук', 'i5-3317U(1.7GHz to 2.6GHz), 4096, 750, SSD cache 30Gb, NV GT640M 1Gb, WiFi, BT, Cam', 1, NULL),
(8, 'Компьютер DNS Extreme XL', 'FX-4170 (4.2 GHz), 8GB, GTX660 (2048), 1TB, DVD±RW', 2, NULL),
(9, 'Компьютер DNS Prestige XL', 'Core i7-3770 (3.4GHz), 8GB, GTX 660 Ti (2048), 1TB, DVD±RW', 2, NULL),
(10, 'Компьютер DNS Home', 'A4-3300 (2.5 GHz), 4GB, 500GB, DVD±RW, CR', 2, NULL),
(11, 'Компьютер DNS Office', 'Sempron 130 (2.6 GHz), 1Gb, 500GB', 2, NULL),
(12, 'Компьютер DNS Office XL', 'Pentium G2010 (2.8 GHz), 4GB, 500GB, DVD±RW', 2, NULL),
(13, 'Компьютер DNS Home XL', 'A10-5800K (3.8 GHz), 4GB, HD7660D, 500GB, DVD±RW', 2, NULL),
(14, 'Компьютер DNS Extreme', 'Core i5-3450 (3.1GHz), 4GB, HD7750 (1024), 1TB, DVD±RW', 2, NULL),
(15, 'Компьютер DNS Prestige', 'Core i3-3220 (3.3 GHz), 8GB, GTX650 Ti (1024), 1TB, DVD±RW', 2, NULL),
(16, 'Компьютер DNS Extreme SSD', 'Core i3-3220 (3.3 GHz), 8GB, GTX650Ti (1024), SSD 120Gb, 1TB, DVD±RW', 2, NULL),
(17, '21.5"" Моноблок DNS Home (FHD)', 'Core i3-2370M (2.40GHz), 2GB, 320GB, DVD±RW, Cam, Wi-Fi', 3, NULL),
(18, '18.5"" Моноблок DNS Office (HD Ready)', 'Celeron G540 (2.5GHz), 2Gb, 500GB, DVD±RW, Wi-Fi, Cam', 3, NULL),
(19, '21.5"" Моноблок DNS Extreme (FHD)', 'Pentium G2120 (3.1GHz), 4GB, 1TB, GT640M, DVD±RW, Cam, Wi-Fi', 3, NULL),
(20, '18.5"" Моноблок Acer Aspire Z1650', 'Atom D2500(1.86)/2GB/320Gb/nVidia ION2/DVD-RW/LAN+WiFi/Cam', 3, NULL),
(21, '21,5"" МоноБлок Apple iMac', 'Core i5(2.7)/8Gb/1Tb/Geforce GTX 640M 512Mb/WiFi/BT/Cam/Kb+M', 3, NULL),
(22, '23"" Моноблок Dell Inspiron One', 'Core i5-3330s (2.7 GHz)/8GB/HD 7650 (1GB)/1TB/BlueRay/Wi-Fi/BT/KB+M', 3, NULL),
(23, '20.1"" Моноблок HP Pavilion AIO', 'AMD E1-1200 (1.4)/2GB/500GB/ AMD Radeon HD 6320/DVD-RW/WiFi/ Cam/Kb+M', 3, NULL),
(24, '27"" Моноблок Dell XPS One', 'Core i5-4430 (3.0 GHz)/6GB/GF750 (2GB)/1TB/BlueRay/Wi-Fi/BT/KB+M', 3, NULL),
(25, '18.5"" Моноблок Lenovo Edge', 'Celeron G540 (2.5GHz)/2GB/Intel HD/320GB/DVDRW/Cam/WiFi/KB+M/ DOS/Black', 3, NULL),
(26, '20.1"" Моноблок Acer Aspire A3410', 'AMD E450 (1.65), 4GB, 500GB, AMD HD6310, DVD-RW, Cam, Kb+M', 3, NULL),
(27, '21.5"" Моноблок Samsung (FHD)', 'Pentium G645T (2.5 GHz), 4GB, 500GB, Intel HD 2000, DVD±RW, Wi-Fi', 3, NULL),
(28, '24"" МоноБлок Sony (FHD/Touch)', 'Core i5 3210M (2.5), 8GB, 1Tb, NV GT620M 2Gb, Blu-Ray Combo, WiFi, BT, Cam', 3, NULL),
(29, 'Компьютер Apple Mac mini', 'i5(2.5GHz)/4Gb/500Gb/Intel HD4000 1Gb/DVI/HDMI/Wi-Fi', 4, NULL),
(30, 'Компьютер DNS Porto', 'Core i3-3217U (1.8GHz), HD Graphics 4000, 2Gb, 500GB, Wi-Fi, BT, HDMI, Dsub', 4, NULL),
(31, 'Микрокомпьютер Raspberry Pi model B', 'ARM11/512 Mb/kit/SD card 4Gb/OS', 4, NULL),
(32, 'Компьютер 3Q Shell', 'Atom D2500(1.86)/4Gb/640Gb/Intel HD/Wi-Fi/MeeGo', 4, NULL),
(33, 'Компьютер Acer Aspire Revo', 'AMD E450(1.65)/1GB/320GB/AMD HD 6320D', 4, NULL),
(34, 'Компьютер Lenovo IdeaCentre', 'Atom D2700(2.13GHz), 4GB, 500GB, AMD HD7450(512Mb), WiFi', 4, NULL),
(35, 'Сервер DNS 1С', 'Xeon Е1220 (3,10GHz), 4GB, 2x500GB, DVD-RW', 5, NULL);

-- 4. Схема связей

-- Между Computers и Comp_Types
ALTER TABLE Comp_Types
ADD PRIMARY KEY (Type_ID);
ALTER TABLE Computers
ADD CONSTRAINT FK_Comp_Types
FOREIGN KEY (Type_ID) REFERENCES Comp_Types(Type_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Между Comp_Parts и Part_Types
ALTER TABLE Part_Types
ADD PRIMARY KEY (Type_ID);
ALTER TABLE Comp_Parts
ADD CONSTRAINT FK_Part_Types
FOREIGN KEY (Type_ID) REFERENCES Part_Types(Type_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Между Comp_Config и Computers
ALTER TABLE Computers
ADD PRIMARY KEY (Comp_ID);
ALTER TABLE Comp_Config
ADD CONSTRAINT FK_Computers_Config
FOREIGN KEY (Comp_ID) REFERENCES Computers(Comp_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Между Customers и Orders
ALTER TABLE Customers
ADD PRIMARY KEY (Cust_ID);
ALTER TABLE Orders
ADD CONSTRAINT FK_Customers_Orders
FOREIGN KEY (Cust_ID) REFERENCES Customers(Cust_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Между Orders и Order_Items
ALTER TABLE Orders
ADD PRIMARY KEY (Ord_ID);
ALTER TABLE Order_Items
ADD CONSTRAINT FK_Orders_Items
FOREIGN KEY (Ord_ID) REFERENCES Orders(Ord_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Между Order_Items и Computers
ALTER TABLE Order_Items
ADD CONSTRAINT FK_Computers_Items
FOREIGN KEY (Comp_ID) REFERENCES Computers(Comp_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

-- 5. Свой вариант: 6, 15, 20, 21, 29

-- 6. Внесение в Comp_Config и Order_Items своего варианта
-- Замена уже существующих записей на наши конфигурации
SET SQL_SAFE_UPDATES = 0;
UPDATE Comp_Config
SET Comp_ID = 6
WHERE Comp_ID = 8;

UPDATE Comp_Config
SET Comp_ID = 15
WHERE Comp_ID = 9;

UPDATE Comp_Config
SET Comp_ID = 20
WHERE Comp_ID = 11;

UPDATE Comp_Config
SET Comp_ID = 21
WHERE Comp_ID = 12;
SET SQL_SAFE_UPDATES = 1;

-- Добавление своей конфигурации
INSERT INTO Comp_Config (Comp_ID, Part_ID, Quantity)
VALUES
(29, 115, 1),
(29, 118, 1),
(29, 119, 1);

-- Обновление Order_Items (замена на свой вариант)
SET SQL_SAFE_UPDATES = 0;
UPDATE Order_Items
SET Comp_ID = 6
WHERE Comp_ID = 8;

UPDATE Order_Items
SET Comp_ID = 15
WHERE Comp_ID = 9;

UPDATE Order_Items
SET Comp_ID = 20
WHERE Comp_ID = 11;

UPDATE Order_Items
SET Comp_ID = 21
WHERE Comp_ID = 12;
SET SQL_SAFE_UPDATES = 1;

-- Добавление своей записи в Order_Items
INSERT INTO Order_Items (Ord_ID, Comp_ID, Quantity)
VALUES
(2, 29, 1);

-- 7. Удаление лишних записей из табл. Computers
DELETE FROM Computers
WHERE Comp_ID NOT IN (6, 15, 20, 21, 29);

-- 8. Добавление поля Image в табл. Computers и Comp_Parts
ALTER TABLE Computers
ADD COLUMN Image LONGBLOB;

ALTER TABLE Comp_Parts
ADD COLUMN Image LONGBLOB;
