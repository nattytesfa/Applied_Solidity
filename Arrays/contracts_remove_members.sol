// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {
    address[] public members;
    
    constructor() {
        members.push(msg.sender);
    }
    
    function addMember(address _member) external {
        require(isMember(msg.sender), "Only members can add new members");
        members.push(_member);
    }
    
    function removeLastMember() external {
        require(isMember(msg.sender), "Only members can remove members");
        members.pop();
    }
    
    function isMember(address _member) public view returns(bool) {
        for(uint i = 0; i < members.length; i++) {
            if(members[i] == _member) {
                return true;
            }
        }
        return false;
    }
}