// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title StackClub
 * @dev Represents a club contract where members can be added, demonstrating simple array storage search.
 */
contract StackClub {
    // Array of member addresses
    address[] public members;
    
    /**
     * @notice Adds a new member to the club.
     * @param _member The address of the new member.
     */
    function addMember(address _member) external {
        members.push(_member);
    }
    
    /**
     * @notice Checks if an address is a member of the club.
     * @dev Iterates through the members array to search for the member.
     * @param _member The address to check.
     * @return True if the address is a member, false otherwise.
     */
    function isMember(address _member) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == _member) {
                return true;
            }
        }
        return false;
    }
}
