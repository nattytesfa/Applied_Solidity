// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    // --- YOUR GOAL: The external, view createVote function ---
    function createVote(Choices _choice) external view returns (Vote memory) {
        // Create the struct instance directly in memory and return it
        return Vote({
            choice: _choice,
            voter: msg.sender
        });
    }
}