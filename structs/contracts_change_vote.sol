// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    enum Choices {
        Yes,
        No
    }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    function createVote(Choices choice) external {
        require(!hasVoted(msg.sender), "Already voted");
        votes.push(Vote(choice, msg.sender));
    }

    function changeVote(Choices newChoice) external {
        require(hasVoted(msg.sender), "No vote to change");

        for (uint256 i = 0; i < votes.length; i++) {
            if (votes[i].voter == msg.sender) {
                votes[i].choice = newChoice;
                return;
            }
        }
    }

    function hasVoted(address voter) public view returns (bool) {
        for (uint256 i = 0; i < votes.length; i++) {
            if (votes[i].voter == voter) {
                return true;
            }
        }
        return false;
    }

    function findChoice(address voter) external view returns (Choices) {
        for (uint256 i = 0; i < votes.length; i++) {
            if (votes[i].voter == voter) {
                return votes[i].choice;
            }
        }

        revert("Vote not found");
    }
}