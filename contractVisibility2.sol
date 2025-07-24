// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Visibility {
    // Internal state variables
    uint internal num1;
    uint internal num2;

    // Function to get internal state variables
    function getNums() public view returns (uint, uint) {
        return (num1, num2);
    }
}
