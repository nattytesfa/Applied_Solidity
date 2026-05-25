// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title VoteChanging
 * @dev Third step of the voting system. Adds tracking maps (hasVoted, votedYes) inside the Proposal struct
 *      to support vote flipping (yes -> no or no -> yes) and prevent duplicate votes.
 */
contract VoteChanging {
    // Defines a proposal structure with nested mappings
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        // Mappings inside structs are not initialized inline, but stored in contract storage slots
        mapping(address => bool) hasVoted;
        mapping(address => bool) votedYes;
    }
    
    Proposal[] public proposals;
    
    /**
     * @notice Creates a new proposal.
     * @dev Since the Proposal struct contains mappings, we cannot instantiate it as a literal (e.g., Proposal({...})).
     *      Instead, we push an empty element to the array and retrieve its storage reference to assign fields.
     */
    function newProposal(address _target, bytes calldata _data) external {
        proposals.push(); // Push empty struct
        Proposal storage proposal = proposals[proposals.length - 1];
        proposal.target = _target;
        proposal.data = _data;
        proposal.yesCount = 0;
        proposal.noCount = 0;
    }
    
    /**
     * @notice Casts or flips a vote on a proposal.
     * @param proposalId The index of the proposal.
     * @param supportsProposal True to support, false to oppose.
     */
    function castVote(uint proposalId, bool supportsProposal) external {
        require(proposalId < proposals.length, "Invalid proposal ID");
        Proposal storage proposal = proposals[proposalId];
        
        if (proposal.hasVoted[msg.sender]) {
            // Voter has already voted: process a vote flip if applicable
            if (proposal.votedYes[msg.sender] && !supportsProposal) {
                // Flip from YES to NO
                proposal.yesCount--;
                proposal.noCount++;
                proposal.votedYes[msg.sender] = false;
            } else if (!proposal.votedYes[msg.sender] && supportsProposal) {
                // Flip from NO to YES
                proposal.noCount--;
                proposal.yesCount++;
                proposal.votedYes[msg.sender] = true;
            }
        } else {
            // First time voting
            proposal.hasVoted[msg.sender] = true;
            proposal.votedYes[msg.sender] = supportsProposal;
            
            if (supportsProposal) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }
        }
    }
}
