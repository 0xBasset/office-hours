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
    }

    // Todo increase coverage
    // function test_dow_timezone0() public {
    //     uint256 timezone = 0;

    //     // Monday
    //     assertEq(cal.__dayOfTheWeek(1653861600, timezone), 0);
    //     assertEq(cal.__dayOfTheWeek(1653904800, timezone), 0);
    //     assertEq(cal.__dayOfTheWeek(1653947999, timezone), 0);

    //     // Tuesday
    //     assertEq(cal.__dayOfTheWeek(1653948000, timezone), 1);
    //     assertEq(cal.__dayOfTheWeek(1653991200, timezone), 1);
    //     assertEq(cal.__dayOfTheWeek(1654034399, timezone), 1);

    //     // Sunday
    //     assertEq(cal.__dayOfTheWeek(1654380001, timezone), 6);

    //     // Monday again
    //     assertEq(cal.__dayOfTheWeek(1654466401, timezone), 0);
    // }

    function test_worksOn() external {
        assertTrue(cal._worksOn(31, 0));
        assertTrue(cal._worksOn(31, 1));
        assertTrue(cal._worksOn(31, 2));
        assertTrue(cal._worksOn(31, 3));
        assertTrue(cal._worksOn(31, 4));

        assertTrue(!cal._worksOn(31, 5));
        assertTrue(!cal._worksOn(31, 6));
    }

    function test_isWorking_1() public {
        uint256 weekdays     = 31; // Mon -> Fri
        uint256 timezone     = 0;
        uint256 startingHour = 9 hours;
        uint256 duration     = 8 hours;

        // _time(1655103600);
        assertTrue(cal.isWorking(1753302600, weekdays, timezone, startingHour, duration));

        //  _time(1655114400);
        // assertTrue(cal.isWorking(weekdays, timezone, startingHour, duration, nightShift));


    }

    function _time(uint256 time_) internal {
        vm.warp(time_);
    }




}
