CREATE TABLE Account (
Id INT IDENTITY PRIMARY KEY,
UserName NVARCHAR(20) UNIQUE,
Password NVARCHAR (30),
Email NVARCHAR(30),
FirstName NVARCHAR(20),
LastName NVARCHAR(20),
AccountType NVARCHAR(10)
);


CREATE PROCEDURE sp_Account_Login_Check
@Username NVARCHAR(20),
@Password NVARCHAR(30),
@res BIT OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @count INT;
  -- Kiến tra sự tồn tại của username và password trong bảng Account
  SELECT @count = COUNT(*) FROM Account WHERE UserName = @Username AND Password = @Password;
  -- Nếu tòn tại, @count > 0, đặt @res = 1, ngược lại đặt @res = 0
  IF @count > 0
    SET @res = 1;
  ELSE
    SET @res = 0;
END;