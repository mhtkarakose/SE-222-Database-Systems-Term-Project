Welcome !
===================


Hey! This document is my term proejct. Please be sure to inform us of any errors you found in the codes.

Project Aim
-------
Project aim is creating affordable online ordering system for small restaurant SMEs.
Project name is Online Ordering System for Restaurants.


----------


Documents
-------------

Conceptual Diagram

![Conceptual Diagram](https://i.hizliresim.com/V0Jv7q.png)

Logical Model

![Logical Model](https://i.hizliresim.com/ZZy7PA.png)


#### <i class="icon-file"></i> Create a database

    CREATE DATABASE OrderingSystemDb; 

The necessary codes have been added.    
#### <i class="icon-pencil"></i> Procedures

* Customer_ReadAll
All customers print on the screen. 
How does it work?

   <code> exec Customer_ReadAll; </code>
   
* Customer_ReadById
Writes the selected customer information to the screen.
How does it work?

	<code> exec Customer_ReadById [Enter the int DustomerId]; </code>

* Customer_Add
Add customer :)
How does it work?

	<code> exec Customer_Add(@Id,
						  @Email,
						  @CustomerPass,
						  @Name,
						  @SecondName, 
						  @Surname) </code>

* Customer_Add_Address
The address information of the customer is entered in the address table.
How does it work?

	<code> exec Customer_Add_Address(@Id,
						  @CustomerId,
						  @AddressName,
						  @AddressDescription
						  ) </code>

* Customer_ReadAll_Address
All customer addresses on the screen.
How does it work?

	<code> exec Customer_ReadAll_Address;</code>
	
* Customer_ReadById_Address
The selected customer addresses are displayed on the screen.
How does it work?

	<code> exec Customer_ReadById_Address [Enter the int CustomerId];</code>

* Customer_Bill
The invoice belongs to the selected customer.
How does it work?

	<code> exec Customer_Bill[Enter the int CustomerId];</code>
	
* Product_Add
Adding products to the system.
How does it work?

	<code> exec Product_Add(@ProductId,
						  @CategoryId,
						  @ProductName,
						  @ProductDescription,
						  @ProductPrice,
						  @ProductCalorie,
						  @Stock)
	;</code>
 
#### <i class="icon-pencil"></i> Triggers

* Stock_Takip

Stocks for each product ordered are replaced.

* TotalPrice

It subtracts the total price of the ordered product to the customer bill.

#### <i class="icon-pencil"></i> Team

Mehmet KARAKÖSE
Yağız Ismail GAZIBABA




