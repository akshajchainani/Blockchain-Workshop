// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Visibility {
    address owner;
    uint public  result;

    // Constructor to set the owner
    constructor() {
        owner = msg.sender;
    }

    // Modifier to check if the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Function to set the result, restricted to the owner
    function setResult(uint _result) public onlyOwner {
        result = _result;
    }
}
