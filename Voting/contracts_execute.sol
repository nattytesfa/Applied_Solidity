// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    struct Proposal {
        address target;
        bytes data;
        uint256 yesCount;
        uint256 noCount;
        bool executed;

        mapping(address => bool) hasVoted;
        mapping(address => bool) votedYes;
    }

    Proposal[] public proposals;
    mapping(address => bool) public members;

    event ProposalCreated(uint256 proposalId);
    event VoteCast(uint256 proposalId, address voter);

    constructor(address[] memory initialMembers) {
        members[msg.sender] = true;

        for (uint256 i = 0; i < initialMembers.length; i++) {
            members[initialMembers[i]] = true;
        }
    }

    function newProposal(address target, bytes calldata data) external {

        require(members[msg.sender], "Only members can create proposals");

        proposals.push();
        Proposal storage proposal = proposals[proposals.length - 1];

        proposal.target = target;
        proposal.data = data;
        proposal.executed = false;

        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint256 proposalId, bool support) external {

        require(members[msg.sender], "Only members can vote");

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

        emit VoteCast(proposalId, msg.sender);

        if (proposal.yesCount >= 10 && !proposal.executed) {
            proposal.executed = true;

            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Proposal execution failed");
        }
    }
}