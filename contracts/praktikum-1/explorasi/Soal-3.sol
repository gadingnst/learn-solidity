// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Exponential {
  function getExponential(int8 _x, int8 _n) public pure returns (int256) {
    int256 result = 1;
    for (int8 i = 0; i < _n; i++) {
      result *= _x;
    }
    return result;
  }
}
