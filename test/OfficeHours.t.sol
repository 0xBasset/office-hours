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
        office.zMint(10000, address(this));

        for (uint256 i = 1; i < 10001; i++) {
            (uint256 prof_,,,) = office.getDatails(i);
            occur[prof_]++;
        }

        for (uint256 j = 1; j < 38; j++) {
            emit log_named_uint("occ", occur[j]);
            if (j == 15) emit log("----------------");
            if (j == 25) emit log("----------------");
            if (j == 31) emit log("----------------");
        }
    }

    function test_mint_wrongVerification() external {
        address minter = address(100);

        vm.expectRevert("wrong verification");
        vm.prank(minter, minter);
        office.mintEven(2, 1);
    }

    function test_mint_wrongFunction() external {
        address minter = address(100);

        vm.expectRevert("wrong function");
        vm.prank(minter, minter);
        office.mintOdd(2, 100);
    }

    function test_mint_badAmount() external {
        address minter = address(100);

        vm.expectRevert("already minted");
        vm.prank(minter, minter);
        office.mintEven(4, 100);
    }

    function test_mint_even() external {
        address minter = address(100);

        vm.prank(minter, minter);
        office.mintEven(2, 100);

        assertEq(office.ownerOf(1), address(100));
    }

    function test_mint_odd() external {
        address minter = address(99);

        vm.prank(minter, minter);
        office.mintOdd(2, 99);

        assertEq(office.ownerOf(1), address(99));
    }

    function test_mint_actualAddress() external {
        address minter = address(0x17299CbB09F49C43BCb4c656Cb5dB61c23514b52);

        vm.prank(minter, minter);
        office.mintEven(2, 19282);

        assertEq(office.ownerOf(1), address(0x17299CbB09F49C43BCb4c656Cb5dB61c23514b52));
    }

    function test_mint_cap() external {
        for (uint256 i = 2; i < 3000; i += 2) {
            vm.prank(address(uint160(i)), address(uint160(i)));
            office.mintEven(2, uint16(uint160(address(uint160(i)))));
        }

        // Minting the last 2
        vm.prank(address(uint160(1)), address(uint160(1)));
        office.mintOdd(2, uint16(uint160(address(uint160(1)))));

        vm.expectRevert("max supply reached");
        vm.prank(address(uint160(3)), address(uint160(3)));
        office.mintOdd(2, uint16(uint160(address(uint160(3)))));
    }

    function test_getMetadata() external {
        office.zMint(5000, address(11));

        for (uint256 i = 1; i < 1000; i++) {
            office.tokenURI(i);
        }

        // for (uint256 i = 0; i < 500; i++) {
        //     (uint256 profession_, uint256 location_, uint256 rate_, uint256 overtime_) = office.getDatails(i);
        //     emit log(renderer._getSvgFAKE(i, profession_, location_));
        // }

        // for (uint256 i = 30; i < 38; i++) {
        //     (uint256 profession_, uint256 location_, uint256 rate_, uint256 overtime_) = office.getDatails(i);
        //     emit log(renderer._getSvgFAKE(i, i, location_));
        // }
    }

    function test_approve_alawaysWorks() external {
        address sender = address(uint160(1));
        address transferer = address(111);

        // Mint a single 3 tokens
        vm.prank(sender, sender);
        office.mintOdd(2, uint16(uint160(sender)));

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
                vm.prank(sender, sender);
                office.approve(transferer, id);
                break;
            }
        }
    }

    function test_transfer_alawaysWorks() external {
        address sender = address(uint160(1));

        // Mint a single 3 tokens
        vm.prank(sender, sender);
        office.mintOdd(2, uint16(uint160(sender)));

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
        address sender = address(uint160(1));

        // Mint a single 3 tokens
        vm.prank(sender, sender);
        office.mintOdd(2, uint16(uint160(sender)));

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
        address sender = address(uint160(1));

        // Mint a single 3 tokens
        vm.prank(sender, sender);
        office.mintOdd(2, uint16(uint160(sender)));

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
