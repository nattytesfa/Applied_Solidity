// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract GroupRegistry {
    address[] public participants;
    
    constructor() {
        participants.push(msg.sender);
    }
    
    function registerParticipant(address _newParticipant) external {
        require(isParticipant(msg.sender), "Caller must be an existing participant");
        participants.push(_newParticipant);
    }
    
    function removeLastParticipant() external {
        require(isParticipant(msg.sender), "Caller must be an existing participant");
        participants.pop();
    }
    
    function isParticipant(address _addr) public view returns(bool) {
        for(uint idx = 0; idx < participants.length; idx++) {
            if(participants[idx] == _addr) {
                return true;
            }
        }
        return false;
    }
}