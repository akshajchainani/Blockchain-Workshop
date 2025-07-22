// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AgeChecker {
    // Function to check if the given age is adult or minor
    function checkAge(uint age) public pure returns (string memory) {
        if (age >= 18) {
            return "You are an adult.";
        } else {
            return "You are a minor.";
        }
    }
}