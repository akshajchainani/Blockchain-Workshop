// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SerializationExample {
    // Function to serialize a string into bytes
    function serialize(string memory str) public pure returns (bytes memory) {
        return abi.encode(str);
    }

    // Function to deserialize bytes back into a string
    function deserialize(bytes memory data) public pure returns (string memory) {
        return abi.decode(data, (string));
    }
}
