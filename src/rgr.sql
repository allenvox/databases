CREATE DATABASE clinic;
USE clinic;

CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Date_of_Birth DATE NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE Doctors (
    Doctor_ID INT PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Specialty VARCHAR(100) NOT NULL,
    Experience INT,
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Services (
    Service_ID INT PRIMARY KEY AUTO_INCREMENT,
    Service_Name VARCHAR(100) NOT NULL,
    Cost DECIMAL(10, 2) NOT NULL,
    Specialization VARCHAR(100)
);

CREATE TABLE Rooms (
    Room_ID INT PRIMARY KEY AUTO_INCREMENT,
    Room_Number VARCHAR(10) NOT NULL,
    Room_Description VARCHAR(100)
);

CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Doctor_ID INT,
    Room_ID INT,
    Appointment_Date DATE NOT NULL,
    Appointment_Time TIME NOT NULL,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID) ON DELETE CASCADE,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID) ON DELETE CASCADE,
    FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID) ON DELETE CASCADE
);

CREATE TABLE Prescriptions (
    Prescription_ID INT PRIMARY KEY AUTO_INCREMENT,
    Appointment_ID INT,
    Service_ID INT,
    Prescription_Details TEXT,
    FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID) ON DELETE CASCADE,
    FOREIGN KEY (Service_ID) REFERENCES Services(Service_ID) ON DELETE CASCADE
);

INSERT INTO Patients (First_Name, Last_Name, Date_of_Birth, Phone, Email, Address)
VALUES
('Александр', 'Кузнецов', '1985-03-12', '89067891234', 'kuznetsov@gmail.com', 'ул. Советская, 10'),
('Екатерина', 'Фёдорова', '1992-11-22', '89098765432', 'fedorova@mail.ru', 'ул. Октябрьская, 8'),
('Михаил', 'Петров', '1978-06-03', '89065432198', 'petrov@gmail.com', 'ул. Центральная, 15'),
('Оксана', 'Иванова', '1995-02-25', '89056781234', 'ivanova@gmail.com', 'ул. Ленина, 12'),
('Артем', 'Гришин', '1990-05-18', '89034569876', 'grishin@gmail.com', 'ул. Пушкина, 5'),
('Иван', 'Иванов', '1980-05-14', '89012345678', 'ivanov@gmail.com', 'ул. Ленина, 5'),
('Мария', 'Сидорова', '1990-09-21', '89023456789', 'sidorova@gmail.com', 'ул. Гагарина, 3');

INSERT INTO Doctors (First_Name, Last_Name, Specialty, Experience, Phone, Email)
VALUES
('Алексей', 'Петров', 'Терапевт', 15, '89034567890', 'petrov@clinic.com'),
('Ольга', 'Смирнова', 'Кардиолог', 12, '89045678901', 'smirnova@clinic.com'),
('Дмитрий', 'Смирнов', 'Офтальмолог', 20, '89056785432', 'smirnov@clinic.com'),
('Анна', 'Васильева', 'Дерматолог', 10, '89067894321', 'vasilieva@clinic.com'),
('Игорь', 'Козлов', 'Хирург', 18, '89065476854', 'kozlov@clinic.com'),
('Наталья', 'Морозова', 'Невролог', 15, '89064567623', 'morozova@clinic.com'),
('Сергей', 'Соколов', 'Уролог', 12, '89087654329', 'sokolov@clinic.com');

INSERT INTO Services (Service_Name, Cost, Specialization)
VALUES
('Общий анализ крови', 500.00, 'Терапевт'),
('ЭКГ', 1500.00, 'Кардиолог'),
('Массаж спины', 2000.00, 'Невролог'),
('УЗИ брюшной полости', 1800.00, 'Уролог'),
('Консультация хирурга', 1500.00, 'Хирург'),
('Приём дерматолога', 1200.00, 'Дерматолог'),
('Диагностика зрения', 800.00, 'Офтальмолог');

INSERT INTO Rooms (Room_Number)
VALUES
('101'),
('102'),
('103'),
('104'),
('105'),
('106'),
('107'),
('108');

INSERT INTO Appointments (Patient_ID, Doctor_ID, Room_ID, Appointment_Date, Appointment_Time)
VALUES
(1, 1, 1, '2024-10-15', '09:00:00'),
(2, 2, 2, '2024-10-16', '11:00:00'),
(3, 3, 3, '2024-10-17', '12:00:00'),
(4, 4, 4, '2024-10-17', '09:30:00'),
(5, 5, 5, '2024-10-17', '14:00:00'),
(6, 1, 1, '2024-10-18', '13:00:00'),
(7, 2, 2, '2024-10-18', '10:00:00'),
(1, 3, 3, '2024-10-18', '11:00:00'),
(2, 4, 4, '2024-10-18', '15:00:00'),
(3, 5, 5, '2024-10-19', '16:00:00');

INSERT INTO Prescriptions (Appointment_ID, Service_ID, Prescription_Details)
VALUES
(1, 1, 'Массаж спины для лечения хронической боли.'),
(2, 2, 'УЗИ брюшной полости для диагностики.'),
(3, 3, 'Консультация хирурга перед операцией.'),
(4, 4, 'Приём дерматолога для лечения кожных заболеваний.'),
(5, 5, 'Диагностика зрения для определения очков.'),
(6, 1, 'Повторный массаж для закрепления результата.'),
(7, 2, 'Контрольное УЗИ после лечения.'),
(8, 3, 'Повторная консультация хирурга.'),
(9, 4, 'Дерматологическое обследование.'),
(10, 5, 'Проверка зрения для подбора линз.');

-- Список приёмов для конкретного пациента
SELECT 
    A.Appointment_Date, 
    A.Appointment_Time, 
    D.First_Name AS Doctor_First_Name, 
    D.Last_Name AS Doctor_Last_Name, 
    Ptn.First_Name AS Patient_First_Name, 
    Ptn.Last_Name AS Patient_Last_Name, 
    S.Service_Name
FROM Appointments A
JOIN Doctors D ON A.Doctor_ID = D.Doctor_ID
JOIN Prescriptions P ON A.Appointment_ID = P.Appointment_ID
JOIN Services S ON P.Service_ID = S.Service_ID
JOIN Patients Ptn ON A.Patient_ID = Ptn.Patient_ID
WHERE A.Patient_ID = 2;

-- Список назначений конкретного врача
SELECT 
    P.Prescription_Details, 
    S.Service_Name, 
    A.Appointment_Date, 
    Ptn.First_Name AS Patient_First_Name, 
    Ptn.Last_Name AS Patient_Last_Name,
    D.First_Name AS Doctor_First_Name, 
    D.Last_Name AS Doctor_Last_Name
FROM Prescriptions P
JOIN Services S ON P.Service_ID = S.Service_ID
JOIN Appointments A ON P.Appointment_ID = A.Appointment_ID
JOIN Patients Ptn ON A.Patient_ID = Ptn.Patient_ID
JOIN Doctors D ON A.Doctor_ID = D.Doctor_ID
WHERE A.Doctor_ID = 2;

-- Список всех врачей, у которых есть приёмы в комнате с номером 104
SELECT D.First_Name, D.Last_Name, R.Room_Number, A.Appointment_Date
FROM Appointments A
JOIN Doctors D ON A.Doctor_ID = D.Doctor_ID
JOIN Rooms R ON A.Room_ID = R.Room_ID
WHERE R.Room_Number = '104';

-- Список услуг, предоставленных врачами, с указанием врачей и пациентов
SELECT P.Prescription_Details, S.Service_Name, D.First_Name AS Doctor_First_Name, D.Last_Name AS Doctor_Last_Name, 
       Pt.First_Name AS Patient_First_Name, Pt.Last_Name AS Patient_Last_Name
FROM Prescriptions P
JOIN Services S ON P.Service_ID = S.Service_ID
JOIN Appointments A ON P.Appointment_ID = A.Appointment_ID
JOIN Doctors D ON A.Doctor_ID = D.Doctor_ID
JOIN Patients Pt ON A.Patient_ID = Pt.Patient_ID;

-- Удаление пациента с Patient_ID = 2
DELETE FROM Patients
WHERE Patient_ID = 2;

-- Проверяем каскадное удаление записей в связанных таблицах
SELECT * FROM Appointments
WHERE Patient_ID = 2;

SELECT * FROM Prescriptions P
JOIN Appointments A ON P.Appointment_ID = A.Appointment_ID
WHERE A.Patient_ID = 2;

