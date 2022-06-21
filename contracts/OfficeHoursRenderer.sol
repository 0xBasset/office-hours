// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract OfficeHoursRenderer {

    function getURI(uint256 id, uint256 profession, uint256 timezone, uint256 ratePerSecond) external pure returns(string memory uri) {
        uri = _getMetadata(id, profession, timezone,ratePerSecond);
    }

    function _getMetadata(uint256 id, uint256 profession, uint256 timezone, uint256 ratePerSecond) internal pure returns (string memory meta) {
        string memory svg = _getSvg(id);

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

    function _getAttributes(uint256 profession, uint256 timezone, uint256 ratePerSecond) internal pure returns (string memory atts_) {
        atts_ = string(abi.encodePacked(
            '{"trait_type":"Profession","value":"', _getName(profession),'"},',
            '{"trait_type":"Timezone","value":"',_getTimezone(timezone),'"},',
            '{"trait_type":"City","value":"',_getCity(timezone),'"},'
            '{"trait_type":"Schedule","value":"',_schedule(profession),'"},',
            '{"display_type": "boost_number","trait_type": "zug bonus", "value":', 
            Strings.toString(ratePerSecond * 3600),'}'
        ));
    }

    function _getName(uint256 id) internal pure returns (string memory name_) {
        if (id ==  1) name_ = "Farmer";
        if (id ==  2) name_ = "NFT Influencer";
        if (id ==  3) name_ = "VC Chad";
        if (id ==  4) name_ = "Floorboi";
        if (id ==  5) name_ = "Moonboi";
        if (id ==  6) name_ = "Bartender";
        if (id ==  7) name_ = "Rugpuller";
        if (id ==  8) name_ = "Actress";
        if (id ==  9) name_ = "Doctor";
        if (id == 10) name_ = "Chef";
    }

    function _getCity(uint256 id) internal pure returns(string memory loc) {
        // todo fill complete
        if (id == 1) loc = "Midway Atoll";
        if (id == 2) loc = "Honolulu";
        if (id == 3) loc = "New Delhi";
        if (id == 4) loc = "Anchorage";
        if (id == 5) loc = "Los Angeles";
        if (id == 6) loc = "Denver";
        if (id == 7) loc = "Mexico City";
        if (id == 8) loc = "New York City";
        if (id == 9) loc = "";
        if (id == 10) loc = "Rio de Janeiro";
        if (id == 11) loc = "Santiago Island";
        if (id == 12) loc = "Reykjavik";
        if (id == 13) loc = "";
        if (id == 14) loc = "Cairo";
        if (id == 15) loc = "Istambul";
        if (id == 16) loc = "Dubai";
        if (id == 17) loc = " Dhaka";
    }

    function _getTimezone(uint256 id) internal pure returns (string memory timezone) {
        string memory prefix = "GMT";
        string memory time;

        if (id < 11)  time = string(abi.encodePacked("-", 12 - id));
        if (id >= 11) time = string(abi.encodePacked("+", id - 11));

        timezone = string(abi.encodePacked(prefix, time));
    }

    function _schedule(uint256 id) internal pure returns (string memory sche_) {
        // Todo fill
        if (id ==  1) sche_ = "Monday to Friday 4am to 3pm";
        if (id ==  2) sche_ = "Monday to Sunday 3pm to 6pm";
        if (id ==  3) sche_ = "Monday to Friday 10am to 6pm";
        if (id ==  4) sche_ = "Floorboi";
        if (id ==  5) sche_ = "Moonboi";
        if (id ==  6) sche_ = "Bartender";
        if (id ==  7) sche_ = "Rugpuller";
        if (id ==  8) sche_ = "Actress";
        if (id ==  9) sche_ = "Doctor";
        if (id == 10) sche_ = "Chef";
    }

    function _getSvg(uint256 id) internal pure returns (string memory svg) {
        svg = Strings.encode(abi.encodePacked(header, wrapTag(background), wrapTag(character), wrapTag(location) ,footer));
    }

    function wrapTag(string memory uri) internal pure returns (string memory) {
        return string(abi.encodePacked('<image x="0" y="0" width="64" height="64" image-rendering="pixelated" preserveAspectRatio="xMidYMid" xlink:href="data:image/png;base64,', uri, '"/>'));
    }

    string constant header = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" id="office" width="100%" height="100%" version="1.1" viewBox="0 0 64 64">';
    string constant footer = '<style>#office{shape-rendering: crispedges;image-rendering: -webkit-crisp-edges;image-rendering: -moz-crisp-edges;image-rendering: crisp-edges;image-rendering: pixelated;-ms-interpolation-mode: nearest-neighbor;}</style></svg>';
    string constant background = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAQMAAABHGizWAAAABlBMVEVA4ND///+kAev3AAAAmklEQVR42u3dsQlAIRBEQTv4Jdl/NxbwQQMb0IMNhNl8Mu+ltmaWXZ";
    string constant location   = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgAgMAAAAAulYGAAAACVBMVEUAAAD78jb78jZLIy7NAAAAAnRSTlMAAHaTzTgAAAEtSURBVHja7duxbsIwFEDRR6X8H4v3fh9vydexZOnQEIzBqKrUOpHOmULT6qoerIcDEQAAAABwfKfXP57OUWKZI7eXXdm/u8z9P/sY9R8LCwsfP/zjnau0O9J0/r7K7W6zh6WdS1hYeEfhqVT7WCmdkat7w1ILCwv/6cx1n6/WqSri+eo2fUV7df201MLCwv8VXqelh9HKUgsLC+975irbgVW+nbmi+r2Hlyszl7Cw8Jjw7wevzNlSCwsLD5i5np4ehnMuYWHhQ4TfPyS01MLCwruYuS7V9e0zWc17xnrSaqavOzOXsLDwmPCrc64ls9rDesdZzrmEhYVHzVyxPTjs8O0fYWFhAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANiDL2+PTvEPS5RoAAAAAElFTkSuQmCC";
    string constant character = "iVBORw0KGgoAAAANSUhEUgAAAeAAAAHgBAMAAACP+qOmAAAAHlBMVEUAAAABIxABLxZOIwEAAAAEjUPsawT3pmH78jb///81duRzAAAABHRSTlMAAAAAs5NmmgAAAm5JREFUeNrt3cFtwjAAhlG3G7BCVmCFjJ0VWCErsEIFhxg7dmIqSER474DaFKg+JYdfiNIQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA1v1s9pu66Wacbnbw+21nWLBgwYIFCxb8DUurv92cbjfXPeeWS1qwYMGCBQsWfMClFV/TinPrMn3lDAsWLFiwYMGCLa0252lQZbJjpZEVJ5gzLFiwYMGCBQu2tCojq0v31TXdUqfaT8f3zi2XtGDBggULFiz4I5dWw8iq2mxuuaQFCxYsWLBgwR+5tPp0ZMW3u3frjy3d+X5scIYFCxYsWLBgwZbW49Ia02PD4twa0/uF9FksLcGCBQsWLFiwpTVfWtnHOpTm1vL9LC3BggULFixYsKU1X1rZjCq9VtXw2pelJViwYMGCBQu2tCpLK/uU0mxBlb4tvS3e0hIsWLBgwYIFW1pLSyuTLa1Qe4SlJViwYMGCBQu2tOZL676RzoXd1C1urvvSuqTPYmkJFixYsGDBgi2tUP7bw+zb1mOWlmDBggULFizY0lpdWv9kaQkWLFiwYMGCBQsWLFiwYMGCBQuu2uQz4sP0g9Zj8Qm8piVYsGDBggULtrRC+f8eNrw3PnsffLyL/3soWLBgwYIFC7a0VudWHFTX9WPvG1kuacGCBQsWLFjwhy+tbG49730jyyUtWLBgwYIFCz7C0qrqC8cGZ1iwYMGCBQsWbGm9dF+FnTaXS1qwYMGCBQsWfJil1T/9iMEZFixYsGDBggVbWq8fWVvMLZe0YMGCBQsWLBgAAAAAAAAAAAAAAAAAYBd/x+9jyqeNx4wAAAAASUVORK5CYII=";
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
