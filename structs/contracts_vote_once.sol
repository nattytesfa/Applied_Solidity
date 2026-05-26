// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Define the possible choices for the vote
    enum Choices { Yes, No }

    // Structure defining a single vote entry
    struct Vote {
        Choices choice;
        address voter;
    }

    // Publicly accessible storage array containing all votes cast
    Vote[] public votes;

    /**
     * @notice Creates a new vote instance and permanently stores it in the blockchain array
     * @dev Reverts if the caller has already voted
     * @param _choice The choice selected by the caller (Yes or No)
     */
    function createVote(Choices _choice) external {
        // --- YOUR GOAL: Revert if the address has already voted ---
        require(!hasVoted(msg.sender), "Address has already cast a vote");

        // Construct the struct inline and append it to the storage array
        votes.push(Vote({
            choice: _choice,
            voter: msg.sender
        }));
    }

    /**
     * @notice Checks if a specific address has already cast a vote
     * @param _voter The address to check
     * @return bool True if the address has voted, false otherwise
     */
    function hasVoted(address _voter) public view returns (bool) {
        // Loop through the array to check if this address has an entry
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return true;
            }
        }
        return false;
    }
}