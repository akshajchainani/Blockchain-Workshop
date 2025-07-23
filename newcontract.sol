// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    mapping(address => bool) registeredVoters;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    modifier onlyRegistered() {
        require(registeredVoters[msg.sender], "Only registered voters can call this function");
        _;
    }

    function registerVoter(address _voter) public onlyOwner {
        registeredVoters[_voter] = true;
    }

    function vote() public onlyRegistered {
        // Voting logic here
    }
}
