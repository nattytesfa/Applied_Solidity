// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title MembersMapping
 * @dev Demonstrates how to create a key-value mapping (address to boolean) for group membership tracking.
 */
contract MembersMapping {
    // Declares a public mapping to store membership status of addresses
    mapping(address => bool) public members;
    
    /**
     * @notice Registers an address as a member.
     * @param _member The address to be added as a member.
     */
    function addMember(address _member) external {
        members[_member] = true;
    }
}
