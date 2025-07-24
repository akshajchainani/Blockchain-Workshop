// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {
    uint256 public balance;
    uint256 constant MAX_UINT = 2**256 - 1;

    constructor() {
        balance = 0;
    }
}
