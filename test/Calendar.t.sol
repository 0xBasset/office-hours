// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "./utils/test.sol";
import "./utils/Interfaces.sol";

import { console } from "./utils/log.sol";

import "../contracts/Calendar.sol";


contract ContractTest is DSTest {
        
    Vm vm = Vm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);

    Calendar cal;

    function setUp() public {
        cal = new Calendar();
        vm.warp(1658756479);
    }

    function test_dow_timezone() public {
        uint256 timezone = 1654516800;

        // Monday
        assertEq(cal._dayOfTheWeek(1656331200, timezone), 0);
        assertEq(cal._dayOfTheWeek(1656374400, timezone), 0);
        assertEq(cal._dayOfTheWeek(1656417599, timezone), 0);

        // Tuesday
        assertEq(cal._dayOfTheWeek(1656417600, timezone), 1);
        assertEq(cal._dayOfTheWeek(1656503999, timezone), 1);

        // Wed
        assertEq(cal._dayOfTheWeek(1656504000, timezone), 2);
        assertEq(cal._dayOfTheWeek(1656590399, timezone), 2);

        // Thu
        assertEq(cal._dayOfTheWeek(1656590400, timezone), 3);
        assertEq(cal._dayOfTheWeek(1656676799, timezone), 3);

        // Fri
        assertEq(cal._dayOfTheWeek(1656676800, timezone), 4);
        assertEq(cal._dayOfTheWeek(1656763199, timezone), 4);

        // Sat
        assertEq(cal._dayOfTheWeek(1656763200, timezone), 5);
        assertEq(cal._dayOfTheWeek(1656849599, timezone), 5);

        // Sun
        assertEq(cal._dayOfTheWeek(1656849600, timezone), 6);
        assertEq(cal._dayOfTheWeek(1656935999, timezone), 6);

        // Monday again
        assertEq(cal._dayOfTheWeek(1656936000, timezone), 0);
    }

    function test_canTransfer_christams() public {
        
        for (uint256 i = 0; i < 155; i++) {
            console.log(cal.canTransfer(32,2,block.timestamp - 1));
            vm.warp(block.timestamp + 1 days);
        }

    }

    function test_canTransfer_hedgehogDay() public {
        
        for (uint256 i = 0; i < 2; i++) {
            assertTrue(cal.canTransfer(33,2,block.timestamp - 1));
        }

    }

    function test_worksOn_MonToFri() external {
        assertTrue(cal._worksOn(31, 0));
        assertTrue(cal._worksOn(31, 1));
        assertTrue(cal._worksOn(31, 2));
        assertTrue(cal._worksOn(31, 3));
        assertTrue(cal._worksOn(31, 4));

        assertTrue(!cal._worksOn(31, 5));
        assertTrue(!cal._worksOn(31, 6));
    }

    function test_worksOn_Monday() external {
        // Monday = 00000001
        assertTrue(cal._worksOn(1, 0));
        assertTrue(!cal._worksOn(1, 1));
        assertTrue(!cal._worksOn(1, 2));
        assertTrue(!cal._worksOn(1, 3));
        assertTrue(!cal._worksOn(1, 4));
        assertTrue(!cal._worksOn(1, 5));
        assertTrue(!cal._worksOn(1, 6));
    }

    function test_worksOn_Tuesday() external {
        // Tuesday = 00000010
        assertTrue(!cal._worksOn(2, 0));
        assertTrue( cal._worksOn(2, 1));
        assertTrue(!cal._worksOn(2, 2));
        assertTrue(!cal._worksOn(2, 3));
        assertTrue(!cal._worksOn(2, 4));
        assertTrue(!cal._worksOn(2, 5));
        assertTrue(!cal._worksOn(2, 6));
    }

    function test_worksOn_Wednesday() external {
        // Wed = 00000100
        assertTrue(!cal._worksOn(4, 0));
        assertTrue(!cal._worksOn(4, 1));
        assertTrue( cal._worksOn(4, 2));
        assertTrue(!cal._worksOn(4, 3));
        assertTrue(!cal._worksOn(4, 4));
        assertTrue(!cal._worksOn(4, 5));
        assertTrue(!cal._worksOn(4, 6));
    }

    function test_worksOn_Thursday() external {
        // Thu = 00001000
        assertTrue(!cal._worksOn(8, 0));
        assertTrue(!cal._worksOn(8, 1));
        assertTrue(!cal._worksOn(8, 2));
        assertTrue( cal._worksOn(8, 3));
        assertTrue(!cal._worksOn(8, 4));
        assertTrue(!cal._worksOn(8, 5));
        assertTrue(!cal._worksOn(8, 6));
    }

    function test_worksOn_Friday() external {
        // Fri = 00010000
        assertTrue(!cal._worksOn(16, 0));
        assertTrue(!cal._worksOn(16, 1));
        assertTrue(!cal._worksOn(16, 2));
        assertTrue(!cal._worksOn(16, 3));
        assertTrue( cal._worksOn(16, 4));
        assertTrue(!cal._worksOn(16, 5));
        assertTrue(!cal._worksOn(16, 6));
    }

    function test_worksOn_Saturday() external {
        // Sat = 00100000
        assertTrue(!cal._worksOn(32, 0));
        assertTrue(!cal._worksOn(32, 1));
        assertTrue(!cal._worksOn(32, 2));
        assertTrue(!cal._worksOn(32, 3));
        assertTrue(!cal._worksOn(32, 4));
        assertTrue( cal._worksOn(32, 5));
        assertTrue(!cal._worksOn(32, 6));
    }

    function test_worksOn_Sunday() external {
        // Sun = 00100000
        assertTrue(!cal._worksOn(64, 0));
        assertTrue(!cal._worksOn(64, 1));
        assertTrue(!cal._worksOn(64, 2));
        assertTrue(!cal._worksOn(64, 3));
        assertTrue(!cal._worksOn(64, 4));
        assertTrue(!cal._worksOn(64, 5));
        assertTrue( cal._worksOn(64, 6));
    }

    function test_isWorking_1() public {
        uint256 weekdays     = 31; // Mon -> Fri
        uint256 timezone     = 1;
        uint256 startingHour = 9 hours;
        uint256 duration     = 9 hours;

        assertTrue( cal._worksOn(weekdays, 0)); // mon
        assertTrue( cal._worksOn(weekdays, 2)); // wed
        assertTrue( cal._worksOn(weekdays, 1)); // tue
        assertTrue( cal._worksOn(weekdays, 3)); // thu
        assertTrue( cal._worksOn(weekdays, 4)); // fri
        assertTrue(!cal._worksOn(weekdays, 5)); // sat
        assertTrue(!cal._worksOn(weekdays, 6)); // sun

        assertTrue( cal.isWorking(1753300800, weekdays, timezone, startingHour, duration));
        assertTrue( cal.isWorking(1753333199, weekdays, timezone, startingHour, duration));
        assertTrue(!cal.isWorking(1753333201, weekdays, timezone, startingHour, duration));
    }

    function test_isWorking_2() public { // 01000000
        uint256 weekdays     = 64; // Only Sundays
        uint256 timezone     = 12;  // GMT+0
        uint256 startingHour = 20 hours; 
        uint256 duration     = 9 hours; // from 8pm to 5am

        // Test that we have the correct weekdays
        assertTrue(!cal._worksOn(weekdays, 0)); // mon
        assertTrue(!cal._worksOn(weekdays, 1)); // tue
        assertTrue(!cal._worksOn(weekdays, 2)); // wed
        assertTrue(!cal._worksOn(weekdays, 3)); // thu
        assertTrue(!cal._worksOn(weekdays, 4)); // fri
        assertTrue(!cal._worksOn(weekdays, 5)); // sat
        assertTrue( cal._worksOn(weekdays, 6)); // sun

        assertTrue(!cal.isWorking(1656603900, weekdays, timezone, startingHour, duration));
        assertTrue(!cal.isWorking(1656273599, weekdays, timezone, startingHour, duration));
        assertTrue( cal.isWorking(1656273600, weekdays, timezone, startingHour, duration));
        assertTrue( cal.isWorking(1656291600, weekdays, timezone, startingHour, duration));
        assertTrue( cal.isWorking(1656305999, weekdays, timezone, startingHour, duration));
        assertTrue(!cal.isWorking(1656306001, weekdays, timezone, startingHour, duration));
    }

    function test_isWorking_3() public {
        uint256 weekdays     = 112; // Only Weekends 01110000
        uint256 timezone     = 8;  // GMT+0
        uint256 startingHour = 18 hours; 
        uint256 duration     = 8 hours; // from 6pm to 2am

        // Test that we have the correct weekdays
        assertTrue(!cal._worksOn(weekdays, 0)); // mon
        assertTrue(!cal._worksOn(weekdays, 1)); // tue
        assertTrue(!cal._worksOn(weekdays, 2)); // wed
        assertTrue(!cal._worksOn(weekdays, 3)); // thu
        assertTrue( cal._worksOn(weekdays, 4)); // fri
        assertTrue( cal._worksOn(weekdays, 5)); // sat
        assertTrue( cal._worksOn(weekdays, 6)); // sun

        assertTrue(!cal.isWorking(1656651600, weekdays, timezone, startingHour, duration));
        assertTrue(!cal.isWorking(1656712799, weekdays, timezone, startingHour, duration));
        assertTrue( cal.isWorking(1656712800, weekdays, timezone, startingHour, duration));
        assertTrue( cal.isWorking(1656734400, weekdays, timezone, startingHour, duration));
        assertTrue( cal.isWorking(1656741600, weekdays, timezone, startingHour, duration));
        assertTrue(!cal.isWorking(1656741601, weekdays, timezone, startingHour, duration));
        assertTrue(!cal.isWorking(1656799199, weekdays, timezone, startingHour, duration));
        assertTrue( cal.isWorking(1656799200, weekdays, timezone, startingHour, duration));
        assertTrue( cal.isWorking(1656824400, weekdays, timezone, startingHour, duration));
        assertTrue(!cal.isWorking(1656835200, weekdays, timezone, startingHour, duration));
        assertTrue(!cal.isWorking(1656885599, weekdays, timezone, startingHour, duration));
        assertTrue( cal.isWorking(1656885600, weekdays, timezone, startingHour, duration));
        assertTrue( cal.isWorking(1656910800, weekdays, timezone, startingHour, duration));
        assertTrue(!cal.isWorking(1656914401, weekdays, timezone, startingHour, duration));
        assertTrue(!cal.isWorking(1656972001, weekdays, timezone, startingHour, duration));
    }

    function test_is_calendarDay_Christmas() external {
        uint256 santa = 17452800;

        // Christmas of 2022
        assertTrue(!cal.isCalendarDay(1671879599, santa));
        assertTrue( cal.isCalendarDay(1671879600, santa)); // 2022-12-25 in Auckland
        assertTrue( cal.isCalendarDay(1672052400, santa));
        assertTrue(!cal.isCalendarDay(1672052401, santa));

        // 2023
        assertTrue( cal.isCalendarDay(1672052400 + 365 days, santa));
    }

}
