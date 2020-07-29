drop database if exists HotelReservation;
create database HotelReservation;
use HotelReservation;

create table AmenityType (
	AmenityId int primary key auto_increment,
	`Name` varchar(12) not null,
    Price decimal(4,2) not null
);

create table RoomType (
	`Type` varchar(6) primary key,
    BaseOccupancy int not null,
    MaxOccupancy int not null,
    BasePrice decimal(5,2) not null,
    AdditionalAdultCost decimal (4,2) -- single can't have additional cost
);

create table Room (
	RoomNumber int primary key,
    `Type` varchar(6) not null,
    IsAccessible bool not null, -- 0 is false
    
    foreign key (`Type`)
		references RoomType (`Type`)
);

create table RoomAmenity (
	RoomNumber int not null,
    AmenityId int not null,
    
    primary key RoomAmenityId (RoomNumber, AmenityId),
    foreign key (RoomNumber)
		references Room (RoomNumber),
	foreign key (AmenityId)
		references AmenityType (AmenityId)
);

create table Guest (
	GuestId int primary key auto_increment,
    FirstName varchar(30) not null,
    LastName varchar(30) not null,
    StreetAddress varchar(40) not null,
    City varchar(30) not null,
    StateAbv char(2) not null,
    ZipCode char(5) not null,
    Phone varchar(15) not null
);

create table Reservation (
	ReservationId int primary key auto_increment,
    GuestId int not null,
    StartDate date not null,
    EndDate date not null,
    
    foreign key (GuestId)
		references Guest (GuestId)
);

create table RoomReservation (
	ReservationId int not null,
    RoomNumber int not null,
    NumOfAdults int not null,
    NumOfChilds int,                 -- may have no children in reservation
    TotalCost decimal(6,2) not null,
    
    primary key RoomReservationId (ReservationId, RoomNumber),
    foreign key (ReservationId)
		references Reservation (ReservationId),
	foreign key (RoomNumber)
		references Room (RoomNumber)
);
