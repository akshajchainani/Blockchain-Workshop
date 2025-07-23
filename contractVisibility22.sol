// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VisibilityExample {
    // Public state variable: can be accessed internally and externally
    uint256 public publicVar = 1;

    // Internal state variable: can be accessed within the contract and derived contracts
    uint256 internal internalVar = 2;

    // Private state variable: can only be accessed within this contract
    uint256 private privateVar = 3;

    // Function to get the values of the internal and private variables
    function getInternalVar() public view returns (uint256) {
        return internalVar;
    }

    function getPrivateVar() public view returns (uint256) {
        return privateVar;
    }
}

// Derived contract to demonstrate access to internal state variables
contract DerivedVisibilityExample is VisibilityExample {
    // Function to get the value of the internal variable from the base contract
    function getInternalVarFromBase() public view returns (uint256) {
        return internalVar;
    }

    // Trying to access private variable will cause a compilation error
    // function getPrivateVarFromBase() public view returns (uint256) {
    //     return privateVar; // This line will cause an error
    // }
}
