// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StackClub {

    address[] public members;

    function addMember(address _member) external {
        members.push(_member);
    }

    function checkMember(address _member) public view returns (bool) {

        for (uint256 i = 0; i < members.length; i++) {

            if (members[i] == _member) {
                return true;
            }
        }

        return false;
    }
}