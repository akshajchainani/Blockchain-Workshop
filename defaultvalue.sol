// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DefaultValues {
    uint public A;            // Defaults to 0
    bool public B;            // Defaults to false
    string public C;          // Defaults to ""
    address public D;         // Defaults to address(0)
    bytes32 public E;         // Defaults to bytes32(0)

    enum Status { Pending, Active, Inactive }
    Status public F;          // Defaults to the first member of the Enum, i.e., Pending

    function getDefaultValues() 
        public 
        view 
        returns (uint, bool, string memory, address, bytes32, Status) 
    {
        return (A, B, C, D, E, F);
    }
}