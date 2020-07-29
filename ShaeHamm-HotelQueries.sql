use HotelReservation;

-- 1. returns list of reservations that end in July 2023, including the name 
-- of the guest, the room number(s), and the reservation dates.

select concat(Guest.FirstName, ' ', Guest.LastName) as `Name`, 
	RoomReservation.RoomNumber, 
	Reservation.StartDate, 
    Reservation.EndDate
from Reservation
inner join Guest on Reservation.GuestId = Guest.GuestId
inner join RoomReservation on RoomReservation.ReservationId = Reservation.ReservationId
where Reservation.EndDate between '2023-07-01' and '2023-07-31';

-- results: 4 rows returned
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- 2. returns a list of all reservations for rooms with a jacuzzi, displaying 
-- the guest's name, the room number, and the dates of the reservation.

select concat(Guest.FirstName, ' ', Guest.LastName) as `Name`, 
	RoomReservation.RoomNumber, 
	Reservation.StartDate, 
    Reservation.EndDate
from Reservation
inner join Guest on Reservation.GuestId = Guest.GuestId
inner join RoomReservation on RoomReservation.ReservationId = Reservation.ReservationId
inner join RoomAmenity on RoomReservation.RoomNumber = RoomAmenity.RoomNumber
inner join AmenityType on RoomAmenity.AmenityId = AmenityType.AmenityId
where AmenityType.AmenityId = 1;

-- results: 11 rows returned
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- 3. returns all the rooms reserved for a specific guest, including the 
-- guest's name, the room(s) reserved, the starting date of the reservation, 
-- and how many people were included in the reservation. 
-- (Choose a guest's name from the existing data.) 

select concat(Guest.FirstName, ' ', Guest.LastName) as `Name`, 
	RoomReservation.RoomNumber, 
	Reservation.StartDate, 
    Reservation.EndDate,
    (RoomReservation.NumOfAdults + RoomReservation.NumOfChilds) IncludedPeople
from Reservation
inner join Guest on Reservation.GuestId = Guest.GuestId
inner join RoomReservation on Reservation.ReservationId = RoomReservation.ReservationId
where Guest.GuestId = 2;

-- results: 4 rows returned
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- 4. returns a list of rooms, reservation ID, and per-room cost for each 
-- reservation. The results should include all rooms, whether or not there is 
-- a reservation associated with the room.

-- base price + amenity cost

select Room.RoomNumber, 
	RoomReservation.ReservationId, 
	(RoomType.BasePrice + AmenityType.Price) as RoomCost
from Room
inner join RoomType on Room.`Type` = RoomType.`Type`
inner join RoomAmenity on Room.RoomNumber = RoomAmenity.RoomNumber
inner join AmenityType on RoomAmenity.AmenityId = AmenityType.AmenityId
left outer join RoomReservation on Room.RoomNumber = RoomReservation.RoomNumber
group by RoomReservation.ReservationId, Room.RoomNumber;

-- results: not working
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- 5. returns all the rooms accommodating at least three guests and that are 
-- reserved on any date in April 2023.

-- can hold three people... not number of adults + children

select Room.RoomNumber from Room
inner join RoomType on Room.`Type` = RoomType.`Type`
inner join RoomReservation on RoomReservation.RoomNumber = Room.RoomNumber
inner join Reservation on Reservation.ReservationId = RoomReservation.ReservationId
where RoomType.MaxOccupancy > 2 and
	(Reservation.StartDate <= '2023-04-30') and (Reservation.EndDate >= '2023-04-01');
    
-- !(RE < AS OR RS > AE) --> (RE >= AS) and (rs <= ae)
-- results: 1 row returned
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- 6. returns a list of all guest names and the number of reservations per guest, 
-- sorted starting with the guest with the most reservations and then by the 
-- guest's last name.

select concat(Guest.FirstName, ' ', Guest.LastName) as `Name`,
	count(Reservation.ReservationId) as NumOfReservations
from Reservation
inner join Guest on Reservation.GuestId = Guest.GuestId
group by Guest.FirstName, Guest.LastName
order by count(Reservation.ReservationId) desc, Guest.LastName;

-- results: 11 rows returned
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- 7. displays the name, address, and phone number of a guest based on their 
-- phone number. (Choose a phone number from the existing data.)

select concat(Guest.FirstName, ' ', Guest.LastName) as `Name`, 
	Guest.StreetAddress, 
	Guest.City, Guest.StateAbv,
	Guest.ZipCode, Guest.Phone
from Guest
where Phone = '(814) 485-2615';

-- results: 1 row returned
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --