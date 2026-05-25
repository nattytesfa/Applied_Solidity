// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MembershipRegistry {
    mapping(address => bool) public enrolledMembers;
    
    function enrollMember(address _account) external {
        enrolledMembers[_account] = true;
    }
    
    function revokeMembership(address _account) external {
        enrolledMembers[_account] = false;
    }
    
    function checkMembership(address _account) external view returns(bool) {
        return enrolledMembers[_account];
    }
}