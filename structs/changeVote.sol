// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title ChangeVote
 * @dev Completed structs exercise. Introduces the ability to modify a vote choice in place
 *      within the storage array.
 */
contract ChangeVote {
    enum Choices { Yes, No }
    
    struct Vote {
        Choices choice;
        address voter;
    }
    
    Vote[] public votes;
    
    /**
     * @notice Registers a vote. Reverts if the caller has already voted.
     * @param choice The chosen option.
     */
    function createVote(Choices choice) external {
        require(!hasVoted(msg.sender), "Already voted");
        votes.push(Vote(choice, msg.sender));
    }
    
    /**
     * @notice Updates the caller's previous vote choice.
     * @dev Iterates through storage array elements and modifies the choice field in place.
     * @param choice The new option.
     */
    function changeVote(Choices choice) external {
        require(hasVoted(msg.sender), "No vote to change");
        
        // Find and update the caller's vote directly in storage
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == msg.sender) {
                votes[i].choice = choice;
                return;
            }
        }
    }
    
    /**
     * @notice Helper function that checks if an address has voted.
     */
    function hasVoted(address _voter) public view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return true;
            }
        }
        return false;
    }
    
    /**
     * @notice Finds and returns the choice made by a voter.
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
