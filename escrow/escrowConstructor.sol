// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title EscrowConstructor
 * @dev Adds constructor logic to initialize actor roles upon deployment.
 */
contract EscrowConstructor {
    address public depositor;
    address public beneficiary;
    address public arbiter;
    
    /**
     * @notice Initializes the escrow roles.
     * @param _arbiter The trusted third-party arbiter.
     * @param _beneficiary The receiver of the funds.
     */
    constructor(address _arbiter, address _beneficiary) {
        depositor = msg.sender; // msg.sender is the depositor deploying this contract
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }
}
