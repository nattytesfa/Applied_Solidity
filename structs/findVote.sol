// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title FindVote
 * @dev Demonstrates iteration over a struct array to search for matching elements.
 */
contract FindVote {
    enum Choices { Yes, No }
    
    struct Vote {
        Choices choice;
        address voter;
    }
    
    Vote[] public votes;
    
    /**
     * @notice Registers a vote.
     * @param choice The chosen option.
     */
    function createVote(Choices choice) external {
        votes.push(Vote(choice, msg.sender));
    }
    
    /**
     * @notice Checks if an address has already voted.
     * @param _voter The address to check.
     * @return True if the address has voted, false otherwise.
     */
    function hasVoted(address _voter) external view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return true;
            }
        }
        return false;
    }
    
    /**
     * @notice Finds and returns the choice made by a voter.
     * @param _voter The address of the voter.
     * @return The choice made (Yes or No).
     */
    function findChoice(address _voter) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return votes[i].choice;
            }
        }
        revert("Vote not found");
    }
}
