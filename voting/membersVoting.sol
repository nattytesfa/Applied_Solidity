// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title MembersVoting
 * @dev Fifth step of the voting system. Introduces membership access control so that only
 *      registered members can create proposals and cast votes.
 */
contract MembersVoting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        mapping(address => bool) hasVoted;
        mapping(address => bool) votedYes;
    }

    Proposal[] public proposals;

    // Tracks registered member addresses
    mapping(address => bool) public members;

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    /**
     * @notice Registers the deployer and an initial set of members.
     * @param _members Array of addresses to register as initial members.
     */
    constructor(address[] memory _members) {
        // The deployer is always a member
        members[msg.sender] = true;

        for (uint i = 0; i < _members.length; i++) {
            members[_members[i]] = true;
        }
    }

    /**
     * @notice Creates a new proposal. Only callable by members.
     * @param _target The target contract address.
     * @param _data The calldata to execute on the target.
     */
    function newProposal(address _target, bytes calldata _data) external {
        require(members[msg.sender], "Only members can create proposals");

        proposals.push();
        Proposal storage proposal = proposals[proposals.length - 1];
        proposal.target = _target;
        proposal.data = _data;
        proposal.yesCount = 0;
        proposal.noCount = 0;

        emit ProposalCreated(proposals.length - 1);
    }

    /**
     * @notice Casts or flips a vote. Only callable by members.
     * @param proposalId The index of the proposal.
     * @param supportsProposal True to support, false to oppose.
     */
    function castVote(uint proposalId, bool supportsProposal) external {
        require(members[msg.sender], "Only members can vote");
        require(proposalId < proposals.length, "Invalid proposal ID");

        Proposal storage proposal = proposals[proposalId];

        if (proposal.hasVoted[msg.sender]) {
            if (proposal.votedYes[msg.sender] && !supportsProposal) {
                proposal.yesCount--;
                proposal.noCount++;
                proposal.votedYes[msg.sender] = false;
            } else if (!proposal.votedYes[msg.sender] && supportsProposal) {
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
