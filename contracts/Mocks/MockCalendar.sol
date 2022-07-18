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

    function rates(uint256 ) external pure returns(uint8 start, uint8 end) {
        return(1, 2);
    }

}
