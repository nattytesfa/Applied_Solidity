// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title ExecuteProposal
 * @dev Final step of the voting system. Adds an `executed` flag and automatic proposal execution
 *      when the YES vote count reaches a threshold (10 votes).
 */
contract ExecuteProposal {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed;  // Prevents a proposal from being executed multiple times
        mapping(address => bool) hasVoted;
        mapping(address => bool) votedYes;
    }

    Proposal[] public proposals;
    mapping(address => bool) public members;

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    /**
     * @notice Registers the deployer and initial members.
     * @param _members Array of addresses to register.
     */
    constructor(address[] memory _members) {
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
        proposal.executed = false;

        emit ProposalCreated(proposals.length - 1);
    }

    /**
     * @notice Casts or flips a vote. Automatically executes the proposal when >=10 YES votes are reached.
     * @dev Execution uses a low-level `.call()` to invoke the target with the stored calldata payload.
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

        // Execute the proposal if the YES threshold is reached and it hasn't been executed yet
        if (proposal.yesCount >= 10 && !proposal.executed) {
            proposal.executed = true;
            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Proposal execution failed");
        }
    }
}
