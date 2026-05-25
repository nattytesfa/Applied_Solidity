// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title SingleVote
 * @dev Demonstrates how to define custom structs and assign a single struct instance to storage.
 */
contract SingleVote {
    // Enum representing voting choices
    enum Choices { Yes, No }
    
    // Struct representing a vote
    struct Vote {
        Choices choice;
        address voter;
    }
    
    // Public state variable storing a single vote struct instance
    Vote public vote;
    
    /**
     * @notice Creates and stores a single vote with the caller's address.
     * @param choice The chosen option (Yes or No).
     */
    function createVote(Choices choice) external {
        // Instantiate and store the struct in state storage
        vote = Vote(choice, msg.sender);
    }
}
