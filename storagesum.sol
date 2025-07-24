// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StackExample {
    function addNumbers(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 sum = a + b; // 'sum' is a stack variable
        return sum;
    }
}
