// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract StudentScore {
  function getStrudentScore(int8 _score) public pure returns (string memory) {
    string memory predicate = "Nilai Invalid";

    if (_score >= 80 && _score <= 100) {
        predicate = "A";
    } else if (_score >= 65 && _score <= 79) {
        predicate = "B";
    } else if (_score >= 50 && _score <= 64) {
        predicate = "C";
    } else if (_score >= 35 && _score <= 49) {
        predicate = "D";
    } else if (_score >= 0 && _score <= 34) {
        predicate = "E";
    }
    
    return predicate;
  }
}
