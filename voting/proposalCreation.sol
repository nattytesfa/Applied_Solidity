// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title ProposalCreation
 * @dev First step of the voting system. Introduces the Proposal struct and the ability to create proposals.
 */
contract ProposalCreation {
    // Defines a proposal structure
    struct Proposal {
        address target; // Target contract/wallet to interact with upon execution
        bytes data;     // Calldata payload containing function signature and arguments
        uint yesCount;  // Count of votes supporting the proposal
        uint noCount;   // Count of votes opposing the proposal
    }
    
    // Dynamic array storing all created proposals
    Proposal[] public proposals;
    
    /**
     * @notice Creates a new proposal.
     * @param _target Target contract to call upon execution.
     * @param _data Calldata to send to the target contract.
     */
    function newProposal(address _target, bytes calldata _data) external {
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        }));
    }
}
