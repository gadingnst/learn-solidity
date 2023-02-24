// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract PrimeNumber {
  function isPrimeNumber(int16 _number) public pure returns (bool) {
    if (_number < 2) {
      return false;
    }

    for (int256 i = 2; i < _number; i++) {
      if (_number % i == 0) {
        return false;
      }
    }
    
    return true;
  }
}
