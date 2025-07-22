// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CountEvenContract {
    function countEven(uint[] memory arr) public pure returns (uint) {
        uint count = 0;
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] % 2 != 0) {
                continue; // Skips odd numbers
            }
            count++;
        }
        return count;
    }
}   