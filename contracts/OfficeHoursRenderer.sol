// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract OfficeHoursRenderer {

    address admin;
    address rares;
    address professions1;
    address professions2;
    address locations;

    constructor() { admin = msg.sender; }

    function setInventory(address professions1_, address professions2_, address locations_, address rares_) external {
        require(msg.sender == admin, "not admin");
        rares        = rares_;
        professions1 = professions1_;
        professions2 = professions2_;
        locations    = locations_;
    }

    function getURI(uint256 id, uint256 profession, uint256 timezone, uint256 ratePerSecond) external view returns(string memory uri) {
        uri = _getMetadata(id, profession, timezone, ratePerSecond);
    }

    function _getMetadata(uint256 id, uint256 profession, uint256 timezone, uint256 ratePerSecond) internal view returns (string memory meta) {
        string memory svg = _getSvg(id, profession, timezone);

        meta = 
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Strings.encode(
                        abi.encodePacked(
                            '{"name":"',  _getName(profession), " #", Strings.toString(id),
                            '","description":"',
                            '","image": "data:image/svg+xml;base64,', svg,
                            '","attributes":[', _getAttributes(profession, timezone, ratePerSecond),']}')
                        )
                    )
                );
    }

    function _getAttributes(uint256 profession, uint256 timezone, uint256 hourlyRate) internal pure returns (string memory atts_) {
        atts_ = string(abi.encodePacked(
            '{"trait_type":"Profession","value":"', _getName(profession),'"},',
            '{"trait_type":"Timezone","value":"',_getTimezone(timezone),'"},',
            '{"trait_type":"City","value":"',_getCity(timezone),'"},'
            '{"trait_type":"Schedule","value":"',_schedule(profession),'"},',
            '{"trait_type": "Extra hour tax (ETH)", "value":', _getRate(hourlyRate),'}'
        ));
    }

    function _getName(uint256 id) internal pure returns (string memory name_) {
        // tier 1
        if (id == 1)  name_ = "Farmer";
        if (id == 2)  name_ = "NFT Influencer";
        if (id == 3)  name_ = "VC Chad";
        if (id == 4)  name_ = "Floorboi";
        if (id == 5)  name_ = "Moonboi";
        if (id == 6)  name_ = "Bartender";
        if (id == 7)  name_ = "Chef";
        if (id == 8)  name_ = "Accountant";
        if (id == 9)  name_ = "Construction Worker";
        if (id == 10) name_ = "Pharmacist";
        if (id == 11) name_ = "Lawyer";
        if (id == 12) name_ = "Flight Attendant";
        if (id == 13) name_ = "Painter";
        if (id == 14) name_ = "Airplane Pilot";
        if (id == 15) name_ = "Veterinarian";

        // tier 2 
        if (id == 16) name_ = "Athlete";
        if (id == 17) name_ = "Actress";
        if (id == 18) name_ = "Fashion Designer";
        if (id == 19) name_ = "Doctor";
        if (id == 20) name_ = "Judge";
        if (id == 21) name_ = "Spy";
        if (id == 22) name_ = "Monk";
        if (id == 23) name_ = "Racing Pilot";
        if (id == 24) name_ = "Outback Explorer";
        if (id == 25) name_ = "Taxi Driver";

        // tier 3
        if (id == 26) name_ = "Astronaut";
        if (id == 27) name_ = "Rugpuller";
        if (id == 28) name_ = "Ninja";
        if (id == 29) name_ = "Warlord";
        if (id == 30) name_ = "Zoolander";
        if (id == 31) name_ = "Vampire";

        // tier 4 (rares)
        if (id == 32) name_ = "Mech Santa";
        if (id == 33) name_ = "Groundhog";
        if (id == 34) name_ = "Uncle Sam";
        if (id == 35) name_ = "Jack-o-Lantern";
        if (id == 36) name_ = "Dragon";
        if (id == 37) name_ = "La Befana";
    }

    function _getRate(uint256 hourlyRate) internal pure returns(string memory rate) {
        string memory r = Strings.toString(hourlyRate);
        if (hourlyRate < 10) {
            r = string(abi.encodePacked("0", r));
        }
        rate = string(abi.encodePacked("0.0", r));
    }

    function _getCity(uint256 id) internal pure returns(string memory loc) {
        if (id == 1)  loc = "GMT-12";
        if (id == 2)  loc = "Midway Atoll"; 
        if (id == 3)  loc = "Honolulu";
        if (id == 4)  loc = "Totegegie Island";
        if (id == 5)  loc = "Anchorage";
        if (id == 6)  loc = "Los Angeles";
        if (id == 7)  loc = "Denver";
        if (id == 8)  loc = "Mexico City";
        if (id == 9)  loc = "New York City";
        if (id == 10) loc = "Rio de Janeiro";
        if (id == 11) loc = "Fernando de Noronha";
        if (id == 12) loc = "Santiago Island";
        if (id == 13) loc = "Reykjavik";
        if (id == 14) loc = "Marrakesh";
        if (id == 15) loc = "Cairo";
        if (id == 16) loc = "Istambul";
        if (id == 17) loc = "Dubai";
        if (id == 18) loc = "New Delhi";
        if (id == 19) loc = "Dhaka";
        if (id == 20) loc = "Bangkok";
        if (id == 21) loc = "Beijin";
        if (id == 22) loc = "Tokyo";
        if (id == 23) loc = "Sydney";
        if (id == 24) loc = "Honiara";
        if (id == 25) loc = "Auckland";
    }

    function _getTimezone(uint256 id) public pure returns (string memory timezone) {
        string memory prefix = "GMT";
        string memory time;

        if (id < 13)  time = string(abi.encodePacked("-", Strings.toString(13 - id)));
        if (id >= 13) time = string(abi.encodePacked("+", Strings.toString(id - 13)));

        timezone = string(abi.encodePacked(prefix, time));
    }

    function _schedule(uint256 id) internal pure returns (string memory sche_) {
        if (id ==  1) sche_ = "Monday to Friday 4am to 3pm";
        if (id ==  2) sche_ = "Monday to Sunday 3pm to 6pm";
        if (id ==  3) sche_ = "Monday to Friday 8am to 10pm";
        if (id ==  4) sche_ = "Monday to Sunday 9am to 9pm";
        if (id ==  5) sche_ = "Monday to Sunday 4pm to 6am";
        if (id ==  6) sche_ = "Thursday to Sunday 6pm to 2am";
        if (id ==  7) sche_ = "Thursday to Sunday 5pm to 12am";
        if (id ==  8) sche_ = "Monday to Friday 9am to 5pm";
        if (id ==  9) sche_ = "Monday to Friday 6am to 2pm";
        if (id == 10) sche_ = "Monday to Saturday 10am to 7pm";
        if (id == 11) sche_ = "Monday, Wednesdays, Thursdays & Friday 7am to 4pm";
        if (id == 12) sche_ = "Monday, Thursdays and Saturdays 7pm to 9am";
        if (id == 13) sche_ = "Monday to Wednesday, Friday and Saturday 10am to 7pm";
        if (id == 14) sche_ = "Monday, Thursdays and Saturdays 7pm to 9am";
        if (id == 15) sche_ = "Monday to Saturday (except Tuesdays) 7am to 4pm";
        if (id == 16) sche_ = "Wednesdays and Sundays 4pm to 10pm";
        if (id == 17) sche_ = "Tuesdays, Thursdays, Saturday and Sunday 10am to 5pm";
        if (id == 18) sche_ = "Mondays, Wednesdays, Fridays 9am to 11pm";
        if (id == 19) sche_ = "Tuesdays, Thursdays, Saturdays 7am to 12am";
        if (id == 20) sche_ = "Tuesdays to Fridays 11am to 4pm";
        if (id == 21) sche_ = "Monday,Tuesdays,Fridays and Saturday 9am to 12am";
        if (id == 22) sche_ = "Monday to Sunday 5am to 3pm";
        if (id == 23) sche_ = "Monday, Wednesday, Friday and Saturday 9am to 4pm";
        if (id == 24) sche_ = "Monday to Sunday from 5am to 2pm";
        if (id == 25) sche_ = "Tuesday, Thursday, Friday, Saturday & Sunday from 6pm to 3am";
        if (id == 26) sche_ = "Monday through Friday from 10am to 6pm";
        if (id == 27) sche_ = "Monday to Sunday 1am to 4am ";
        if (id == 28) sche_ = "Wednesdays and Sundays from 12am to 6am";
        if (id == 29) sche_ = "Monday to Sunday 6pm to 8pm";
        if (id == 30) sche_ = "Wednesday to Sunday 3pm to 8pm";
        if (id == 31) sche_ = "Monday to Sunday 1am to 5am";
        if (id == 32) sche_ = "Christmas";
        if (id == 33) sche_ = "Groundhog day";
        if (id == 34) sche_ = "4th of July";
        if (id == 35) sche_ = "Halloween";
        if (id == 36) sche_ = "Chinese New Year";
        if (id == 37) sche_ = "Epiphany Eve"; 
    }

    function _bg(uint256 tokenId) internal pure returns (string memory bg_) {
        uint256 id = (tokenId % 10) + 1;
        if (id ==  1) bg_ = "483d8b";
        if (id ==  2) bg_ = "40e0d0";
        if (id ==  3) bg_ = "ff69b4";
        if (id ==  4) bg_ = "00bfff";
        if (id ==  5) bg_ = "ff7f50";
        if (id ==  6) bg_ = "9370db";
        if (id ==  7) bg_ = "ff00ff";
        if (id ==  8) bg_ = "f08080";
        if (id ==  9) bg_ = "5b6ee1";
        if (id == 10) bg_ = "9400D3";
    }

    function _getSvg(uint256 id, uint256 profession, uint256 timezone) internal view returns (string memory svg) {
        if (profession >= 32) return Strings.encode(abi.encodePacked(header, wrapTag(InventoryLike(rares).rares(profession)), footer));

        address profAddress = profession <= 15 ? professions1 : professions2;

        string memory prof = InventoryLike(profAddress).professions(profession);
        string memory loc  = InventoryLike(locations).locations(timezone);
        
        string memory filter = getFilter();
        svg = Strings.encode(abi.encodePacked(header, getBg(id), wrapTag(frame), wrapTag(prof), wrapTextTag(loc, filter) ,footer));
    }

    function getBg(uint256 id) internal pure returns (string memory bg) {
        bg = string(abi.encodePacked('<rect width="100%" height="100%" style="fill:#', _bg(id) ,'" />'));
    }

    function wrapTextTag(string memory uri, string memory filter) internal pure returns (string memory) {
        return string(abi.encodePacked(filter, '<image x="0" y="0" width="64" height="64" image-rendering="pixelated" preserveAspectRatio="xMidYMid" xlink:href="data:image/png;base64,', uri, '" filter="url(#iatacolor)"/>'));
    }

    function wrapTag(string memory uri) internal pure returns (string memory) {
        return string(abi.encodePacked('<image x="0" y="0" width="64" height="64" image-rendering="pixelated" preserveAspectRatio="xMidYMid" xlink:href="data:image/png;base64,', uri, '"/>'));
    }

    function getFilter() internal pure returns (string memory filter) {
        return string(abi.encodePacked('<filter id="iatacolor"> <feColorMatrix in="SourceGraphic" type="matrix" values="0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 0"/> </filter>'));
    }

    string constant header = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" id="office" width="100%" height="100%" version="1.1" viewBox="0 0 64 64">';
    string constant footer = '<style>#office{shape-rendering: crispedges;image-rendering: -webkit-crisp-edges;image-rendering: -moz-crisp-edges;image-rendering: crisp-edges;image-rendering: pixelated;-ms-interpolation-mode: nearest-neighbor;}</style></svg>';
    string constant frame  = 'iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAgMAAAAAulYGAAAACVBMVEUAAAD///////9zeKVjAAAAAnRSTlMAAHaTzTgAAAEgSURBVHja7dahEYAwEEXBi8BQXQye0vAYqsNgaIEhmQvM7DWw7t0vMegKGAwGN8Dzlq6eKxgMBrfCeyq7gMFgcBf4OpLUqUbEdYDBYPC/4GHJBIPBYK0Gg8E2FxgMBttcYDAYrNVgMNjmAoPBYJsLDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8FgMBgMBoPBYDAYDAaDwWAwGAz+FjzVCDAYDP4X7EmAwWCbCwwGg7UaDAaDtRoMBttcYDAYrNVgMBj8OJmZBwaDwT3g7AODweBGeMyBwWDw67sB3lByWd0S1WEAAAAASUVORK5CYII=';
}

library Strings {
    bytes internal constant TABLE =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

    /// @notice Encodes some bytes to the base64 representation
    function encode(bytes memory data) internal pure returns (string memory) {
        uint256 len = data.length;
        if (len == 0) return "";

        // multiply by 4/3 rounded up
        uint256 encodedLen = 4 * ((len + 2) / 3);

        // Add some extra buffer at the end
        bytes memory result = new bytes(encodedLen + 32);
        bytes memory table = TABLE;

        assembly {
            let tablePtr := add(table, 1)
            let resultPtr := add(result, 32)
            for {
                let i := 0
            } lt(i, len) {

            } {
                i := add(i, 3)
                let input := and(mload(add(data, i)), 0xffffff)
                let out := mload(add(tablePtr, and(shr(18, input), 0x3F)))
                out := shl(8, out)
                out := add(
                    out,
                    and(mload(add(tablePtr, and(shr(12, input), 0x3F))), 0xFF)
                )
                out := shl(8, out)
                out := add(
                    out,
                    and(mload(add(tablePtr, and(shr(6, input), 0x3F))), 0xFF)
                )
                out := shl(8, out)
                out := add(
                    out,
                    and(mload(add(tablePtr, and(input, 0x3F))), 0xFF)
                )
                out := shl(224, out)
                mstore(resultPtr, out)
                resultPtr := add(resultPtr, 4)
            }
            switch mod(len, 3)
            case 1 {
                mstore(sub(resultPtr, 2), shl(240, 0x3d3d))
            }
            case 2 {
                mstore(sub(resultPtr, 1), shl(248, 0x3d))
            }
            mstore(result, encodedLen)
        }
        return string(result);
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` decimal representation.
     */
    function toString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}

interface InventoryLike {
    function professions(uint256 id) external pure returns (string memory str);
    function locations(uint256 id ) external pure returns (string memory str);
    function rares(uint256 id) external pure returns (string memory str);
}
