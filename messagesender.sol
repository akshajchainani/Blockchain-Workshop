// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MessageSenderExample {
    // State variable to store an address
    address public owner;

    // Event to log the sender address
    event LogSender(address sender);

    // Constructor sets the deployer as the initial owner
    constructor() {
        owner = msg.sender;
    }

    // Function to change the owner, only callable by the current owner
    function changeOwner(address newOwner) public {
        require(msg.sender == owner, "Only the current owner can change the owner.");
        owner = newOwner;
    }

    // Function to log the sender address
    function logSender() public {
        emit LogSender(msg.sender);
    }
}
