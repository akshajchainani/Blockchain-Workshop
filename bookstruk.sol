// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Library {
    // Define the Book struct
    struct Book {
        string title;
        bool isFiction;
    }

    // Array to store books
    Book[] public books;

    // Function to add a book using direct initialization
    function addBookDirect(string memory _title, bool _isFiction) public {
        Book memory newBook = Book(_title, _isFiction);
        books.push(newBook);
    }

    // Function to add a book using key-value initialization
    function addBookKeyValue(string memory _title, bool _isFiction) public {
        Book memory newBook;
        newBook.title = _title;
        newBook.isFiction = _isFiction;
        books.push(newBook);
    }

    // Function to add a book using empty initialization with updates
    function addBookEmpty(string memory _title) public {
        Book memory newBook;
        newBook.title = _title;
        // isFiction defaults to false
        books.push(newBook);
    }

    // Function to get book details by index
    function getBook(uint index) public view returns (string memory, bool) {
        require(index < books.length, "Index out of bounds");
        return (books[index].title, books[index].isFiction);
    }

    // Function to update a book's title
    function updateBookTitle(uint index, string memory newTitle) public {
        require(index < books.length, "Index out of bounds");
        books[index].title = newTitle;
    }

    // Function to toggle the isFiction status of a book
    function toggleIsFiction(uint index) public {
        require(index < books.length, "Index out of bounds");
        books[index].isFiction = !books[index].isFiction;
    }
}
