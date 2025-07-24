// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {
    uint256 public balance;
    uint256 constant MAX_UINT = 2**256 - 1;

    constructor() {
        balance = 0;
    }

    function deposit(uint256 amount) public {
        uint256 oldBalance = balance;
        uint256 newBalance = balance + amount;

        require(newBalance >= oldBalance, "Overflow error");

        balance = newBalance;
        assert(balance >= oldBalance);
    }
}
