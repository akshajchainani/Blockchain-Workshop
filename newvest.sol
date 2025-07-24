// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AdvancedConstructor {
    address public owner;
    string public contractName;
    uint256 public creationTime;

    // Constructor sets multiple state variables and includes a condition
    constructor(address _owner, string memory _name) {
        require(_owner != address(0), "Invalid owner address");
        owner = _owner;
        contractName = _name;
        creationTime = block.timestamp;
    }
}
