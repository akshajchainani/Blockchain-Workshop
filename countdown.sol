// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CountdownContract {
    function countDown(uint n) public pure returns (uint) {
        uint i = n;
        while (i > 0) {
            i--;
        }
        return i; // Always returns 0
    }
}
