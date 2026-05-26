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

    // --- YOUR GOAL: The approve function ---
    function approve() external {
        // 1. Get the total balance currently held in escrow
        uint256 currentBalance = address(this).balance;

        // 2. Transfer the full amount directly to the beneficiary
        (bool success, ) = beneficiary.call{ value: currentBalance }("");
        
        // 3. Ensure the transfer was successful, otherwise revert
        require(success, "Transfer to beneficiary failed");
    }
}