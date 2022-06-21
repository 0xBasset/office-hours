// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Calendar {
    // Weekdays in bitwise from rigth to left
    // Monday  = 00000001 -> 1
    // Tuesday = 00000010 -> 2
    // ...
    // Sunday = 01000000 -> 64
    // Mondays, Weds and Fridays = 00010101 -> 21

    event log_named_uint(string key, uint256 val);
    event log_named_string(string key, string val);

    uint256 constant base = 1654513200;   // 00:00 from a monday on UTC-11 (the lowest timezone)
    uint256 constant minimumWage = 25e10; // Minimum rate per second

    function _offsetForTimezone(uint256 timezone) public pure returns (uint256) {
        return (timezone * 3600);
    }

    function canTransfer(uint256 profession, uint256 timezone, uint256 overtimeUntil) internal view returns(bool) {
      ( uint256 weekdays, uint256 start, uint256 duration, uint256 calendar) = getCalendar(profession);

      if (block.timestamp >= overtimeUntil) return true; 

      return isWorking(block.timestamp, weekdays, timezone, start, duration);
    }

    function isWorking(uint256 time, uint256 weekdays, uint256 timezone, uint256 startingHour, uint256 duration) public pure returns (bool working) {
        // todo check calendar day
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

}
