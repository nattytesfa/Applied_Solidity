// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    enum VoteStates { None, Yes, No }

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        // --- YOUR GOAL: Track execution state ---
        bool executed; 
    }

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    Proposal[] public proposals;
    mapping(uint => mapping(address => VoteStates)) public voteStates;
    mapping(address => bool) public isMember;

    modifier onlyMembers() {
        require(isMember[msg.sender], "Registered members only");
        _;
    }

    constructor(address[] memory _initialMembers) {
        isMember[msg.sender] = true;
        for (uint i = 0; i < _initialMembers.length; i++) {
            isMember[_initialMembers[i]] = true;
        }
    }

    function newProposal(address _target, bytes calldata _data) external onlyMembers {
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0,
            executed: false // Explicitly set to false initially
        }));

        uint proposalId = proposals.length - 1;
        emit ProposalCreated(proposalId);
    }

    /**
     * @notice Casts a vote and automatically executes the proposal if yesCount >= 10
     */
    function castVote(uint _proposalId, bool _supportsProposal) external onlyMembers {
        require(_proposalId < proposals.length, "Proposal does not exist");

        Proposal storage proposal = proposals[_proposalId];
        
        // --- SECURITY CHECK: Ensure it hasn't already been executed ---
        require(!proposal.executed, "Proposal has already been executed");

        VoteStates currentState = voteStates[_proposalId][msg.sender];
        VoteStates newState = _supportsProposal ? VoteStates.Yes : VoteStates.No;

        if (currentState == newState) {
            return;
        }

        if (currentState == VoteStates.Yes) {
            proposal.yesCount--;
        } else if (currentState == VoteStates.No) {
            proposal.noCount--;
        }

        if (newState == VoteStates.Yes) {
            proposal.yesCount++;
        } else if (newState == VoteStates.No) {
            proposal.noCount++;
        }

        voteStates[_proposalId][msg.sender] = newState;

        emit VoteCast(_proposalId, msg.sender);

        // --- YOUR GOAL: Check threshold and Execute ---
        if (proposal.yesCount >= 10) {
            // 1. CEI Pattern: Change state BEFORE making external interactions
            proposal.executed = true;

            // 2. Perform the low-level call to target contract using stored payload data
            (bool success, ) = proposal.target.call(proposal.data);
            
            // 3. Ensure the target execution succeeded, otherwise revert the entire transaction
            require(success, "Proposal execution failed");
        }
    }
}