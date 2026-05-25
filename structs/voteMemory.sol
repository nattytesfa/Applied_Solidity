// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title VoteMemory
 * @dev Demonstrates instantiating a struct in memory and returning it from a read-only view function.
 */
contract VoteMemory {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }
    
    /**
     * @notice Creates a vote struct in memory and returns it.
     * @dev The data location parameter `memory` is required when returning struct or array types.
     * @param choice The chosen option.
     * @return A temporary Vote struct stored in memory.
     */
    function createVote(Choices choice) external view returns (Vote memory) {
        return Vote(choice, msg.sender);
    }
}
