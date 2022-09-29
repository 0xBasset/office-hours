// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Calendar {

    uint256 constant base          = 1654516800;   // 00:00 from a monday on UTC-12 (the lowest timezone)
    uint256 constant secondsInYear = 31556926;
    uint256 constant baseSalary    = 1000000000000000; // Minimum rate per hour

    function canTransfer(uint256 profession, uint256 timezone, uint256 overtimeUntil) external pure returns(bool) {
       return true;
    }

    function isWorking(uint256 time, uint256 weekdays, uint256 timezone, uint256 startingHour, uint256 duration) public pure returns (bool working) {
        uint256 timezoneBase = base - offsetForTimezone(timezone);
        uint256 daysSince    = _daysSince(time, timezoneBase);
        uint256 dayStart     = timezoneBase + (daysSince * 1 days); 
        uint256 shiftStart   = dayStart + startingHour;
       
        // The shift started today
        if (_worksOn(weekdays, _dayOfTheWeek(dayStart, timezoneBase))) {
            if (time >= shiftStart && time <= shiftStart + duration) working = true;
        } 

        // The shift starts in one day and ends in another, so we need to check if that's the case
        if (startingHour + duration > 24 hours) {
            if (_worksOn(weekdays, _dayOfTheWeek(dayStart - 1 days, timezoneBase))) {
                shiftStart -= 1 days;
                if (time >= shiftStart && time <= shiftStart + duration) working = true;
            } 
        }
    }

     function offsetForTimezone(uint256 timezone) public pure returns (uint256) {
        return (timezone * 3600);
    }

    function _worksOn(uint256 workingWeekdays, uint256 today) public pure returns(bool works) {
        return (workingWeekdays & (2 ** today)) == 2 ** today;
    }

    function _daysSince(uint256 time_, uint256 base_) public pure returns (uint256 days_) {
        days_ = (time_ - base_) / 1 days;
    }

    function _dayOfTheWeek(uint256 time_, uint256 base_) public pure returns (uint256 day) {
        day = ((time_ - base_) / 1 days) % 7; // 0 for monday, 1 for tue, etc
    }

    function isCalendarDay(uint256 time, uint256 secondsFromBase) public pure returns (bool isDay) {
        uint256 timezoneBase = base - offsetForTimezone(25);
        uint256 secondsOffset = (time - timezoneBase) % secondsInYear;

        return secondsOffset >= secondsFromBase && secondsOffset <= secondsFromBase + 48 hours;
    }

    function calendarOffset(uint256 profId) public pure returns (uint256 off_) {
        // Santa
        if (profId == 32) off_ = 17452800;
        // Hedgehog
        if (profId == 33) off_ = 0;
        // Uncle Sam
        if (profId == 34) off_ = 2419200;
        // Jack-o-Lantern
        if (profId == 35) off_ = 12700800;
        // Dragon
        if (profId == 36) off_ = 19872000;
        // La befana
        if (profId == 37) off_ = 18403200;
    }

    function getCalendar(uint256 profId) public pure returns(uint256 weekdays, uint256 start, uint256 duration, uint256 calendar) {
        // Farmer
        if (profId == 1)  ( weekdays, start, duration, calendar) = ( 31, 4 hours, 11 hours, 0);
        // NFT Influencer
        if (profId == 2)  ( weekdays, start, duration, calendar) = (127, 15 hours, 3 hours, 0);
        // VC Chad
        if (profId == 3)  ( weekdays, start, duration, calendar) = ( 31, 8 hours, 12 hours, 0);
        // Floorboi
        if (profId == 4)  ( weekdays, start, duration, calendar) = (127, 9 hours, 12 hours, 0);
        // Moonboi
        if (profId == 5)  ( weekdays, start, duration, calendar) = (127, 16 hours, 12 hours, 0);
        // Bartender
        if (profId == 6)  ( weekdays, start, duration, calendar) = (120, 18 hours, 8 hours, 0);
        // Chef
        if (profId == 7)  ( weekdays, start, duration, calendar) = (120, 17 hours, 9 hours, 0);
        // Accountant
        if (profId == 8)  ( weekdays, start, duration, calendar) = ( 31, 9 hours, 17 hours, 0);
        // Constructor Worker
        if (profId == 9)  ( weekdays, start, duration, calendar) = ( 31, 6 hours, 8 hours, 0);
        // Pharmacist
        if (profId == 10) ( weekdays, start, duration, calendar) = ( 62, 10 hours, 9 hours, 0);
        // Lawyer
        if (profId == 11) ( weekdays, start, duration, calendar) = ( 29, 7 hours, 9 hours, 0);
        // FLight Attendandt
        if (profId == 12) ( weekdays, start, duration, calendar) =  (37, 19 hours, 15 hours, 0);
        // Painter
        if (profId == 13) ( weekdays, start, duration, calendar) =  (52, 10 hours, 9 hours, 0);
        // Airplane Pilot
        if (profId == 14) ( weekdays, start, duration, calendar) =  (37, 19 hours, 15 hours, 0);
        // Veterinarian
        if (profId == 15) ( weekdays, start, duration, calendar) =  (61, 7 hours, 9 hours, 0);
        // Athlete
        if (profId == 16) ( weekdays, start, duration, calendar) = ( 68, 16 hours, 6 hours, 0);
        // Actress
        if (profId == 17) ( weekdays, start, duration, calendar) = (106, 10 hours, 7 hours, 0);
        // Fashion Designer
        if (profId == 18) ( weekdays, start, duration, calendar) = (21, 10 hours, 7 hours, 0);
        // Doctor
        if (profId == 19) ( weekdays, start, duration, calendar) = ( 42, 7 hours, 15 hours, 0);
        // Judge
        if (profId == 20) ( weekdays, start, duration, calendar) = (30, 11 hours, 5 hours, 0);
        //Spy
        if (profId == 21) ( weekdays, start, duration, calendar) = (51, 9 hours, 15 hours, 0);
        //Monk
        if (profId == 22) ( weekdays, start, duration, calendar) = (127, 5 hours, 10 hours, 0);
        //Racing pilot
        if (profId == 23) ( weekdays, start, duration, calendar) = (53, 9 hours, 7 hours, 0);
        // Outback
        if (profId == 24) ( weekdays, start, duration, calendar) = (127, 5 hours, 9 hours, 0);
        // Taxi Driver 
        if (profId == 25) ( weekdays, start, duration, calendar) = (122, 18 hours, 9 hours, 0);
        // Austronaut
        if (profId == 26) ( weekdays, start, duration, calendar) = (31, 10 hours, 8 hours, 0);
        // Rugpuller
        if (profId == 27) ( weekdays, start, duration, calendar) = (127, 1 hours, 64 hours, 0);
        // Ninja
        if (profId == 28) ( weekdays, start, duration, calendar) = ( 68, 0 hours, 6 hours, 0);
        // Congo Warlord
        if (profId == 29) ( weekdays, start, duration, calendar) = (137, 18 , 2 , 0);
       //Zoolander
        if (profId == 30) ( weekdays, start, duration, calendar) = (124, 15 , 5 , 0);
        //Vampire
        if (profId == 31) ( weekdays, start, duration, calendar) = (127, 1 , 5 , 0); 
        // Mech Santa
        if (profId == 32) ( weekdays, start, duration, calendar) = (0, 0 , 0 , 17452800);
        // Hedgehog
        if (profId == 33) ( weekdays, start, duration, calendar) = (0, 0 , 0 , 0);
        // Uncle Sam
        if (profId == 34) ( weekdays, start, duration, calendar) = (0, 0 , 0 , 2419200);
        // Jack-o-Lantern
        if (profId == 35) ( weekdays, start, duration, calendar) = (0, 0 , 0 , 12700800);
        // Dragon
        if (profId == 36) ( weekdays, start, duration, calendar) = (0, 0 , 0 , 19872000);
        // La Befana
        if (profId == 37) ( weekdays, start, duration, calendar) = (0, 0 , 0 , 19872000);
    }

    function rates(uint256 profId) external pure returns(uint8 start, uint8 end) {
        // Farmer
        if (profId == 1)  ( start, end ) = (1, 3);
        // NFT Influencer
        if (profId == 2)  ( start, end ) = (3, 6);
        // VC Chad
        if (profId == 3)  ( start, end ) = (6, 9);
        // Floorboi
        if (profId == 4)  ( start, end ) = (1, 2);
        // Moonboi
        if (profId == 5)  ( start, end ) = (1, 2);
        // Bartender
        if (profId == 6)  ( start, end ) = (1, 3);
        // Chef
        if (profId == 7)  ( start, end ) = (3, 6);
        // Accountant
        if (profId == 8)  ( start, end ) = (3, 8);
        // Constructor Worker
        if (profId == 9)  ( start, end ) = (1, 3);
        // Pharmacist
        if (profId == 10) ( start, end ) = (2, 5);
        // Lawyer
        if (profId == 11) ( start, end ) = (3, 10);
        //FLight Attendandt
        if (profId == 12) ( start, end ) = (4, 7);
        // Painter
        if (profId == 13) ( start, end ) = (1, 9);
        // Airplane Pilot
        if (profId == 14) ( start, end ) = (5, 10);
        // Veterinarian
        if (profId == 15) ( start, end ) = (1, 4);
        // Athlete
        if (profId == 16) ( start, end ) = (4, 15);
        // Actress
        if (profId == 17) ( start, end ) = (3, 11);
        // Fashion Designer
        if (profId == 18) ( start, end ) = (3, 9);
        // Doctor
        if (profId == 19) ( start, end ) = (9, 12);
        // Judge
        if (profId == 20) ( start, end ) = (8, 12);
        //Spy
        if (profId == 21) ( start, end ) = (6, 15);
        //Monk
        if (profId == 22) ( start, end ) = (1, 2);
        //Racing pilot
        if (profId == 23) ( start, end ) = (9, 11);
        // Outback
        if (profId == 24) ( start, end ) = (3, 6);
        // Taxi Driver
        if (profId == 25) ( start, end ) = (2, 5);
        // Astronaut
        if (profId == 26) ( start, end ) = (4, 9);
        // Rugpuller
        if (profId == 27) ( start, end ) = (9, 17);
        // Ninja
        if (profId == 28) ( start, end ) = (10, 14);
        // Congo Warlord
        if (profId == 29) ( start, end ) = (12, 25);
        //Zoolander
        if (profId == 30) ( start, end ) = (2, 5);
        //Vampire
        if (profId == 31) ( start, end ) = (4, 11);
        // Mech Santa
        if (profId == 32) ( start, end ) = (15, 25);
        // Hedgehog
        if (profId == 33) ( start, end ) = (1, 3);
        // Uncle Sam
        if (profId == 34) ( start, end ) = (10, 13);
        // Jack-o-Lantern
        if (profId == 35) ( start, end ) = (11, 14);
        // Dragon
        if (profId == 36) ( start, end ) = (11, 20);
        // La Befana
        if (profId == 37) ( start, end ) = (11, 20);
    }

}
