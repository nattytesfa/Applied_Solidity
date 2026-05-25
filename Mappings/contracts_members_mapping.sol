// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MembershipRegistry {
    mapping(address => bool) public enrolledMembers;
    
    function enrollMember(address _account) external {
        enrolledMembers[_account] = true;
    }
}