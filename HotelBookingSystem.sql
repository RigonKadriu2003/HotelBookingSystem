create database HotelBookingSystem;

use HotelBookingSystem;

-- Table for Clients
CREATE TABLE Klienti (
    ID_Klienti INT PRIMARY KEY AUTO_INCREMENT,
    Emri VARCHAR(50),
    Mbiemri VARCHAR(50),
    Email VARCHAR(100),
    Telefoni VARCHAR(20)
);

-- Table for VIP Clients
CREATE TABLE KlientiVIP (
    ID_Klient INT,
    DataRegjistrimit DATE,
    NiveliVIP INT,
    FOREIGN KEY (ID_Klient) REFERENCES Klienti(ID_Klienti)
);

-- Table for Rooms
CREATE TABLE Dhoma (
    ID_Dhoma INT PRIMARY KEY AUTO_INCREMENT,
    NumriDhomes VARCHAR(10),
    Kapaciteti INT,
    Cmimi DECIMAL(10, 2)
);

-- Table for Reservations
CREATE TABLE Rezervimi (
    ID_Rezervimi INT PRIMARY KEY AUTO_INCREMENT,
    ID_Klienti INT,
    ID_Dhoma INT,
    DataFillimit DATE,
    DataMbarimit DATE,
    FOREIGN KEY (ID_Klienti) REFERENCES Klienti(ID_Klienti),
    FOREIGN KEY (ID_Dhoma) REFERENCES Dhoma(ID_Dhoma)
);

-- Table for Invoices
CREATE TABLE Fatura (
    ID_Fatura INT PRIMARY KEY AUTO_INCREMENT,
    ID_Rezervimi INT,
    DataFatures DATE,
    Shuma DECIMAL(10, 2),
    Paguar BOOLEAN,
    FOREIGN KEY (ID_Rezervimi) REFERENCES Rezervimi(ID_Rezervimi)
);

-- Table for Staff
CREATE TABLE Stafi (
    ID_Stafi INT PRIMARY KEY AUTO_INCREMENT,
    Emri VARCHAR(50),
    Mbiemri VARCHAR(50),
    Gjinia VARCHAR(10),
    DataLindjes DATE,
    Roli VARCHAR(50),
    Paga DECIMAL(10, 2)
);

-- Table for Salary
CREATE TABLE Paga (
    ID_Paga INT PRIMARY KEY AUTO_INCREMENT,
    ID_Stafi INT,
    Muaji INT,
    Viti INT,
    Shuma DECIMAL(10, 2),
    FOREIGN KEY (ID_Stafi) REFERENCES Stafi(ID_Stafi)
);

-- Table for Locations
CREATE TABLE Vendndodhja (
    ID_Vendndodhja INT PRIMARY KEY AUTO_INCREMENT,
    EmriVendndodhjes VARCHAR(100)
);

-- Table for Room Locations
CREATE TABLE VendodhjaDhoma (
    ID_VendodhjaDhoma INT PRIMARY KEY AUTO_INCREMENT,
    ID_Dhoma INT,
    ID_Vendndodhja INT,
    FOREIGN KEY (ID_Dhoma) REFERENCES Dhoma(ID_Dhoma),
    FOREIGN KEY (ID_Vendndodhja) REFERENCES Vendndodhja(ID_Vendndodhja)
);

-- Table for Customer Feedback
CREATE TABLE Feedback_Klienti (
    ID_Feedback INT PRIMARY KEY AUTO_INCREMENT,
    ID_Klienti INT,
    Komenti TEXT,
    FOREIGN KEY (ID_Klienti) REFERENCES Klienti(ID_Klienti)
);

-- Table for Client VIP Relationships
CREATE TABLE Klienti_KlientiVIP (
    ID_Klienti INT,
    ID_KlientiVIP INT,
    FOREIGN KEY (ID_Klienti) REFERENCES Klienti(ID_Klienti),
    FOREIGN KEY (ID_KlientiVIP) REFERENCES KlientiVIP(ID_Klient)
);

-- Table for Invoice-Reservation Relationships
CREATE TABLE Fatura_Rezervimi (
    ID_Fatura INT,
    ID_Rezervimi INT,
    FOREIGN KEY (ID_Fatura) REFERENCES Fatura(ID_Fatura),
    FOREIGN KEY (ID_Rezervimi) REFERENCES Rezervimi(ID_Rezervimi)
);

-- Table for Salary-Staff Relationships
CREATE TABLE Paga_Stafi (
    ID_Paga INT,
    ID_Stafi INT,
    FOREIGN KEY (ID_Paga) REFERENCES Paga(ID_Paga),
    FOREIGN KEY (ID_Stafi) REFERENCES Stafi(ID_Stafi)
);

-- Table for Room and Location Relationships
CREATE TABLE VendodhjaDhoma_Dhoma_Vendodhja (
    ID_VendodhjaDhoma INT,
    ID_Dhoma INT,
    ID_Vendndodhja INT,
    FOREIGN KEY (ID_VendodhjaDhoma) REFERENCES VendodhjaDhoma(ID_VendodhjaDhoma),
    FOREIGN KEY (ID_Dhoma) REFERENCES Dhoma(ID_Dhoma),
    FOREIGN KEY (ID_Vendndodhja) REFERENCES Vendndodhja(ID_Vendndodhja)
);

-- Table for Reservations, Clients, and Rooms Relationships
CREATE TABLE Rezervimi_Klienti_Dhoma (
    ID_Rezervimi INT,
    ID_Klienti INT,
    ID_Dhoma INT,
    FOREIGN KEY (ID_Rezervimi) REFERENCES Rezervimi(ID_Rezervimi),
    FOREIGN KEY (ID_Klienti) REFERENCES Klienti(ID_Klienti),
    FOREIGN KEY (ID_Dhoma) REFERENCES Dhoma(ID_Dhoma)
);

-- Insert data into Klienti table
INSERT INTO Klienti (Emri, Mbiemri, Email, Telefoni)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321');

-- Insert data into Dhoma table
INSERT INTO Dhoma (NumriDhomes, Kapaciteti, Cmimi)
VALUES
('101', 2, 100.00),
('102', 4, 200.00);

-- Insert data into KlientiVIP table
INSERT INTO KlientiVIP (ID_Klient, DataRegjistrimit, NiveliVIP)
VALUES
(1, '2022-01-01', 2),
(2, '2022-02-01', 1);

-- Insert data into Rezervimi table
INSERT INTO Rezervimi (ID_Klienti, ID_Dhoma, DataFillimit, DataMbarimit)
VALUES
(1, 1, '2024-01-01', '2024-01-05'),
(2, 2, '2024-01-10', '2024-01-15');

-- Insert data into Fatura table
INSERT INTO Fatura (ID_Rezervimi, DataFatures, Shuma, Paguar)
VALUES
(1, '2024-01-06', 500.00, 1),
(2, '2024-01-11', 600.00, 0);

-- Insert data into Stafi table
INSERT INTO Stafi (Emri, Mbiemri, Gjinia, DataLindjes, Roli, Paga)
VALUES
('Staff1', 'Johnson', 'Male', '1990-01-01', 'Manager', 2500.00),
('Staff2', 'Williams', 'Female', '1992-05-10', 'Receptionist', 1500.00),
('Staff3', 'Brown', 'Male', '1988-03-20', 'Waiter', 1200.00);

-- Insert data into Paga table
INSERT INTO Paga (ID_Stafi, Muaji, Viti, Shuma)
VALUES
(1, 1, 2024, 2500.00),
(2, 1, 2024, 1500.00),
(3, 1, 2024, 1200.00);

-- Insert data into Vendndodhja table
INSERT INTO Vendndodhja (EmriVendndodhjes)
VALUES
('City Center'),
('Old Town'),
('Riverside');

-- Insert data into VendodhjaDhoma table
INSERT INTO VendodhjaDhoma (ID_Dhoma, ID_Vendndodhja)
VALUES
(1, 1),
(2, 2);

-- Insert data into Feedback_Klienti table
INSERT INTO Feedback_Klienti (ID_Klienti, Komenti)
VALUES
(1, 'Great service!'),
(2, 'Room was too noisy.');

-- Insert data into Klienti_KlientiVIP table
INSERT INTO Klienti_KlientiVIP (ID_Klienti, ID_KlientiVIP)
VALUES
(1, 1),
(2, 2);

-- Insert data into Fatura_Rezervimi table
INSERT INTO Fatura_Rezervimi (ID_Fatura, ID_Rezervimi)
VALUES
(1, 1),
(2, 2);

-- Insert data into Paga_Stafi table
INSERT INTO Paga_Stafi (ID_Paga, ID_Stafi)
VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insert data into VendodhjaDhoma_Dhoma_Vendodhja table
INSERT INTO VendodhjaDhoma_Dhoma_Vendodhja (ID_VendodhjaDhoma, ID_Dhoma, ID_Vendndodhja)
VALUES
(1, 1, 1),
(2, 2, 2);

-- Insert data into Rezervimi_Klienti_Dhoma table
INSERT INTO Rezervimi_Klienti_Dhoma (ID_Rezervimi, ID_Klienti, ID_Dhoma)
VALUES
(1, 1, 1),
(2, 2, 2);


-- Get all clients:
SELECT * FROM Klienti;

-- Get all reservations with client names:
SELECT r.ID_Rezervimi, k.Emri, k.Mbiemri, d.NumriDhomes, r.DataFillimit, r.DataMbarimit
FROM Rezervimi r
JOIN Klienti k ON r.ID_Klienti = k.ID_Klienti
JOIN Dhoma d ON r.ID_Dhoma = d.ID_Dhoma;

-- Get total revenue from all invoices:
SELECT SUM(Shuma) AS TotalRevenue
FROM Fatura
WHERE Paguar = 1;

-- Get all VIP clients:
SELECT k.Emri, k.Mbiemri, kv.NiveliVIP
FROM KlientiVIP kv
JOIN Klienti k ON kv.ID_Klient = k.ID_Klienti;

-- Get feedback from clients:
SELECT k.Emri, k.Mbiemri, f.Komenti
FROM Feedback_Klienti f
JOIN Klienti k ON f.ID_Klienti = k.ID_Klienti;

-- Get all staff with their salaries:
SELECT s.Emri, s.Mbiemri, s.Roli, p.Shuma
FROM Stafi s
JOIN Paga p ON s.ID_Stafi = p.ID_Stafi;
