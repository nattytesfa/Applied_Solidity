// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title StackClub
 * @dev Extension of the StackClub contract demonstrating authorization checks and array pop operations.
 */
contract StackClub {
    // Array of member addresses
    address[] public members;
    
    // Constructor adds the contract deployer as the initial member
    constructor() {
        members.push(msg.sender);
    }
    
    /**
     * @notice Adds a new member to the club. Only existing members can add new members.
     * @param _member The address of the new member.
     */
    function addMember(address _member) external {
        require(isMember(msg.sender), "Only members can add new members");
        members.push(_member);
    }
    
    /**
     * @notice Removes the last added member from the club. Only members can execute this.
     */
    function removeLastMember() external {
        require(isMember(msg.sender), "Only members can remove members");
        require(members.length > 0, "No members to remove");
        members.pop();
    }
    
    /**
     * @notice Checks if an address is a member of the club.
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
