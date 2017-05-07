CREATE DATABASE OrderingSystemDb; 

CREATE TABLE Customer (
	CustomerId  integer  PRIMARY KEY,
	EMail varchar(50) NOT NULL,
	CustomerPass varchar(20) NOT NULL,
	Name varchar(20) NOT NULL,
	SecondName varchar(20),
	Surname varchar(30) NOT NULL
	);
	
CREATE TABLE CustomerAddress(
	AddressId integer PRIMARY KEY,
	CustomerId integer,
	AddressName varchar(100) NOT NULL,
	AddressDescription varchar(150) NOT NULL,
	CONSTRAINT fkCustomerId FOREIGN KEY (CustomerId)  REFERENCES Customer(CustomerId)
																ON UPDATE CASCADE
																ON DELETE CASCADE
																)
CREATE TABLE CustomerContact(
	ContactId integer NOT NULL PRIMARY KEY,
	CustomerId integer NOT NULL,
	PhoneNumber varchar(15) NOT NULL,
	CONSTRAINT fk_CustomerId_Contact FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
																ON UPDATE CASCADE
																ON DELETE CASCADE
																)																
CREATE TABLE Category(
	CategoryId int NOT NULL PRIMARY KEY,
	CategoryName varchar(20) NOT NULL,
	CategoryDescription varchar(50) NOT NULL,
	)
	
CREATE TABLE Product(
	ProductId int NOT NULL PRIMARY KEY,
	CategoryId int NOT NULL,
	ProductName varchar(50) NOT NULL,
	ProductDescription varchar(50) NOT NULL,
	ProductPrice int NOT NULL,
	ProductCalorie int NOT NULL,
	CONSTRAINT fk_Product_Category FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId)
																		ON UPDATE CASCADE
																		ON DELETE CASCADE
																		)																		
CREATE TABLE Delivery_Boy(
	DeliveryBoyId int NOT NULL PRIMARY KEY,
	DeliveryBoyName varchar(50) NOT NULL,
	DeliveryBoySurname varchar(50) NOT NULL,
	DeliveryBoyTel varchar(15) NOT NULL
	)

CREATE TABLE Location(
	LocationId int NOT NULL PRIMARY KEY,
	Location_Name varchar(50) NOT NULL
	)
		
CREATE TABLE DeliveryBoy_Location(
	DeliveryBoyLocation int NOT NULL PRIMARY KEY,
	LocationId int NOT NULL,
	DeliveryBoyId int NOT NULL,
	CONSTRAINT fk_DeliveryBoy_Location_LocationId FOREIGN KEY (LocationId) REFERENCES Location(LocationID)
																					ON UPDATE CASCADE
																					ON DELETE CASCADE,
	CONSTRAINT fk_DeliveryBoy_Location_Delivery_Boy FOREIGN KEY (DeliveryBoyId) REFERENCES Delivery_Boy(DeliveryBoyId)
																							ON UPDATE CASCADE
																							ON DELETE CASCADE
																							)																				
ALTER TABLE Product ADD 
	Stock int NOT NULL;

CREATE TABLE tblOrder(
	OrderId int IDENTITY(1,1) PRIMARY KEY ,
	OrderDate date,
	CustomerId int NOT NULL,
	AddressId int NOT NULL,
	DeliveryBoyId int NOT NULL

	CONSTRAINT fk_Order_CustomerID FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerID)
																			ON UPDATE CASCADE
																			ON DELETE CASCADE,
	CONSTRAINT fk_Order_AddressId FOREIGN KEY (AddressId) REFERENCES CustomerAddress(AddressId),
																			
	CONSTRAINT fk_Order_DeliveryBoyId FOREIGN KEY (DeliveryBoyId) REFERENCES Delivery_Boy(DeliveryBoyId)
																							ON UPDATE CASCADE
																							ON DELETE CASCADE																			
																							)

CREATE TABLE Product_Order(
	ProductOrderId int IDENTITY(1,1) PRIMARY KEY ,
	ProductId int NOT NULL,
	OrderId int NOT NULL
	
	CONSTRAINT fk_Product_Order_ProductId FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
																			ON UPDATE CASCADE
																			ON DELETE CASCADE,
	CONSTRAINT fk_Product_Order_OrderId FOREIGN KEY (OrderId) REFERENCES tblOrder(OrderId)
																			ON UPDATE CASCADE
																			ON DELETE CASCADE
																			)
																	
ALTER TABLE Product_Order ADD 
	Quantity int NOT NULL;
	
	
		
ALTER TABLE tblOrder ADD CONSTRAINT  
	 OrderDate_CONSTRAINT DEFAULT getdate() FOR OrderDate
	 
ALTER TABLE tblOrder ADD 
	TotalPrice int ; 
	Price default value added in design 
	
ALTER TABLE Customer
		ADD UNIQUE (EMail)
			
ALTER TABLE dbo.Category
		ADD UNIQUE (CategoryDescription)

ALTER TABLE dbo.Location
		ADD UNIQUE (Location_Name)