// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SumCalculator {
    // Function to calculate the sum of numbers from 1 to n
    function sum(uint n) public pure returns (uint) {
        uint total = 0;
        for (uint i = 1; i <= n; i++) {
            total += i;
        }
        return total;
    }
}
