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
     * @param _choice The choice selected by the caller (Yes or No)
     */
    function createVote(Choices _choice) external {
        require(!hasVoted(msg.sender), "Address has already cast a vote");

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
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return true;
            }
        }
        return false;
    }

    /**
     * @notice Finds the caller's existing vote and changes its choice. Reverts if no vote exists.
     * @param _newChoice The new selection (Yes or No)
     */
    function changeVote(Choices _newChoice) external {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == msg.sender) {
                votes[i].choice = _newChoice;
                return;
            }
        }
        revert("You have not cast a vote yet");
    }

    /**
     * @notice --- FIX: Added findChoice function ---
     * @dev Finds and returns the specific Choice for a given voter address. Reverts if not found.
     * @param _voter The address of the voter to look up
     * @return Choices The choice matching the voter (Yes or No)
     */
    function findChoice(address _voter) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return votes[i].choice;
            }
        }
        revert("Voter record not found");
    }
}