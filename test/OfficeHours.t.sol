// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "./utils/test.sol";
import "./utils/Interfaces.sol";

import "../contracts/Calendar.sol";
import "../contracts/OfficeHours.sol";
import "../contracts/OfficeHoursRenderer.sol";
import "../contracts/Inventory.sol";

contract ContractTest is DSTest {
        
    Vm vm = Vm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);

    Calendar    calendar;
    OfficeHours office;
    Professions prof;
    Locations   loc;

    OfficeHoursRenderer renderer;

    function setUp() public {
        calendar = new Calendar();
        prof     = new Professions();
        loc      = new Locations();
        renderer = new OfficeHoursRenderer();  
        office   = new OfficeHours();

        renderer.setInventory(address(prof), address(loc));
        office.setRenderer(address(renderer));
        office.setCalendar(address(calendar));
    }

    function test_mint() external {
        office.mint(300);
    }

    function test_getMetadata() external {
        office.mint(300);

        // for (uint256 i = 1; i < 300; i++) {
        //     office.tokenURI(i);
        // }
        emit log(office.tokenURI(1));
    }

    // function test_transfer() external {
    //     office.mint(3);
    //     office.approve(address(1), 1);

    //     vm.prank(address(1));
    //     office.transferFrom(address(this), address(2), 1);
    // }

}
