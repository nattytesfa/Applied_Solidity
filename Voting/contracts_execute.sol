// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed;
        mapping(address => bool) hasVoted;
        mapping(address => bool) votedYes;
    }

    Proposal[] public proposals;
    mapping(address => bool) public members;

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    constructor(address[] memory _members) {
        members[msg.sender] = true;
        for(uint i = 0; i < _members.length; i++) {
            members[_members[i]] = true;
        }
    }

    function newProposal(address _target, bytes calldata _data) external {
        require(members[msg.sender], "Only members can create proposals");
        proposals.push();
        Proposal storage proposal = proposals[proposals.length - 1];
        proposal.target = _target;
        proposal.data = _data;
        proposal.yesCount = 0;
        proposal.noCount = 0;
        proposal.executed = false;

        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool supportsProposal) external {
        require(members[msg.sender], "Only members can vote");
        Proposal storage proposal = proposals[proposalId];

        if (proposal.hasVoted[msg.sender]) {
            // Voter already voted, only change counts if the vote actually flips
            if (proposal.votedYes[msg.sender] && !supportsProposal) {
                // Changing from yes to no
                proposal.yesCount--;
                proposal.noCount++;
                proposal.votedYes[msg.sender] = false;
            } else if (!proposal.votedYes[msg.sender] && supportsProposal) {
                // Changing from no to yes
                proposal.noCount--;
                proposal.yesCount++;
                proposal.votedYes[msg.sender] = true;
            }
            // If voting the same way again, counts remain unchanged but we still emit the event
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

        // Emit the event for every vote cast, regardless of whether it was a change or a repeat
        emit VoteCast(proposalId, msg.sender);

        // Execute proposal if threshold is reached and not already executed
        if (proposal.yesCount >= 10 && !proposal.executed) {
            proposal.executed = true;
            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Proposal execution failed");
        }
    }
}