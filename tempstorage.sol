// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoryExample {
    // Function that uses memory data location
    function processArray(uint256[] memory inputArray) public pure returns (uint256[] memory) {
        uint256 length = inputArray.length;
        uint256[] memory resultArray = new uint256[](length);

        for (uint256 i = 0; i < length; i++) {
            resultArray[i] = inputArray[i] * 2; // Modify values in memory
        }

        return resultArray;
    }
}
