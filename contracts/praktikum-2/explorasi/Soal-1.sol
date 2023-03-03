// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ArrayUnique {
    // uint private counter = 0;
    // uint[] private uniqueArr;

    // function setArrayUnique(uint256[] memory _a, uint256[] memory _b) public payable {
    //     uniqueArr = new uint[](_a.length + _b.length);
    //     bool isDuplicate;

    //     for (uint i = 0; i < _a.length; i++) {
    //         uniqueArr[counter] = _a[i];
    //         counter++;
    //     }

    //     for (uint i = 0; i < _b.length; i++) {
    //         isDuplicate = false;
    //         for (uint j = 0; j < _a.length; j++) {
    //             if (_b[i] == _a[j]) {
    //                 isDuplicate = true;
    //                 break;
    //             }
    //         }

    //         if (!isDuplicate) {
    //             uniqueArr[counter] = _b[i];
    //             counter++;
    //         }
    //     }
    // }

    // function getArrayUnique() public view returns(uint256[] memory) {
    //     uint[] memory finalArr = new uint[](counter);

    //     for (uint i = 0; i < counter; i++) {
    //         finalArr[i] = uniqueArr[i];
    //     }

    //     return finalArr;
    // }
}
