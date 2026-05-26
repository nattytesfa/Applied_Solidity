// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StackClub {

    address[] public clubMembers;

    constructor() {
        clubMembers.push(msg.sender);
    }

    function addMember(address newMember) external {

        require(checkMember(msg.sender), "Members only");

        clubMembers.push(newMember);
    }

    function removeLastMember() external {

        require(checkMember(msg.sender), "Members only");

        clubMembers.pop();
    }

    function checkMember(address member) public view returns (bool) {

        for (uint256 i = 0; i < clubMembers.length; i++) {

            if (clubMembers[i] == member) {
                return true;
            }
        }

        return false;
    }
}