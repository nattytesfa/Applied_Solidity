// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// FIX: Rename the contract from "Contract" to "StackClub"
contract StackClub {
    // 1. Declare a dynamic-sized array of addresses for members
    address[] private members;

    // 2. Add an address to the end (top) of the members stack
    function addMember(address newMember) external {
        members.push(newMember);
    }

    // 3. Check if an address exists within the members array
    function isMember(address user) public view returns (bool) {
        // Loop through the entire stack to find a match
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == user) {
                return true;
            }
        }
        // If the loop finishes without a match, they are not a member
        return false;
    }
}