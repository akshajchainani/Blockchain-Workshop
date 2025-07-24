// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructExample {

    // Define a struct named 'Person'
    struct Person {
        string name;
        uint age;
        address wallet;
    }

    // Create a state variable of type 'Person'
    Person public person;

    // Array to store multiple Person structs
    Person[] public people;

    // Function to set data in the 'Person' struct
    function setPerson(string memory _name, uint _age, address _wallet) public {
        person = Person(_name, _age, _wallet);
    }

    // Function to add a new person to the people array
    function addPerson(string memory _name, uint _age, address _wallet) public {
        Person memory newPerson = Person(_name, _age, _wallet);
        people.push(newPerson);
    }

    // Function to get details of a person from the array
    function getPerson(uint index) public view returns (string memory, uint, address) {
        require(index < people.length, "Index out of bounds");
        Person storage p = people[index];
        return (p.name, p.age, p.wallet);
    }
}
