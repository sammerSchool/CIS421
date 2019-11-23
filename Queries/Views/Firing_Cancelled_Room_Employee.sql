-- Deleting the employee who worked on the  cancelled room
delete 
from employee 
using employee , rooms , cancellations
where EmployeeId = hotel.rooms.HousekeeperId and hotel.rooms.RoomNumber =  hotel.cancellations.RoomNumber;


-- setting a new employee to work on the room that the fired employee worked on
update rooms
set HousekeeperId = 115
where HousekeeperId is null;

select * 
from rooms;

select *
from employee;
