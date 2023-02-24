// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Calculator {
  function add(int256 _a, int256 _b) public pure returns (int256) {
    return _a + _b;
  }
  
  function subtract(int256 _a, int256 _b) public pure returns (int256) {
    return _a - _b;
  }

  function multiply(int256 _a, int256 _b) public pure returns (int256) {
    return _a * _b;
  }

  function divide(int256 _a, int256 _b) public pure returns (int256) {
    return _a / _b;
  }
}
