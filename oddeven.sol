// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BreakExample {
    function findFirstEven(uint[] memory arr) public pure returns (uint) {
        uint evenNumber = 0;
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] % 2 == 0) {
                evenNumber = arr[i];
                break; // Exits the loop when the first even number is found
            }
        }
        return evenNumber;
    }
}