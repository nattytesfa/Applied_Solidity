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
     * @notice --- YOUR GOAL: Is Member ---
     * @dev Retrieves membership status directly from the mapping without loops
     * @param _addr The address to check
     * @return bool True if the address is a member, false otherwise
     */
    function isMember(address _addr) external view returns (bool) {
        // Look up the value directly using the address key
        return members[_addr];
    }
}