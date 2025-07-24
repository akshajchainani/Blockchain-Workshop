// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynamicArray {
    // Declaring a dynamic array of integers
    uint[] public dynamicArray;

    // Function to add a value to the dynamic array
    function addValue(uint value) public {
        dynamicArray.push(value);
    }

    // Function to get the length of the dynamic array
    function getLength() public view returns (uint) {
        return dynamicArray.length;
    }

    // Function to get a value at a specific index
    function getValue(uint index) public view returns (uint) {
        require(index < dynamicArray.length, "Index out of bounds");
        return dynamicArray[index];
    }

    // Function to remove the last element from the dynamic array
    function removeLast() public {
        require(dynamicArray.length > 0, "Array is empty");
        dynamicArray.pop();
    }
}
