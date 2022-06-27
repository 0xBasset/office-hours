// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract MockCalendar {

    uint256 constant base = 1654513200;   // 00:00 from a monday on UTC-11 (the lowest timezone)
    uint256 constant secondsInYear = 31556926;
    uint256 constant baseSalary = 1000000000000000; // Minimum rate per hour

    mapping(uint256 => bool) public working; // Profession to working

    function setWorking(uint256 prof, bool working_) external {
        working[prof] = working_;
    }

    function canTransfer(uint256 profession, uint256 , uint256 ) external view returns(bool) {
      return working[profession];
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
