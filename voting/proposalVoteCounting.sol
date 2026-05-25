// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title ProposalVoteCounting
 * @dev Fourth step of the voting system. Adds events (ProposalCreated, VoteCast) for off-chain indexing
 *      and combines vote changing logic with event emissions.
 */
contract ProposalVoteCounting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        mapping(address => bool) hasVoted;
        mapping(address => bool) votedYes;
    }

    Proposal[] public proposals;

    // Events allow off-chain applications (front-ends, indexers) to listen for state changes
    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    /**
     * @notice Creates a new proposal and emits ProposalCreated.
     * @param _target The target contract address.
     * @param _data The calldata to execute on the target.
     */
    function newProposal(address _target, bytes calldata _data) external {
        proposals.push();
        Proposal storage proposal = proposals[proposals.length - 1];
        proposal.target = _target;
        proposal.data = _data;
        proposal.yesCount = 0;
        proposal.noCount = 0;

        emit ProposalCreated(proposals.length - 1);
    }

    /**
     * @notice Casts or flips a vote and emits VoteCast for every interaction.
     * @param proposalId The index of the proposal.
     * @param supportsProposal True to support, false to oppose.
     */
    function castVote(uint proposalId, bool supportsProposal) external {
        require(proposalId < proposals.length, "Invalid proposal ID");
        Proposal storage proposal = proposals[proposalId];

        if (proposal.hasVoted[msg.sender]) {
            // Vote flip logic
            if (proposal.votedYes[msg.sender] && !supportsProposal) {
                proposal.yesCount--;
                proposal.noCount++;
                proposal.votedYes[msg.sender] = false;
            } else if (!proposal.votedYes[msg.sender] && supportsProposal) {
                proposal.noCount--;
                proposal.yesCount++;
                proposal.votedYes[msg.sender] = true;
            }
            // If voting the same way again, counts remain unchanged
        } else {
            // First vote
            proposal.hasVoted[msg.sender] = true;
            proposal.votedYes[msg.sender] = supportsProposal;

            if (supportsProposal) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }
        }

        // Emit on every call regardless of whether it was a flip or repeat
        emit VoteCast(proposalId, msg.sender);
    }
}
