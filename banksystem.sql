---- Tạo cơ sở dữ liệu BankSystem
--CREATE DATABASE BankSystem;
--GO
--USE BankSystem;
--GO

-- Tạo bảng Customer với cột hỗ trợ tiếng Việt
CREATE TABLE Customer (
    Id VARCHAR(255) NOT NULL PRIMARY KEY,
    Name NVARCHAR(255),
    Phone VARCHAR(255),
    Email NVARCHAR(255),
    HouseNo NVARCHAR(255),
    City NVARCHAR(255),
    Pin NVARCHAR(255)
);

-- Tạo bảng Employee
CREATE TABLE Employee (
    Id VARCHAR(255) NOT NULL PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role NVARCHAR(255) NOT NULL
);

-- Tạo bảng Branch
CREATE TABLE Branch (
    Id VARCHAR(255) NOT NULL PRIMARY KEY,
    Name NVARCHAR(255),
    HouseNo NVARCHAR(255),
    City NVARCHAR(255)
);

-- Tạo bảng Account
CREATE TABLE Account (
    Id INT NOT NULL PRIMARY KEY,
    CustomerId VARCHAR(255),
    DateOpened DATE,
    Balance FLOAT,
    FOREIGN KEY (CustomerId) REFERENCES Customer(Id) ON DELETE CASCADE
);

-- Tạo bảng BankTransaction
CREATE TABLE BankTransaction (
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Type NVARCHAR(50) NOT NULL,
    AccountFromId INT,
    AccountToId INT,
    Amount FLOAT NOT NULL,
    DateOfTrans DATETIME NOT NULL DEFAULT GETDATE(),
    EmployeeId VARCHAR(255),
    BranchId VARCHAR(255),
    Description NVARCHAR(500),
    Pin NVARCHAR(255),  -- Liên kết Pin từ bảng Customer
    FOREIGN KEY (AccountFromId) REFERENCES Account(Id) ON DELETE CASCADE,
    FOREIGN KEY (AccountToId) REFERENCES Account(Id),
    FOREIGN KEY (EmployeeId) REFERENCES Employee(Id),
    FOREIGN KEY (BranchId) REFERENCES Branch(Id),
);

INSERT INTO Customer (Id, Name, Phone, Email, HouseNo, City, Pin) VALUES
('C001', N'Trần Nguyễn Gia Long', '0901234567', 'trangnuyengialong@example.com', N'123', N'Hồ Chí Minh', '700000'),
('C002', N'Nguyễn Gia Hưng', '0912345678', 'nguyengiahung@example.com', N'456', N'Hà Nội', '100000'),
('C003', N'Trần Gia Huy', '0923456789', 'trangiahuy@example.com', N'789', N'Đà Nẵng', '500000'),
('C004', N'Phạm Thị Hoa', '0934567890', 'phamthihoa@example.com', N'321', N'Cần Thơ', '900000'),
('C005', N'Hoàng Văn Em', '0945678901', 'hoangvanem@example.com', N'654', N'Hải Phòng', '400000');

INSERT INTO Employee (Id, Name, Password, Role) VALUES
('E001', N'Nguyễn Văn Phúc', CONVERT(VARCHAR(128), HASHBYTES('SHA2_256', '123'), 2), 'Admin'),
('E002', N'Trần Thị Loan', CONVERT(VARCHAR(128), HASHBYTES('SHA2_256', '456'), 2), 'User'),
('E003', N'Lê Văn Huỳnh', CONVERT(VARCHAR(128), HASHBYTES('SHA2_256', '789'), 2), 'Admin'),
('E004', N'Phạm Thị Yến', CONVERT(VARCHAR(128), HASHBYTES('SHA2_256', '101112'), 2), 'User'),
('E005', N'Hoàng Văn Đông', CONVERT(VARCHAR(128), HASHBYTES('SHA2_256', '131415'), 2), 'Admin');

INSERT INTO Branch (Id, Name, HouseNo, City) VALUES
('B001', N'Chi nhánh 1', N'10', N'Hồ Chí Minh'),
('B002', N'Chi nhánh 2', N'20', N'Hà Nội'),
('B003', N'Chi nhánh 3', N'30', N'Đà Nẵng'),
('B004', N'Chi nhánh 4', N'40', N'Cần Thơ'),
('B005', N'Chi nhánh 5', N'50', N'Hải Phòng');

INSERT INTO Account (Id, CustomerId, DateOpened, Balance) VALUES
(1, 'C001', '2024-01-01', 1000.0),
(2, 'C002', '2024-01-02', 2000.0),
(3, 'C003', '2024-01-03', 3000.0),
(4, 'C004', '2024-01-04', 4000.0),
(5, 'C005', '2024-01-05', 5000.0);

-- Kiểm tra các Id hiện có trong bảng Account
SELECT * FROM BankTransaction;

-- Cập nhật lại các lệnh INSERT trong BankTransaction
INSERT INTO BankTransaction (Type, AccountFromId, Amount, DateOfTrans, EmployeeId, BranchId, Description)
VALUES ('Deposit', 1, 5000, GETDATE(), 'E001', 'B001', 'Nạp tiền vào tài khoản 1');

INSERT INTO BankTransaction (Type, AccountFromId, Amount, DateOfTrans, EmployeeId, BranchId, Description)
VALUES ('Withdraw', 1, 3000, GETDATE(), 'E001', 'B001', 'Rút tiền từ tài khoản 1');

INSERT INTO BankTransaction (Type, AccountFromId, AccountToId, Amount, DateOfTrans, EmployeeId, BranchId, Description)
VALUES ('Transfer', 1, 2, 2000, GETDATE(), 'E001', 'B001', 'Chuyển tiền từ tài khoản 1 đến tài khoản 2');



--CREATE TABLE Transaction_Log (
--    Id INT PRIMARY KEY,
--    TransactionId INT,
--    Description NVARCHAR(500),
--    DateOfLog DATE,
--    FOREIGN KEY (TransactionId) REFERENCES BankTransaction(Id)
--);

--INSERT INTO Transaction_Log (Id, TransactionId, Description, DateOfLog)
--VALUES 
--(1, 1, 'Chuyển tiền từ tài khoản 1001 đến tài khoản 1002', '2024-10-01'),
--(2, 2, 'Nạp tiền vào tài khoản 1003', '2024-10-02'),
--(3, 3, 'Rút tiền từ tài khoản 1004', '2024-10-03'),
--(4, 4, 'Chuyển tiền từ tài khoản 1005 đến tài khoản 1006', '2024-10-04'),
--(5, 5, 'Nạp tiền vào tài khoản 1007', '2024-10-05');


---- Tạo bảng Bank_Transaction
--CREATE TABLE Bank_Transaction (
--    Id INT NOT NULL PRIMARY KEY,
--    FromAccountId INT,
--    BranchId VARCHAR(255),
--    DateOfTrans DATE,
--    Amount FLOAT,
--    Pin VARCHAR(255),
--    ToAccountId INT,
--    EmployeeId VARCHAR(255),
--    FOREIGN KEY (FromAccountId) REFERENCES Account(Id) ON DELETE CASCADE,
--    FOREIGN KEY (ToAccountId) REFERENCES Account(Id) ON DELETE NO ACTION,
--    FOREIGN KEY (EmployeeId) REFERENCES Employee(Id),
--    FOREIGN KEY (BranchId) REFERENCES Branch(Id)
--);

--INSERT INTO Bank_Transaction (Id, FromAccountId, BranchId, DateOfTrans, Amount, Pin, ToAccountId, EmployeeId) VALUES
--(1, 1, 'B001', '2024-10-01', 100.0, '1234', 2, 'E001'),
--(2, 2, 'B002', '2024-10-02', 200.0, '4567', 3, 'E002'),
--(3, 3, 'B003', '2024-10-03', 300.0, '7890', 4, 'E003'),
--(4, 4, 'B004', '2024-10-04', 400.0, '3210', 5, 'E004'),
--(5, 5, 'B005', '2024-10-05', 500.0, '6543', 1, 'E005');
