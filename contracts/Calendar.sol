// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Calendar {

    uint256 constant base = 1654513200;   // 00:00 from a monday on UTC-11 (the lowest timezone)
    uint256 constant secondsInYear = 31556926;
    uint256 constant baseSalary = 1000000000000000; // Minimum rate per hour

    function _offsetForTimezone(uint256 timezone) public pure returns (uint256) {
        return (timezone * 3600);
    }

    function canTransfer(uint256 profession, uint256 timezone, uint256 overtimeUntil) internal view returns(bool) {
      ( uint256 weekdays, uint256 start, uint256 duration, uint256 calendar) = getCalendar(profession);

      if (block.timestamp >= overtimeUntil) return true; 
      if (isCalendarDay(block.timestamp, calendar)) return true;

      return isWorking(block.timestamp, weekdays, timezone, start, duration);
    }

    function isWorking(uint256 time, uint256 weekdays, uint256 timezone, uint256 startingHour, uint256 duration) public pure returns (bool working) {
        uint256 timezoneBase = base + _offsetForTimezone(timezone);

        if (!_worksOn(weekdays, _dayOfTheWeek(time, timezoneBase))) return working;

        uint256 shiftStart = (time - ((time - timezoneBase) % 1 days)) + startingHour;
        
        if (time >= shiftStart && time <= shiftStart + duration) working = true;
    }

    function _worksOn(uint256 workingWeekdays, uint256 today) public pure returns(bool works) {
        return (workingWeekdays & (2 ** today)) == 2 ** today;
    }

    function _dayOfTheWeek(uint256 time_, uint256 base_) public pure returns (uint256 day) {
        day = ((time_ - (base_)) / 1 days) % 7; // 0 for monday, 1 for tue, etc
    }

    function isCalendarDay(uint256 time, uint256 secondsFromBase) public pure returns (bool isDay) {
        uint256 secondsOffset = (time - base) % secondsInYear;

        return secondsOffset >= secondsFromBase && secondsOffset <= secondsFromBase + 47 hours;
    }

    function calendarOffset(uint256 professionId) public pure returns (uint256 off_) {
        // TODO fill
        if (professionId == 15) return 0;
        if (professionId == 15) return 0;
        if (professionId == 15) return 0;
    }

    function getCalendar(uint256 profId) public pure returns(uint256 weekdays, uint256 start, uint256 duration, uint256 calendar) {
        ( weekdays, start, duration, calendar) = (0,0,0,0);

        // Farmer
        if (profId == 1) ( weekdays, start, duration, calendar) = (31, 4 hours, 11 hours, 0);
        // NFT Influencer
        if (profId == 2) ( weekdays, start, duration, calendar) = (127, 15 hours, 3 hours, 0);
        // VC Chad
        if (profId == 3) ( weekdays, start, duration, calendar) = (31, 10 hours, 8 hours, 0);
        // Floorboi
        if (profId == 4) ( weekdays, start, duration, calendar) = (127, 9 hours, 15 hours, 0);
        // Moonboi
        if (profId == 5) ( weekdays, start, duration, calendar) = (127, 15 hours, 15 hours, 0);
        // Bartender
        if (profId == 6) ( weekdays, start, duration, calendar) = (120, 18 hours, 8 hours, 0);
        // Rugpuller
        if (profId == 7) ( weekdays, start, duration, calendar) = (85, 1 hours, 6 hours, 0);
        // Actress
        if (profId == 8) ( weekdays, start, duration, calendar) = (93, 7 hours, 7 hours, 0);
        // Doctor
        if (profId == 9) ( weekdays, start, duration, calendar) = (15, 9 hours, 12 hours, 0);
        // Chef
        if (profId == 10) ( weekdays, start, duration, calendar) = (126, 17 hours, 5 hours, 0);
    }

    function rates(uint256 profId) external pure returns(uint8 start, uint8 end) {
        // Farmer
        if (profId == 1) (start, end) = (1,3);
        // NFT Influencer
        if (profId == 2) (start, end) = (6,10);
        // VC Chad
        if (profId == 3) (start, end) = (9, 15);
        // Floorboi
        if (profId == 4) (start, end) = (1, 2);
        // Moonboi
        if (profId == 5) (start, end) = (1, 2);
        // Bartender
        if (profId == 6) (start, end) = (1, 5);
        // Rugpuller
        if (profId == 7) (start, end) = (3, 9);
        // Actress
        if (profId == 8) (start, end) = (2, 20);
        // Doctor
        if (profId == 9) (start, end) = (3, 12);
        // Chef
        if (profId == 10) (start, end) = (2, 10);
        if (profId == 11) (start, end) = (2, 10);
        if (profId == 12) (start, end) = (2, 10);
        if (profId == 13) (start, end) = (2, 10);
        if (profId == 14) (start, end) = (2, 10);
        if (profId == 15) (start, end) = (2, 10);
    }

}
