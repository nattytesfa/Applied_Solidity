// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;

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
     * @notice --- YOUR GOAL: Cast Vote ---
     * @dev Fetches a proposal from storage by its ID index and increments the corresponding vote count.
     * @param _proposalId The index position of the proposal in the array.
     * @param _supportsProposal True to vote 'Yes', false to vote 'No'.
     */
    function castVote(uint _proposalId, bool _supportsProposal) external {
        // Fetch a storage pointer to the targeted proposal
        Proposal storage proposal = proposals[_proposalId];

        // Increment the correct counter based on the boolean flag
        if (_supportsProposal) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }
    }
}