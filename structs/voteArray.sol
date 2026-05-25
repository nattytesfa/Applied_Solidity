// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title VoteArray
 * @dev Demonstrates storing custom struct instances in a dynamic storage array.
 */
contract VoteArray {
    enum Choices { Yes, No }
    
    struct Vote {
        Choices choice;
        address voter;
    }
    
    // Dynamic array of Vote structs
    Vote[] public votes;
    
    /**
     * @notice Instantiates a vote struct and appends it to the dynamic votes array.
     * @param choice The chosen option.
     */
    function createVote(Choices choice) external {
        votes.push(Vote(choice, msg.sender));
    }
}
