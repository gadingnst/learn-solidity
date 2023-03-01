// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract BlockchainTrainingParticipant {
    string[] private participantNames;

    function addParticipantName(string memory _name) public payable {
        participantNames.push(_name);
    }
    
    function getParticipantName() public view returns (string[] memory) {
        return participantNames;
    }
}
