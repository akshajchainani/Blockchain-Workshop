// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ParentContract {
    address internal owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function setResult(uint _result) public virtual onlyOwner {
        // Implementation (e.g., store _result or emit an event)
    }
}

contract ChildContract is ParentContract {
    uint public result;

    function setResult(uint _result) public override onlyOwner {
        result = _result;
    }
}
