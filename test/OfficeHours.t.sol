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
    Rares       rares;

    OfficeHoursRenderer renderer;

    function setUp() public {
        calendar = new Calendar();
        prof     = new Professions();
        loc      = new Locations();
        rares    = new Rares();
        renderer = new OfficeHoursRenderer();  
        office   = new OfficeHours();

        renderer.setInventory(address(prof), address(loc), address(rares));
        office.setRenderer(address(renderer));
        office.setCalendar(address(calendar));

        vm.warp(1654516801);
    }

    mapping (uint256 => uint256) public occur;

    function test_mint_distribution() external {
        office.mint(10000);

        // for (uint256 i = 1; i < 10001; i++) {
        //     (uint256 prof_,,,) = office.getDatails(i);
        //     occur[prof_]++;
        // }

        // for (uint256 j = 1; j < 24; j++) {
        //     emit log_named_uint("occ", occur[j]);
        //     if (j == 11) emit log("----------------");
        //     if (j == 16) emit log("----------------");
        //     if (j == 19) emit log("----------------");
        // }
    }

    function test_mint_cap() external {
        for (uint256 i = 1; i < 1001; i++) {
            vm.prank(address(uint160(i)));
            office.mint(1,1);
        }

        vm.expectRevert("max supply reached");
        vm.prank(address(4000));
        office.mint(1,1);
    }

    function test_getMetadata() external {
        office.mint(300);

        // for (uint256 i = 1; i < 300; i++) {
        //     office.tokenURI(i);
        // }
        emit log(office.tokenURI(1));
    }


    function test_approve_alawaysWorks() external {
        address sender     = address(99999);
        address transferer = address(8888);

        // Mint a single 3 tokens
        vm.prank(sender);
        office.mint(1, 1);

        uint256 id = 1;

        bool can = true;

        for (uint256 i = 0; i < 1000; i++) {
            vm.warp(block.timestamp + 3600);
            can = office.canTransfer(1);

            if (!can) {
                // Not able to read owner 
                vm.expectRevert("NOT_ON_DUTY");
                office.ownerOf(id);

                // Approve the token
                office.approve(transferer, id);
                break;
            }
        }
    }

    function test_transfer_alawaysWorks() external {
        address sender = address(99999);

        // Mint a single 3 tokens
        vm.prank(sender);
        office.mint(1, 1);

        uint256 id = 1;

        bool can = true;

        for (uint256 i = 0; i < 1000; i++) {
            vm.warp(block.timestamp + 3600);
            can = office.canTransfer(1);

            if (!can) {
                // Not able to read owner 
                vm.expectRevert("NOT_ON_DUTY");
                office.ownerOf(id);

                // Approve the token
                vm.prank(sender);
                office.transfer(address(10), id);
                break;
            }
        }
    }

    function test_transferLock() external {
        address sender = address(99999);

        // Mint a single 3 tokens
        vm.prank(sender);
        office.mint(1, 1);

        uint256 id = 1;

        bool can = true;

        for (uint256 i = 0; i < 1000; i++) {
            vm.warp(block.timestamp + 3600);
            can = office.canTransfer(1);

            if (!can) {
                // Not able to read owner 
                vm.expectRevert("NOT_ON_DUTY");
                office.ownerOf(id);

                // Approve the token
                vm.prank(sender);
                office.approve(address(10), id);

                vm.expectRevert("NOT_ON_DUTY");
                vm.prank(address(10));
                office.transferFrom(sender, address(10), id);
                break;
            }
        }
    }

    function test_payOvertime() external {
        address sender = address(99999);

        // Mint a single 3 tokens
        vm.prank(sender);
        office.mint(1, 1);

        uint256 id = 1;

        bool can = true;

        for (uint256 i = 0; i < 1000; i++) {
            vm.warp(block.timestamp + 3600);
            can = office.canTransfer(1);

            if (!can) {
                // Not able to read owner 
                vm.expectRevert("NOT_ON_DUTY");
                office.ownerOf(id);

                // Approve the token
                vm.prank(sender);
                office.approve(address(10), id);

                vm.expectRevert("NOT_ON_DUTY");
                vm.prank(address(10));
                office.transferFrom(sender, address(10), id);

                office.payOvertime{value: 0.1 ether}(id);

                vm.prank(address(10));
                office.transferFrom(sender, address(10), id);

                assertEq(office.ownerOf(id), address(10));
                break;
            }
        }
    }

}
