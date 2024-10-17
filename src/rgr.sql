CREATE DATABASE clinic;
USE clinic;

CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Date_of_Birth DATE,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE Doctors (
    Doctor_ID INT PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Specialty VARCHAR(100),
    Experience INT,
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Services (
    Service_ID INT PRIMARY KEY AUTO_INCREMENT,
    Service_Name VARCHAR(100),
    Cost DECIMAL(10, 2),
    Specialization VARCHAR(100)
);

CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Doctor_ID INT,
    Appointment_Date DATE,
    Appointment_Time TIME,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

CREATE TABLE Prescriptions (
    Prescription_ID INT PRIMARY KEY AUTO_INCREMENT,
    Appointment_ID INT,
    Service_ID INT,
    Prescription_Details TEXT,
    FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID),
    FOREIGN KEY (Service_ID) REFERENCES Services(Service_ID)
);

INSERT INTO Patients (First_Name, Last_Name, Date_of_Birth, Phone, Email, Address)
VALUES
('Иван', 'Иванов', '1980-05-14', '89012345678', 'ivanov@gmail.com', 'ул. Ленина, 5'),
('Мария', 'Сидорова', '1990-09-21', '89023456789', 'sidorova@gmail.com', 'ул. Гагарина, 3');

INSERT INTO Doctors (First_Name, Last_Name, Specialty, Experience, Phone, Email)
VALUES
('Алексей', 'Петров', 'Терапевт', 15, '89034567890', 'petrov@clinic.com'),
('Ольга', 'Смирнова', 'Кардиолог', 12, '89045678901', 'smirnova@clinic.com');

INSERT INTO Services (Service_Name, Cost, Specialization)
VALUES
('Общий анализ крови', 500.00, 'Терапевт'),
('ЭКГ', 1500.00, 'Кардиолог');

INSERT INTO Appointments (Patient_ID, Doctor_ID, Appointment_Date, Appointment_Time)
VALUES
(1, 1, '2024-10-15', '09:00:00'),
(2, 2, '2024-10-16', '11:00:00');

INSERT INTO Prescriptions (Appointment_ID, Service_ID, Prescription_Details)
VALUES
(1, 1, 'Общий анализ крови для диагностики.'),
(2, 2, 'ЭКГ для контроля работы сердца.');

-- Список приёмов для конкретного пациента
SELECT A.Appointment_Date, A.Appointment_Time, D.First_Name, D.Last_Name, S.Service_Name
FROM Appointments A
JOIN Doctors D ON A.Doctor_ID = D.Doctor_ID
JOIN Prescriptions P ON A.Appointment_ID = P.Appointment_ID
JOIN Services S ON P.Service_ID = S.Service_ID
WHERE A.Patient_ID = 1;

-- Список назначений конкретного врача
SELECT P.Prescription_Details, S.Service_Name, A.Appointment_Date
FROM Prescriptions P
JOIN Services S ON P.Service_ID = S.Service_ID
JOIN Appointments A ON P.Appointment_ID = A.Appointment_ID
WHERE A.Doctor_ID = 2;
