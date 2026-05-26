// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    constructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }

    // --- YOUR GOAL: Secured approve function ---
    function approve() external {
        // 1. Lock it down: Revert if the caller is not the arbiter
        require(msg.sender == arbiter, "Only the arbiter can approve funds");

        // 2. Capture the current balance held in the contract
        uint256 currentBalance = address(this).balance;

        // 3. Securely transfer the funds to the beneficiary
        (bool success, ) = beneficiary.call{ value: currentBalance }("");
        
        // 4. Validate that the transfer went through successfully
        require(success, "Transfer to beneficiary failed");
    }
}