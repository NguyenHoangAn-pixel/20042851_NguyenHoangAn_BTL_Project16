--Create table for customer accounts
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100),
    PhoneNumber NVARCHAR(15) UNIQUE,
    Password NVARCHAR(100),
    Address NVARCHAR(255)
);

-- Create table for admin accounts
CREATE TABLE Admins (
    AdminID INT PRIMARY KEY IDENTITY(1,1),
    PhoneNumber NVARCHAR(15) UNIQUE,
    Password NVARCHAR(100)
);

-- Insert admin account
INSERT INTO Admins (PhoneNumber, Password) VALUES ('0984125346', '123123');
CREATE TABLE DoChoiTreEm (
    maDoChoi VARCHAR(50) PRIMARY KEY,
    tenDoChoi VARCHAR(100) NOT NULL,
    gia INT NOT NULL,
    tinhTrang VARCHAR(50),
    loaiDoChoi VARCHAR(50),
    anh VARBINARY(MAX)
);