create database SaleOrderQuiz;

use SaleOrderQuiz;

create table Customer (
	CustomerID INT not null primary key auto_increment,
	CustomerFirstName VARCHAR(50) not null,
	CustomerLastName VARCHAR(50) not null,
	CustomerAddress VARCHAR(50) not null,
	CustomerCity VARCHAR(50) not null,
	CustomerPostCode CHAR(4),
	CustomerPhoneNumber CHAR(12)
);

create table Inventory (
	InventoryID tinyint not null primary key auto_increment,
	InventoryName VARCHAR(50) not null,
	InventoryDescription VARCHAR(255)
);

create table Employee (
	EmployeeID tinyint not null primary key auto_increment,
	EmployeeFirstName VARCHAR(50) not null,
	EmployeeLastName VARCHAR(50) not null,
	EmployeeExtension CHAR(4)
);

create table Sale (
	SaleID tinyint primary key auto_increment,
	CustomerID int not null,
	InventoryID tinyint not null,
	EmployeeID tinyint not null,
	SaleDate DATE not null,
	SaleQuantity int not null,
	SaleUnitPrice smallint not null,
	foreign key (CustomerID) references customer(CustomerID) on update cascade on delete cascade,
	foreign key (InventoryID) references Inventory(InventoryID) on update cascade on delete cascade,
	foreign key (EmployeeID) references Employee(EmployeeID) on update cascade on delete cascade
)

insert into customer (CustomerFirstName, CustomerLastName, CustomerAddress, CustomerCity, CustomerPostCode, CustomerPhoneNumber)
values ("Amin", "Fahimi", "63 Hay Bougafer", "Fes", "4578", "0654879853"),
("Fatima", "Rabih", "23A", "Rabat", "1569", "0668547893"),
("Omar", "Karim", "13, Saaida 1", "Safi", "5968", "0698742136");

insert into employee (EmployeeFirstName, EmployeeLastName, EmployeeExtension)
values ("Anass", "Boutaib", "0654"),
("Athman", "Chakir", "2369"),
("Asma", "Bichara", "5698");


insert into Inventory (InventoryName, InventoryDescription)
values ("Central-inv", "The main inventory"),
("Additional-inv", "This is the secondary inventory"),
("New-inv", "Newly created inventory");


insert into sale (CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
values (1, 1, 1, '2024-12-12', 3, 133),
(2, 1, 2, "2024-12-03", 4, 152),
(2, 2, 3, "2024-12-11", 1, 206),
(3, 3, 3, "2024-11-09", 2, 75),
(3, 2, 1, "2024-11-06", 2, 255);


select * from customer;
select *, saleQuantity * SaleUnitPrice as total from sale order by total desc; 

select customerFirstName, customerLastName, sum(saleQuantity * SaleUnitPrice) as total from sale join customer on sale.customerID = customer.customerID group by sale.customerID;

alter table customer add CustomerEmail VARCHAR(100);

update customer set customerEmail = "amin.fahimi@gmail.com" where customerID = 1;


insert into customer (CustomerFirstName, CustomerLastName, CustomerAddress, CustomerCity, CustomerPostCode, CustomerPhoneNumber)
values ("David", "Smith", "41 Kinta", "New York", "4589", "4587958452");

delete from customer where CustomerCity = "New York";

select * from sale where date_add(SaleDate, Interval 30 day) > current_timestamp();

