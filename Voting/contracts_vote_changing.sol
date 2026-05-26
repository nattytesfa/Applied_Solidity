// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    // 1. Define states to track if someone hasn't voted, voted Yes, or voted No
    enum VoteStates { None, Yes, No }

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;

    // 2. Public nested mapping: Proposal ID => Voter Address => Their VoteState
    mapping(uint => mapping(address => VoteStates)) public voteStates;

    /**
     * @notice Create and store a new proposal
     * @param _target The smart contract address where calldata will eventually execute
     * @param _data The raw bytes payload containing the function signature and arguments
     */
    function newProposal(address _target, bytes calldata _data) external {
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        }));
    }

    /**
     * @notice --- YOUR GOAL: Vote Changing ---
     * @dev Casts a new vote or changes an existing vote, adjusting counts dynamically.
     * @param _proposalId The index position of the proposal in the array.
     * @param _supportsProposal True to vote 'Yes', false to vote 'No'.
     */
    function castVote(uint _proposalId, bool _supportsProposal) external {
        Proposal storage proposal = proposals[_proposalId];
        
        // Grab a reference to the voter's history for this specific proposal
        VoteStates currentState = voteStates[_proposalId][msg.sender];
        VoteStates newState = _supportsProposal ? VoteStates.Yes : VoteStates.No;

        // If they are casting the exact same vote again, do nothing and return
        if (currentState == newState) {
            return;
        }

        // --- STEP 1: Adjust counts if they are CHANGING an existing vote ---
        if (currentState == VoteStates.Yes) {
            proposal.yesCount--;
        } else if (currentState == VoteStates.No) {
            proposal.noCount--;
        }

        // --- STEP 2: Apply their NEW vote choice ---
        if (newState == VoteStates.Yes) {
            proposal.yesCount++;
        } else if (newState == VoteStates.No) {
            proposal.noCount++;
        }

        // --- STEP 3: Record the state changes back into storage ---
        voteStates[_proposalId][msg.sender] = newState;
    }
}