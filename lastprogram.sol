// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataLocationsExample {
    // State variable stored in "storage"
    uint256 public storageVariable;

    // Struct type stored in "storage"
    struct Person {
        string name;
        uint256 age;
    }

    // Dynamic array of structs stored in "storage"
    Person[] public people;

    // Function using "calldata" for input parameters
    function addPerson(string calldata _name, uint256 _age) external {
        // "memory" is used for local variables that need to be modified
        Person memory newPerson = Person({
            name: _name,
            age: _age
        });

        // Add new person to the dynamic array stored in "storage"
        people.push(newPerson);
    }

    // Function demonstrating the use of "stack" for local variables
    function sum(uint256 a, uint256 b) external pure returns (uint256) {
        // Local variables 'a', 'b', and 'result' are stored on the stack
        uint256 result = a + b;
        return result;
    }

    // Function using "memory" for temporary data storage
    function getPerson(uint256 index) external view returns (string memory, uint256) {
        // Retrieve the person from the "storage" array
        Person storage person = people[index];
        // Return the person's details, with the string copied to "memory"
        return (person.name, person.age);
    }
}
