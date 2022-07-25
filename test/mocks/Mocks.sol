// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import { OfficeHoursRenderer } from "../../contracts/OfficeHoursRenderer.sol";

contract MockOfficeHoursRenderer is OfficeHoursRenderer {

    string constant headerfake = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" id="office" width="200px" height="200px" version="1.1" viewBox="0 0 64 64">';

    function _getSvgFAKE(uint256 id, uint256 profession, uint256 timezone) public view returns (string memory svg) {
        if (profession >= 32) return string(abi.encodePacked(headerfake, wrapTag(InventoryLike(rares).rares(profession)), footer));

        address profAddress = profession <= 15 ? professions1 : professions2;

        string memory prof = InventoryLike(profAddress).professions(profession);
        string memory loc  = InventoryLike(locations).locations(timezone);
        
        string memory filter = getFilter();
        svg = string(abi.encodePacked(headerfake, getBg(id), wrapTag(frame), wrapTag(prof), wrapTextTag(loc, filter) ,footer));
    }
    
}

interface InventoryLike {
    function professions(uint256 id) external pure returns (string memory str);
    function locations(uint256 id ) external pure returns (string memory str);
    function rares(uint256 id) external pure returns (string memory str);
}
