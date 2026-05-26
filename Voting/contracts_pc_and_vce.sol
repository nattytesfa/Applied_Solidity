// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    struct Proposal {
        address target;
        bytes data;
        uint256 yesCount;
        uint256 noCount;

        mapping(address => bool) hasVoted;
        mapping(address => bool) votedYes;
    }

    mapping(uint256 => Proposal) public proposals;
    uint256 public proposalCount;

    event ProposalCreated(uint256 proposalId);
    event VoteCast(uint256 proposalId, address voter);

    function newProposal(address target, bytes calldata data) external {

        uint256 proposalId = proposalCount;
        Proposal storage proposal = proposals[proposalId];

        proposal.target = target;
        proposal.data = data;

        proposalCount++;

        emit ProposalCreated(proposalId);
    }

    function castVote(uint256 proposalId, bool supportsProposal) external {

        Proposal storage proposal = proposals[proposalId];

        if (proposal.hasVoted[msg.sender]) {

            if (proposal.votedYes[msg.sender] && !supportsProposal) {
                proposal.yesCount--;
                proposal.noCount++;
                proposal.votedYes[msg.sender] = false;
            } 
            else if (!proposal.votedYes[msg.sender] && supportsProposal) {
                proposal.noCount--;
                proposal.yesCount++;
                proposal.votedYes[msg.sender] = true;
            }

        } else {

            proposal.hasVoted[msg.sender] = true;
            proposal.votedYes[msg.sender] = supportsProposal;

            if (supportsProposal) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }
        }

        emit VoteCast(proposalId, msg.sender);
    }
}