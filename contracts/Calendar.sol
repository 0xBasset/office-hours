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

    uint256 constant base = 1651658400; // 00:00 from a monday on UTC+14

    function _offsetForTimezone(uint256 timezone) public pure returns (uint256) {
        // Some timezones are half hours
        return (timezone * 3600);
    }

    function isWorking(uint256 time, uint256 weekdays, uint256 timezone, uint256 startingHour, uint256 duration, bool nightShift) public pure returns (bool working) {
        // todo check overtime
        // todo check calendar day
        uint256 timezoneBase = base + _offsetForTimezone(timezone);

        if (!_worksOn(weekdays, __dayOfTheWeek(time, timezoneBase))) return working;

        uint256 shiftStart = (time - ((time - timezoneBase) % 1 days)) + startingHour + (nightShift ? 12 hours : 0);
        
        if (time >= shiftStart && time <= shiftStart + duration) working = true;
    }

    function _worksOn(uint256 workingWeekdays, uint256 today) public pure returns(bool works) {
        return (workingWeekdays & (2 ** today)) == 2 ** today;
    }

    function __dayOfTheWeek(uint256 time_, uint256 base_) public pure returns (uint256 day) {
        day = ((time_ - (base_)) / 1 days) % 7; // 0 for monday, 1 for tue, etc
    }

    function getCalendar(uint256 profId) public pure returns(uint256 weekdays, uint256 start, uint256 duration, uint256 calendar) {
        ( weekdays, start, duration, calendar) = (0,0,0,0);

        if (profId == 1) ( weekdays, start, duration, calendar) = (31, 9 hours, 8 hours, 0);
    }

}
