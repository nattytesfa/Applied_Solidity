// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StackClub {
    // Dynamic-sized array tracking member addresses in stack order
    address[] private members;

    // --- YOUR GOAL: Constructor ---
    constructor() {
        // Automatically add the deployer as the foundation member
        members.push(msg.sender);
    }

    // --- YOUR GOAL: Function Security for addMember ---
    function addMember(address newMember) external {
        // Enforce that only existing members can invite someone new
        require(isMember(msg.sender), "Only existing members can add a member");
        members.push(newMember);
    }

    // --- YOUR GOAL: removeLastMember function with Security ---
    function removeLastMember() external {
        // 1. Enforce that only existing members can call this
        require(isMember(msg.sender), "Only existing members can remove a member");
        
        // 2. Extra Safety: Ensure there is actually a member left to pop
        require(members.length > 0, "No members remaining to remove");

        // 3. Pop the most recent element off the top of the stack
        members.pop();
    }

    // Public view function to check membership status
    function isMember(address user) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == user) {
                return true;
            }
        }
        return false;
    }
}