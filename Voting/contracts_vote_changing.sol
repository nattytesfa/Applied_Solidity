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

    Proposal[] public proposals;

    function newProposal(address target, bytes calldata data) external {

        proposals.push();
        Proposal storage proposal = proposals[proposals.length - 1];

        proposal.target = target;
        proposal.data = data;
    }

    function castVote(uint256 proposalId, bool support) external {

        Proposal storage proposal = proposals[proposalId];

        if (proposal.hasVoted[msg.sender]) {

            if (proposal.votedYes[msg.sender] && !support) {
                proposal.yesCount--;
                proposal.noCount++;
                proposal.votedYes[msg.sender] = false;
            } 
            else if (!proposal.votedYes[msg.sender] && support) {
                proposal.noCount--;
                proposal.yesCount++;
                proposal.votedYes[msg.sender] = true;
            }

        } else {

            proposal.hasVoted[msg.sender] = true;
            proposal.votedYes[msg.sender] = support;

            if (support) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }
        }
    }
}