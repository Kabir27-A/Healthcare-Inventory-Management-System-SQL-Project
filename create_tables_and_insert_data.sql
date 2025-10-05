CREATE DATABASE Healthcare_Inventory_Management;
GO

USE Healthcare_Inventory_Management;
GO

CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(50) NOT NULL,
Role VARCHAR(50) NOT NULL CHECK(Role IN ('Pharmacist','Manager','Clerk')),
Phone VARCHAR(20) UNIQUE,
HireDate DATE NOT NULL DEFAULT GETDATE()
);

Go

CREATE TABLE Suppliers (
SupplierID INT PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(50) NOT NULL,
ContactPerson VARCHAR(50),
Phone VARCHAR(50) UNIQUE,
Email VARCHAR(50) UNIQUE,
Address VARCHAR(100)
);
GO


CREATE TABLE CustomerPatients(
CustomerID INT PRIMARY KEY IDENTITY(1,1),
Phone VARCHAR(50) UNIQUE,
Email VARCHAR(50) UNIQUE,
Address VARCHAR(50)
);
GO

CREATE TABLE Medicines (
MedicineID INT PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(50) NOT NULL,
Category VARCHAR(50) NOT NULL,
SupplierID INT NOT NULL,
UnitPrice Decimal(10,2) NOT NULL CHECK(UnitPrice>=0),
RecoderLevel INT NOT NULL DEFAULT 10 CHECK(RecoderLevel>=0),
ExpiryDate DATE NOT NULL,
CONSTRAINT FK_Medicine_Supplier Foreign key (SupplierID) REFERENCES Suppliers(SupplierID)
);
GO

CREATE TABLE Inventory (
InventoryID INT PRIMARY KEY IDENTITY(1,1),
MedicineID INT NOT NULL UNIQUE,
Quantity INT NOT NULL CHECK(Quantity>=0),
LastUpdated date NOT NULL DEFAULT GETDATE(),
CONSTRAINT FK_Inventory_Medicine FOREIGN KEY(MedicineID) REFERENCES Medicines(MedicineID)
);
GO

CREATE TABLE Orders (
OrderID INT PRIMARY KEY IDENTITY(1,1),
CustomerID INT NOT NULL,
EmployeeID INT NOT NULL,
OrderDate datetime NOT NULL DEFAULT GETDATE(),
TotalAmount DECIMAL(12,2) NOT NULL CHECK(TotalAmount>=0),
Payment VARCHAR(50) CHECK(Payment IN('Cash','Card','Insurance')),
CONSTRAINT FK_Order_Customer FOREIGN KEY(CustomerID) References CustomerPatients(CustomerID),
CONSTRAINT FK_Order_Employee FOREIGN KEY(EmployeeID) References Employees(EmployeeID)
);
GO


CREATE TABLE OrderDetails (
OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
OrderID INT NOT NULL,
MedicineID INT NOT NULL,
Quanity INT NOT NULL CHECK(Quanity>=0),
Unitprice DECIMAL(10,2) NOT NULL CHECK(Unitprice>=0),
CONSTRAINT FK_Orderdetails_Order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
CONSTRAINT FK_Orderdetails_Medicine FOREIGN KEY(MedicineID) REFERENCES   Medicines(MedicineID),
CONSTRAINT UQ_OrderDetails UNIQUE (OrderID, MedicineID) 
);
GO


select NAME from sys.tables;




INSERT INTO Employees (Name, Role, Phone, HireDate) VALUES
('Alice Smith','Pharmacist','0171000001','2021-01-10'),
('John Doe','Manager','0171000002','2020-05-12'),
('Sarah Johnson','Clerk','0171000003','2022-03-15'),
('Michael Brown','Pharmacist','0171000004','2019-11-20'),
('Emily Davis','Clerk','0171000005','2021-07-25'),
('David Wilson','Manager','0171000006','2018-06-14'),
('Laura Taylor','Pharmacist','0171000007','2022-01-19'),
('James White','Clerk','0171000008','2020-09-30'),
('Sophia Martin','Pharmacist','0171000009','2021-10-21'),
('Daniel Harris','Manager','0171000010','2019-12-12'),
('Olivia Clark','Clerk','0171000011','2022-04-05'),
('Henry Lewis','Pharmacist','0171000012','2021-08-13'),
('Emma Walker','Manager','0171000013','2018-03-17'),
('Benjamin Hall','Pharmacist','0171000014','2020-07-23'),
('Mia Allen','Clerk','0171000015','2021-02-09'),
('Lucas Young','Pharmacist','0171000016','2022-05-16'),
('Grace King','Manager','0171000017','2019-09-07'),
('Matthew Scott','Clerk','0171000018','2021-06-29'),
('Ava Green','Pharmacist','0171000019','2020-01-11'),
('Ethan Baker','Manager','0171000020','2018-10-02');
GO


INSERT INTO Suppliers (Name, ContactPerson, Phone, Email, Address) VALUES
('MediLife Pharma','Robert Long','0182000001','medilife1@mail.com','Dhaka'),
('HealthPlus Ltd','Karen Lee','0182000002','hp2@mail.com','Chattogram'),
('BioCare Suppliers','Tom Adams','0182000003','biocare3@mail.com','Sylhet'),
('CureMed Distributors','Susan Ray','0182000004','cure4@mail.com','Khulna'),
('Global Pharma','Alan Kim','0182000005','global5@mail.com','Dhaka'),
('Wellness Corp','Diana Moore','0182000006','well6@mail.com','Rajshahi'),
('VitalMeds','Chris White','0182000007','vital7@mail.com','Barishal'),
('PharmaTrust','Linda Hill','0182000008','trust8@mail.com','Dhaka'),
('CareFirst Supplies','George King','0182000009','care9@mail.com','Sylhet'),
('MediAid Co','Nancy Scott','0182000010','aid10@mail.com','Chattogram'),
('LifeLine Pharma','Paul Green','0182000011','life11@mail.com','Rangpur'),
('PureHealth','Olivia Carter','0182000012','pure12@mail.com','Mymensingh'),
('BetterMeds','Henry Wood','0182000013','better13@mail.com','Dhaka'),
('PharmaLink','Sophia Evans','0182000014','link14@mail.com','Chattogram'),
('MediTrust','James Bell','0182000015','trust15@mail.com','Sylhet'),
('CuraPharma','Emily Reed','0182000016','cura16@mail.com','Khulna'),
('Zenith Health','Daniel Cook','0182000017','zenith17@mail.com','Dhaka'),
('PrimeMeds','Grace Ward','0182000018','prime18@mail.com','Rajshahi'),
('HealthLine','Lucas Wright','0182000019','health19@mail.com','Dhaka'),
('MediCare','Emma Scott','0182000020','care20@mail.com','Barishal');
GO


INSERT INTO CustomerPatients (Phone, Email, Address) VALUES
('0193000001','cust1@mail.com','Dhaka'),
('0193000002','cust2@mail.com','Sylhet'),
('0193000003','cust3@mail.com','Khulna'),
('0193000004','cust4@mail.com','Chattogram'),
('0193000005','cust5@mail.com','Dhaka'),
('0193000006','cust6@mail.com','Rajshahi'),
('0193000007','cust7@mail.com','Sylhet'),
('0193000008','cust8@mail.com','Dhaka'),
('0193000009','cust9@mail.com','Rangpur'),
('0193000010','cust10@mail.com','Barishal'),
('0193000011','cust11@mail.com','Mymensingh'),
('0193000012','cust12@mail.com','Khulna'),
('0193000013','cust13@mail.com','Dhaka'),
('0193000014','cust14@mail.com','Chattogram'),
('0193000015','cust15@mail.com','Sylhet'),
('0193000016','cust16@mail.com','Rajshahi'),
('0193000017','cust17@mail.com','Dhaka'),
('0193000018','cust18@mail.com','Barishal'),
('0193000019','cust19@mail.com','Rangpur'),
('0193000020','cust20@mail.com','Dhaka');
GO


INSERT INTO Medicines (Name, Category, SupplierID, UnitPrice, RecoderLevel, ExpiryDate) VALUES
('Paracetamol','Painkiller',1,5.00,10,'2025-12-31'),
('Amoxicillin','Antibiotic',2,12.50,15,'2026-05-20'),
('Cough Syrup','Cold & Flu',3,8.75,12,'2024-11-15'),
('Ibuprofen','Painkiller',4,10.00,20,'2025-06-30'),
('Vitamin C','Supplement',5,7.00,10,'2026-01-10'),
('Azithromycin','Antibiotic',6,18.50,15,'2025-09-01'),
('Insulin','Diabetes',7,25.00,8,'2024-12-25'),
('Aspirin','Painkiller',8,6.00,12,'2025-04-01'),
('Antacid','Stomach',9,4.50,10,'2026-07-01'),
('Multivitamin','Supplement',10,15.00,10,'2025-10-10'),
('Metformin','Diabetes',11,20.00,12,'2026-02-14'),
('Cetrizine','Allergy',12,3.50,8,'2025-08-18'),
('Losartan','Blood Pressure',13,22.00,10,'2026-09-09'),
('Omeprazole','Stomach',14,12.00,15,'2025-11-11'),
('Dextromethorphan','Cough',15,9.00,10,'2026-06-06'),
('Hydroxychloroquine','Malaria',16,30.00,10,'2025-12-12'),
('Atorvastatin','Cholesterol',17,28.00,12,'2026-04-04'),
('Warfarin','Blood Thinner',18,35.00,10,'2025-03-03'),
('Clopidogrel','Blood Thinner',19,32.00,10,'2026-08-08'),
('Salbutamol','Asthma',20,18.00,12,'2025-05-05');
GO


INSERT INTO Inventory (MedicineID, Quantity, LastUpdated) VALUES
(1,100,'2025-01-01'),
(2,80,'2025-01-01'),
(3,120,'2025-01-01'),
(4,75,'2025-01-01'),
(5,150,'2025-01-01'),
(6,60,'2025-01-01'),
(7,40,'2025-01-01'),
(8,200,'2025-01-01'),
(9,110,'2025-01-01'),
(10,90,'2025-01-01'),
(11,70,'2025-01-01'),
(12,300,'2025-01-01'),
(13,55,'2025-01-01'),
(14,65,'2025-01-01'),
(15,85,'2025-01-01'),
(16,25,'2025-01-01'),
(17,45,'2025-01-01'),
(18,30,'2025-01-01'),
(19,50,'2025-01-01'),
(20,95,'2025-01-01');
GO


INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, TotalAmount, Payment) VALUES
(1,1,'2025-01-10',50.00,'Cash'),
(2,2,'2025-01-11',75.00,'Card'),
(3,3,'2025-01-12',40.00,'Insurance'),
(4,4,'2025-01-13',100.00,'Cash'),
(5,5,'2025-01-14',65.00,'Card'),
(6,6,'2025-01-15',120.00,'Cash'),
(7,7,'2025-01-16',90.00,'Insurance'),
(8,8,'2025-01-17',55.00,'Cash'),
(9,9,'2025-01-18',30.00,'Card'),
(10,10,'2025-01-19',45.00,'Cash'),
(11,11,'2025-01-20',80.00,'Insurance'),
(12,12,'2025-01-21',25.00,'Cash'),
(13,13,'2025-01-22',95.00,'Card'),
(14,14,'2025-01-23',110.00,'Cash'),
(15,15,'2025-01-24',70.00,'Insurance'),
(16,16,'2025-01-25',60.00,'Cash'),
(17,17,'2025-01-26',85.00,'Card'),
(18,18,'2025-01-27',130.00,'Cash'),
(19,19,'2025-01-28',45.00,'Insurance'),
(20,20,'2025-01-29',100.00,'Card');
GO


INSERT INTO OrderDetails (OrderID, MedicineID, Quanity, Unitprice) VALUES
(1,1,5,5.00),
(2,2,6,12.50),
(3,3,4,8.75),
(4,4,10,10.00),
(5,5,5,7.00),
(6,6,4,18.50),
(7,7,3,25.00),
(8,8,6,6.00),
(9,9,5,4.50),
(10,10,3,15.00),
(11,11,4,20.00),
(12,12,6,3.50),
(13,13,5,22.00),
(14,14,4,12.00),
(15,15,3,9.00),
(16,16,2,30.00),
(17,17,3,28.00),
(18,18,2,35.00),
(19,19,4,32.00),
(20,20,5,18.00);
GO