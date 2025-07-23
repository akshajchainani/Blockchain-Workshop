// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataExample {
    // Function that uses calldata
    function getArraySum(uint256[] calldata numbers) external pure returns (uint256) {
        uint256 sum = 0;

        for (uint256 i = 0; i < numbers.length; i++) {
            sum += numbers[i]; // Read-only access to calldata
        }

        return sum;
    }
}
