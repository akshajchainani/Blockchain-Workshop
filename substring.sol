// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the StringUtils library
import "github.com/Arachnid/solidity-stringutils/src/strings.sol";

contract StringOperations {
    using strings for *; // Attach the library to all types

    function concatenate(string memory a, string memory b) public pure returns (string memory) {
        return a.toSlice().concat(b.toSlice());
    }

    function substringExists(string memory str, string memory substring) public pure returns (bool) {
        return str.toSlice().contains(substring.toSlice());
    }

    function splitString(string memory str, string memory delimiter) public pure returns (string[] memory) {
        strings.slice memory s = str.toSlice();
        strings.slice memory delim = delimiter.toSlice();
        string[] memory parts = new string[](s.count(delim) + 1);
        for (uint i = 0; i < parts.length; i++) {
            parts[i] = s.split(delim).toString();
        }
        return parts;
    }
}
