// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    enum VoteStates { None, Yes, No }

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    Proposal[] public proposals;
    mapping(uint => mapping(address => VoteStates)) public voteStates;

    // --- YOUR GOAL: 1. Maintain a list of voting members ---
    mapping(address => bool) public isMember;

    // Reusable modifier to restrict access to members only
    modifier onlyMembers() {
        require(isMember[msg.sender], "Registered members only");
        _; // Resumes execution of the underlying function body
    }

    // --- YOUR GOAL: 2. Constructor to initialize members ---
    /**
     * @notice Provisions initial voting members upon deployment
     * @param _initialMembers Array of addresses to grant voting rights
     */
    constructor(address[] memory _initialMembers) {
        // Register the deployer as a member
        isMember[msg.sender] = true;

        // Loop through the input array to register all initial members
        for (uint i = 0; i < _initialMembers.length; i++) {
            isMember[_initialMembers[i]] = true;
        }
    }

    /**
     * @notice Create and store a new proposal
     * @dev Restricted to registered members via onlyMembers modifier
     */
    function newProposal(address _target, bytes calldata _data) external onlyMembers {
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        }));

        uint proposalId = proposals.length - 1;
        emit ProposalCreated(proposalId);
    }

    /**
     * @notice Casts a new vote or changes an existing vote
     * @dev Restricted to registered members via onlyMembers modifier
     */
    function castVote(uint _proposalId, bool _supportsProposal) external onlyMembers {
        require(_proposalId < proposals.length, "Proposal does not exist");

        Proposal storage proposal = proposals[_proposalId];
        
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
    }
}