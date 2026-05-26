// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    // --- YOUR GOAL: 1. Declare the Approved event ---
    event Approved(uint256 balance);

    constructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }

    function approve() external {
        // Lock it down: Revert if the caller is not the arbiter
        require(msg.sender == arbiter, "Only the arbiter can approve funds");

        uint256 currentBalance = address(this).balance;

        // --- YOUR GOAL: 2. Emit the event before changing contract state ---
        emit Approved(currentBalance);

        // Securely transfer the funds to the beneficiary
        (bool success, ) = beneficiary.call{ value: currentBalance }("");
        
        // Validate that the transfer went through successfully
        require(success, "Transfer to beneficiary failed");
    }
}