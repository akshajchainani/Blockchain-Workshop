// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingExample {

    // Creating a simple mapping from uint to address
    mapping(uint => address) public addressMap;

    // Creating a nested mapping from uint to another mapping of uint to address
    mapping(uint => mapping(uint => address)) public nestedMap;

    // Function to set a value in the simple mapping
    function setValue(uint key, address value) public {
        addressMap[key] = value;
    }

    // Function to get a value from the simple mapping
    function getValue(uint key) public view returns (address) {
        return addressMap[key];
    }

    // Function to remove a value from the simple mapping
    function removeValue(uint key) public {
        delete addressMap[key];
    }

    // Function to set a value in the nested mapping
    function setNestedValue(uint outerKey, uint innerKey, address value) public {
        nestedMap[outerKey][innerKey] = value;
    }

    // Function to get a value from the nested mapping
    function getNestedValue(uint outerKey, uint innerKey) public view returns (address) {
        return nestedMap[outerKey][innerKey];
    }

    // Function to remove a value from the nested mapping
    function removeNestedValue(uint outerKey, uint innerKey) public {
        delete nestedMap[outerKey][innerKey];
    }
}
