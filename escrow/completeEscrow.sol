// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title CompleteEscrow
 * @dev The completed escrow contract version. Integrates constructor funding, arbiter security,
 *      and an event emitter to signal off-chain interfaces that the transaction was approved.
 */
contract CompleteEscrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;
    
    // Event emitted when the escrow is successfully approved and funds are sent
    event Approved(uint balance);
    
    constructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }
    
    /**
     * @notice Releases stored contract funds to the beneficiary.
     * @dev Restricts access to the arbiter, transfers the balance, and emits the Approved event.
     */
    function approve() external {
        require(msg.sender == arbiter, "Only arbiter can approve");
        
        uint balance = address(this).balance;
        (bool success, ) = beneficiary.call{value: balance}("");
        require(success, "Transfer to beneficiary failed");
        
        // Emit the event so block explorers and front-end clients can track this state change
        emit Approved(balance);
    }
}
