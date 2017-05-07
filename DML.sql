use OrderingSystemDb;

INSERT INTO dbo.Customer
	(CustomerId,EMail,CustomerPass,Name,SecondName,Surname) 
	VALUES 
	(1,'mht@gmail.com','1234','Mehmet','','KARAKÖSE')
	
INSERT INTO dbo.Customer
	VALUES
	(2,'gazi@gamil.com','4321','Yağız','Ismail','GAZİBABA')
	
	
INSERT INTO dbo.CustomerAddress 
	VALUES 
	(1,1,'Evim','Bornova Uslu loft')

INSERT INTO dbo.CustomerAddress
	VALUES 
	(2,2,'Malikane','Bostanlı da ')
	
INSERT INTO dbo.CustomerContact
	VALUES
	(1,1,'53254656')
INSERT INTO dbo.CustomerContact
	VALUES
	(2,1,'545456896')
	
INSERT INTO dbo.CustomerContact
	VALUES
	(3,2,'5656565')
	
INSERT INTO Delivery_Boy
	VALUES 
	(1,'Ahmet','Avni','5338851')

INSERT INTO Delivery_Boy
	VALUES 
	(2,'Selim','Tomas','5689331')

INSERT INTO Delivery_Boy
	VALUES 
	(3,'Üzüm','Elma','5639988')

INSERT INTO Location
	VALUES 
	(1,'BORNOVA')
INSERT INTO Location
	VALUES
	(2,'BAYRAKLI')
INSERT INTO Location
	VALUES 
	(3,'YEŞİLOVA')
INSERT INTO DeliveryBoy_Location
	VALUES 
	(1,1,1)
INSERT INTO DeliveryBoy_Location
	VALUES 
	(2,1,2)
INSERT INTO DeliveryBoy_Location
	VALUES 
	(3,2,3)
INSERT INTO dbo.Category
	VALUES 
	(1,'PIZZA','HER TURLU PIZZA VAR')

INSERT INTO dbo.Product
	VALUES
	(1,1,'OTLU PIZZA','BOL YESILLIKLI PIZZA',22.00,10,50)
	
INSERT INTO dbo.Product
	VALUES 
	(2,1,'SUCUKLU PIZZA','PINAR SUCUK',30,15,25)
INSERT INTO dbo.Product
	VALUES 
	(3,1,'SUCUKLU KASARLI PIZZA','PINAR SUCUK VE KASARI VAR',32,18,30)
	
INSERT INTO dbo.tblOrder
	(CustomerId,AddressId,DeliveryBoyId) 
	VALUES
	(1,1,1)
	

INSERT INTO dbo.Product_Order
	(ProductId,OrderId,Quantity)
	VALUES
	(1,1,2)		
		
INSERT INTO dbo.tblOrder
	(CustomerId,AddressId,DeliveryBoyId) 
	VALUES
	(2,1,1)
	
INSERT INTO dbo.Product_Order
	(ProductId,OrderId,Quantity)
	VALUES
	(1,2,2)

	INSERT INTO dbo.Product_Order
	(ProductId,OrderId,Quantity)
	VALUES
	(2,2,2)