// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    string public message;

    // Constructor to initialize the message
    constructor() {
        message = "Hello, World!";
    }

    // Function to update the message
    function setMessage(string memory newMessage) public {
        message = newMessage;
    }

    // Function to read the current message (optional since `message` is public)
    function getMessage() public view returns (string memory) {
        return message;
    }
}
