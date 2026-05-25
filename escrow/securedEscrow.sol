// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title SecuredEscrow
 * @dev Introduces access control to the `approve` function to ensure only the arbiter can release the funds.
 */
contract SecuredEscrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;
    
    constructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }
    
    /**
     * @notice Releases stored contract funds to the beneficiary.
     * @dev Reverts if the caller is not the designated arbiter.
     */
    function approve() external {
        require(msg.sender == arbiter, "Only arbiter can approve");
        
        uint balance = address(this).balance;
        (bool success, ) = beneficiary.call{value: balance}("");
        require(success, "Transfer to beneficiary failed");
    }
}
