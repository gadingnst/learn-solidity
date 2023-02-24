// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract Palindrome {
  function isPalindrome(string memory _keyword) public pure returns (bool) {
    string memory reversedKeyword = reverseString(_keyword);
    return compareString(_keyword, reversedKeyword);
  }
  
  function compareString(string memory _s1, string memory _s2) private pure returns (bool) {
    return keccak256(bytes(_s1)) == keccak256(bytes(_s2));
  }

  function reverseString(string memory _s) private pure returns (string memory) {
    bytes memory b = bytes(_s);
    bytes memory result = new bytes(b.length);
    
    for (uint256 i = 0; i < b.length; i++) {
      result[b.length - 1 - i] = b[i];
    }
    
    return string(result);
  }
}
