// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title RemoveMemberMapping
 * @dev Demonstrates how to remove/revoke values inside a mapping by resetting them to their default state value (false).
 */
contract RemoveMemberMapping {
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
     * @notice Revokes the membership of an address.
     * @dev Resetting boolean mapping keys to false frees or updates the state storage slot.
     *      Optionally, in Solidity, `delete members[_member]` can be used to set it to default (false).
     * @param _member The address to remove.
     */
    function removeMember(address _member) external {
        members[_member] = false;
    }
    
    /**
     * @notice Checks if the given address is a member.
     * @param _member The address to query.
     * @return True if the address is a member, false otherwise.
     */
    function isMember(address _member) external view returns (bool) {
        return members[_member];
    }
}
