// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title EscrowApprove
 * @dev Introduces the `approve()` function to release contract funds to the beneficiary.
 */
contract EscrowApprove {
    address public depositor;
    address public beneficiary;
    address public arbiter;
    
    constructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }
    
    /**
     * @notice Releases all stored contract funds to the beneficiary.
     * @dev Does not have access control checks yet (anyone can call it at this stage).
     */
    function approve() external {
        uint balance = address(this).balance;
        (bool success, ) = beneficiary.call{value: balance}("");
        require(success, "Transfer to beneficiary failed");
    }
}
