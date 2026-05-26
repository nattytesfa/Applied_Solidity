// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Mapping that maps an address to its membership status
    mapping(address => bool) public members;

    /**
     * @notice Adds an address as a member
     * @param _newMember The wallet address to grant membership to
     */
    function addMember(address _newMember) external {
        members[_newMember] = true;
    }

    /**
     * @notice Retrieves membership status directly from the mapping
     * @param _addr The address to check
     * @return bool True if the address is a member, false otherwise
     */
    function isMember(address _addr) external view returns (bool) {
        return members[_addr];
    }

    /**
     * @notice --- YOUR GOAL: Remove Member ---
     * @dev Sets the membership status of a specific address to false
     * @param _memberToRemove The address to revoke membership from
     */
    function removeMember(address _memberToRemove) external {
        // Direct assignment bypassing any shifting operations
        members[_memberToRemove] = false;
    }
}