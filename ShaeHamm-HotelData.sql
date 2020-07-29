use HotelReservation;

insert into AmenityType (`Name`, Price)
values
	('Jacuzzi', 25),
	('Microwave', 0),
    ('Refrigerator', 0),
    ('Oven', 0);

insert into RoomType (`Type`, BaseOccupancy, MaxOccupancy, BasePrice, AdditionalAdultCost)
values
	('Double', 2, 4, 174.99, 10),
    ('Single', 2, 2, 149.99, 0),
    ('Suite', 3, 8, 399.99, 20);

insert into Room (RoomNumber, `Type`, IsAccessible)
values
	(201, 'Double', 0),
    (202, 'Double', 1),
    (203, 'Double', 0),
    (204, 'Double', 1),
    (205, 'Single', 0),
    (206, 'Single', 1),
    (207, 'Single', 0),
    (208, 'Single', 1),
    (301, 'Double', 0),
    (302, 'Double', 1),
    (303, 'Double', 0),
    (304, 'Double', 1),
    (305, 'Single', 0),
    (306, 'Single', 1),
    (307, 'Single', 0),
    (308, 'Single', 1),
    (401, 'Suite', 1),
    (402, 'Suite', 1);
	
insert into RoomAmenity (RoomNumber, AmenityId)
values
	(201, 1),
    (203, 1),
    (205, 1),
    (207, 1),
    (301, 1),
    (303, 1),
    (305, 1),
    (307, 1),
    (201, 2),
    (203, 2),
    (205, 2),
    (206, 2),
    (207, 2),
    (208, 2),
    (301, 2),
    (303, 2),
    (305, 2),
    (306, 2),
    (307, 2),
    (308, 2),
    (401, 2),
    (402, 2),
    (202, 3),
    (204, 3),
    (205, 3),
    (206, 3),
    (207, 3),
    (208, 3),
    (302, 3),
    (304, 3),
    (305, 3),
    (306, 3),
    (307, 3),
    (308, 3),
    (401, 3),
    (402, 3),
    (401, 4),
    (402, 4);

insert into Guest (FirstName, LastName, StreetAddress, City, StateAbv, ZipCode, Phone)
values
	('Shae', 'Hamm', '7808 Mocha Blvd', 'Sedona', 'AZ', '34121', '(212) 334-7808'),
    ('Mack', 'Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', '51501', '(291) 553-0508'),
    ('Bettyann', 'Seery', '750 Wintergreen Dr.', 'Wasilla', 'AK', '99654', '(478) 277-9632'),
    ('Duane', 'Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '(308) 494-0198'),
    ('Karie', 'Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096', '(214) 730-0298'),
    ('Aurore', 'Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', '48601', '(377) 507-0974'),
    ('Zachery', 'Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', '80003', '(814) 485-2615'),
    ('Jeremiah', 'Pendergrass', '70 Oakwood St.', 'Zion', 'IL', '60099', '(279) 491-0960'),
    ('Walter', 'Holaway', '7556 Arrowhead St.', 'Cumberland', 'RI', '02864', '(446) 396-6785'),
    ('Wilfred', 'Vise', '77 West Surrey Street', 'Oswego', 'NY', '13126', '(834) 727-1001'),
    ('Maritza', 'Tilton', '939 Linda Rd.', 'Burke', 'VA', '22015', '(446) 351-6860'),
    ('Joleen', 'Tison', '87 Queen St.', 'Drexel Hill', 'PA', '19026', '(231) 893-2755');
    

insert into Reservation (GuestId, StartDate, EndDate)
values
	(2, '2023-02-02', '2023-02-04'),
    (3, '2023-02-05', '2023-02-10'),
    (4, '2023-02-22', '2023-02-24'),
    (5, '2023-03-06', '2023-03-07'),
    (1, '2023-03-17', '2023-03-20'),
    (6, '2023-03-18', '2023-03-23'),
    (7, '2023-03-29', '2023-03-31'),
    (8, '2023-03-31', '2023-04-05'),
    (9, '2023-04-09', '2023-04-13'),
    (10, '2023-04-23', '2023-04-24'),
    (11, '2023-05-30', '2023-06-02'),
    (12, '2023-06-10', '2023-06-14'),
    (6, '2023-06-17', '2023-06-18'),
    (1, '2023-06-28', '2023-07-02'),
    (9, '2023-07-13', '2023-07-14'),
    (10, '2023-07-18', '2023-07-21'),
    (3, '2023-07-28', '2023-07-29'),
    (3, '2023-08-30', '2023-09-01'),
    (2, '2023-09-16', '2023-09-17'),
    (5, '2023-09-13', '2023-09-15'),
    (4, '2023-11-22', '2023-11-25'),
    (2, '2023-11-22', '2023-11-25'),
    (11, '2023-12-24', '2023-12-28');

insert into RoomReservation (ReservationId, RoomNumber, NumOfAdults, NumOfChilds, TotalCost)
values
	(1, 308, 1, 0, 299.98),
    (2, 203, 2, 1, 999.95),
    (3, 305, 2, 0, 349.98),
    (4, 201, 2, 2, 199.99),
    (5, 307, 1, 1, 524.97),
    (6, 302, 3, 0, 924.95),
    (7, 202, 2, 2, 349.98),
    (8, 304, 2, 0, 874.95),
    (9, 301, 1, 0, 799.96),
    (10, 207, 1, 1, 174.99),
    (11, 401, 2, 4, 1199.97),
    (12, 206, 2, 0, 599.96),
    (12, 208, 1, 0, 599.96),
    (13, 304, 3, 0, 184.99),
    (14, 205, 2, 0, 699.96),
    (15, 204, 3, 1, 184.99),
    (16, 401, 4, 2, 1259.97),
    (17, 303, 2, 1, 199.99),
    (18, 305, 1, 0, 349.98),
    (19, 208, 2, 0, 149.99),
    (20, 203, 2, 2, 399.98),
    (21, 401, 2, 2, 1199.97),
    (22, 206, 2, 0, 449.97),
    (22, 301, 2, 2, 599.97),
    (23, 302, 2, 0, 699.96);

-- deleting Jeremiah Pendergrass and his reservations from the database.
-- guestID and reservationID = 8
delete from RoomReservation
where ReservationId = 8;

delete from Reservation
where ReservationId = 8;

delete from Guest
where GuestId = 8;