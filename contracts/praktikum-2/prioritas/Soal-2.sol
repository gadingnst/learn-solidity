// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract AltaBook {
    struct Book {
        string title;
        string author;
        uint16 year;
    }

    Book private myBook;

    function setBuku(string memory _title, string memory _author, uint16 _year) public payable {
        myBook = Book(_title, _author, _year);
    }

    function getBuku() public view returns (Book memory) {
        return myBook;
    }
}
