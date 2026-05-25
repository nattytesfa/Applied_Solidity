// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract GroupRegistry {
    address[] public participants;
    
    function registerParticipant(address _participant) external {
        participants.push(_participant);
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