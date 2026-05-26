// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    // --- YOUR GOAL: 1. Create a public storage array of Vote structs ---
    Vote[] public votes;

    // --- YOUR GOAL: 2. Create the vote and push it onto the array ---
    function createVote(Choices _choice) external {
        // Instantiate the Vote struct and push it directly into the storage array
        votes.push(Vote({
            choice: _choice,
            voter: msg.sender
        }));
    }
}