// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CheckMembership
 * @dev Demonstrates checking values stored in a mapping without modifying state (view function).
 */
contract CheckMembership {
    // Mapping that registers membership status (address => bool)
    mapping(address => bool) public members;
    
    /**
     * @notice Registers an address as a member.
     * @param _member The address to add.
     */
    function addMember(address _member) external {
        members[_member] = true;
    }
    
    /**
     * @notice Checks if the given address is a member.
     * @dev Reading mapping values directly is highly gas efficient (O(1) lookup time).
     * @param _member The address to query.
     * @return True if the address is a member, false otherwise.
     */
    function isMember(address _member) external view returns (bool) {
        return members[_member];
    }
}
