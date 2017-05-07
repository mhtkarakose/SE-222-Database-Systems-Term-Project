use OrderingSystemDb;

EXECUTE sp_executesql N'
	CREATE PROCEDURE [Customer_ReadAll]
	AS
	BEGIN 
		SET NOCOUNT ON;
		SELECT * FROM Customer
	END'

EXECUTE sp_executesql N'
	CREATE PROCEDURE Customer_ReadById
		@Id int  
		AS
		BEGIN
			  SET NOCOUNT ON;
			  SELECT * from Customer
			  WHERE CustomerId = @Id
		END'
		
		
EXECUTE sp_executesql N'
	CREATE PROCEDURE Customer_Add
		@Id int ,
		@Email varchar(50),
		@CustomerPass varchar(20),
		@Name varchar(20),
		@SecondName varchar(20),
		@Surname varchar(20)
		AS
		BEGIN
			SET NOCOUNT ON;
			IF EXISTS (SELECT * FROM dbo.Customer WHERE
				CustomerId != @Id)
					INSERT INTO dbo.Customer VALUES
						  (@Id,
						  @Email,
						  @CustomerPass,
						  @Name,
						  @SecondName,
						  @Surname)			
		END'
		
		
		
		exec Customer_Add 3,'ozqe@gmail.com','dsfewfr','Ozge','','Aybars'
		
		EXECUTE sp_executesql N'
	CREATE PROCEDURE Customer_Add_Address
		@Id int ,
		@CustomerId int,
		@AddressName varchar(20),
		@AddressDescription varchar(50)
		AS
		BEGIN
			SET NOCOUNT ON;
			IF EXISTS (SELECT * FROM dbo.CustomerAddress WHERE
				AddressId != @Id)
					INSERT INTO dbo.CustomerAddress VALUES
						  (@Id,
						  @CustomerId,
						  @AddressName,
						  @AddressDescription
						  )			
		END'
		
		exec Customer_Add_Address 3,3,'Ozge Ev','Yasar Uni Kutuphane 3kat'
		

EXECUTE sp_executesql N'
	CREATE PROCEDURE [Customer_ReadAll_Address]
	AS
	BEGIN 
		SET NOCOUNT ON;
		SELECT * FROM CustomerAddress
	END'

EXECUTE sp_executesql N'
	CREATE PROCEDURE Customer_ReadById_Address
		@Id int  
		AS
		BEGIN
			  SET NOCOUNT ON;
			  SELECT * from CustomerAddress
			  WHERE CustomerId = @Id
		END'

EXECUTE sp_executesql N'
	CREATE PROCEDURE Customer_Bill
		@Id int  
		AS
		BEGIN
			  SET NOCOUNT ON;
			  SELECT 
				tblOrder.OrderId,  
				tblOrder.OrderDate ,
				Customer.CustomerId,
				Customer.Name,
				Customer.Surname,
				CustomerAddress.AddressDescription,
				tblOrder.TotalPrice
					FROM tblOrder
					INNER JOIN Customer  ON tblOrder.CustomerId = Customer.CustomerId
					INNER JOIN CustomerAddress ON Customer.CustomerId = CustomerAddress.CustomerId
					INNER JOIN CustomerContact ON Customer.CustomerId = CustomerContact.CustomerId
					WHERE tblOrder.CustomerId = @Id
	END'

	EXECUTE sp_executesql N'
	CREATE PROCEDURE Product_Add
		@ProductId int ,
		@CategoryId int,
		@ProductName varchar(20),
		@ProductDescription varchar(20),
		@ProductPrice int,
		@ProductCalorie int,
		@Stock int
		AS
		BEGIN
			SET NOCOUNT ON;
			IF EXISTS (SELECT * FROM dbo.Product WHERE
				ProductId != @ProductId)
					INSERT INTO dbo.Product VALUES
						  (@ProductId,
						  @CategoryId,
						  @ProductName,
						  @ProductDescription,
						  @ProductPrice,
						  @ProductCalorie,
						  @Stock)			
		END'