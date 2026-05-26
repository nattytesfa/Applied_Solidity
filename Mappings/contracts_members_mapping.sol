// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // --- YOUR GOAL: 1. Create a public mapping mapping address to bool ---
    // This allows $O(1)$ constant-time lookups to check membership status
    mapping(address => bool) public members;

    /**
     * @notice --- YOUR GOAL: 2. Add an address as a member ---
     * @param _newMember The wallet address to grant membership to
     */
    function addMember(address _newMember) external {
        // Store 'true' at the key location specified by the _newMember address
        members[_newMember] = true;
    }
}