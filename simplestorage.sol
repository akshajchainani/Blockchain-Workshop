// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    // Storage variable to hold a number
    uint256 public storedNumber;

    // Function to set the storage variable
    function setNumber(uint256 _number) public {
        storedNumber = _number; // The value is stored in blockchain storage
    }

    // Function to retrieve the storage variable
    function getNumber() public view returns (uint256) {
        return storedNumber; // Reading from storage
    }
}
