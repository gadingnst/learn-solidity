// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract CubeSurfaceArea { 
  function getCubeSurfaceArea(uint256 _s) public pure returns (uint256) {
    return 6 * _s * _s;
  }
}
