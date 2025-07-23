// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VisibilityExample {
    // Public function: can be called internally and externally
    function publicFunction() public pure returns (string memory) {
        return "This is a public function";
    }

    // Internal function: can be called only within the contract and derived contracts
    function internalFunction() internal pure returns (string memory) {
        return "This is an internal function";
    }

    // Private function: can be called only within this contract
    function privateFunction() private pure returns (string memory) {
        return "This is a private function";
    }

    // External function: can be called only from external contracts or transactions
    function externalFunction() external pure returns (string memory) {
        return "This is an external function";
    }

    // Function to demonstrate calling internal and private functions
    function callInternalFunction() public pure returns (string memory) {
        return internalFunction();
    }

    function callPrivateFunction() public pure returns (string memory) {
        return privateFunction();
    }
}

// Derived contract to demonstrate access to internal functions
contract DerivedVisibilityExample is VisibilityExample {
    // Function to call internal function from the base contract
    function callBaseInternalFunction() public pure returns (string memory) {
        return internalFunction();
    }

    // Trying to call private function from the base contract will cause a compilation error
    // function callBasePrivateFunction() public view returns (string memory) {
    //     return privateFunction(); // This line will cause an error
    // }
}
