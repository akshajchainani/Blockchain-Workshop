// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library StringUtils {
    function concatenate(string memory a, string memory b) internal pure returns (string memory) {
        return string(abi.encodePacked(a, b));
    }

    function slice(string memory str, uint start, uint end) internal pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        require(start < end && end <= strBytes.length, "Invalid indices");

        bytes memory result = new bytes(end - start);
        for (uint i = start; i < end; i++) {
            result[i - start] = strBytes[i];
        }
        return string(result);
    }

    function length(string memory str) internal pure returns (uint) {
        return bytes(str).length;
    }
}

contract StringManipulator {
    using StringUtils for string;

    function getConcatenatedString(string memory a, string memory b) public pure returns (string memory) {
        return a.concatenate(b);
    }

    function getSlicedString(string memory str, uint start, uint end) public pure returns (string memory) {
        return str.slice(start, end);
    }

    function getStringLength(string memory str) public pure returns (uint) {
        return str.length();
    }
}
