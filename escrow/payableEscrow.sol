// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title PayableEscrow
 * @dev Makes the constructor payable so the depositor can fund the escrow at deployment time.
 */
contract PayableEscrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;
    
    /**
     * @notice Initializes and funds the escrow contract.
     * @dev Marked as `payable` to accept the initial deposit.
     * @param _arbiter The trusted third-party arbiter.
     * @param _beneficiary The receiver of the funds.
     */
    constructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }
}
