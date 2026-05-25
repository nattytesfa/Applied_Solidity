// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CastVote
 * @dev Second step of the voting system. Introduces the ability to cast votes on proposals.
 */
contract CastVote {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }
    
    Proposal[] public proposals;
    
    /**
     * @notice Creates a new proposal.
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
     * @notice Casts a vote on an existing proposal.
     * @param proposalId The index of the proposal in the array.
     * @param supportsProposal True to vote YES, false to vote NO.
     */
    function castVote(uint proposalId, bool supportsProposal) external {
        // Enforce valid proposal ID lookup
        require(proposalId < proposals.length, "Invalid proposal ID");
        
        if (supportsProposal) {
            proposals[proposalId].yesCount++;
        } else {
            proposals[proposalId].noCount++;
        }
    }
}
