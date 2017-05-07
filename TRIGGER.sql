use OrderingSystemDb;
			
GO
CREATE TRIGGER Stock_Takip
ON Product_Order
AFTER INSERT
AS
	DECLARE @productId int,
	 @quantity int
	if exists(select * from inserted)
	begin
	select @productId= ProductId , @quantity= Quantity from inserted
	update Product set Stock-=@quantity where ProductId = @productId
	end


	

GO
CREATE TRIGGER TotalPrice
ON Product_Order
AFTER INSERT
AS
	DECLARE @productId int,
		@price int ,
		@quantity int,
		@orderId int
		if exists(select * from inserted)
		begin
		select @productId = ProductId, 
				@quantity= Quantity,
				@orderId = OrderId
				from inserted
		select @price = ProductPrice from Product WHERE ProductId = @productId
		update tblOrder set TotalPrice += @quantity * @price WHERE OrderId = @orderId
		end