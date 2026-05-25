// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        mapping(address => bool) hasVoted;
        mapping(address => bool) votedYes;
    }
    
    Proposal[] public proposals;
    
    function newProposal(address _target, bytes calldata _data) external {
        proposals.push();
        Proposal storage proposal = proposals[proposals.length - 1];
        proposal.target = _target;
        proposal.data = _data;
        proposal.yesCount = 0;
        proposal.noCount = 0;
    }
    
    function castVote(uint proposalId, bool supportsProposal) external {
        Proposal storage proposal = proposals[proposalId];
        
        if(proposal.hasVoted[msg.sender]) {
            // Changing vote
            if(proposal.votedYes[msg.sender] && !supportsProposal) {
                // Changing from yes to no
                proposal.yesCount--;
                proposal.noCount++;
                proposal.votedYes[msg.sender] = false;
            } else if(!proposal.votedYes[msg.sender] && supportsProposal) {
                // Changing from no to yes
                proposal.noCount--;
                proposal.yesCount++;
                proposal.votedYes[msg.sender] = true;
            }
            // If voting the same way again, do nothing
        } else {
            // New vote
            proposal.hasVoted[msg.sender] = true;
            proposal.votedYes[msg.sender] = supportsProposal;
            
            if(supportsProposal) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }
        }
    }
}