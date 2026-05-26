// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    // Public state variables for the escrow participants
    address public depositor;
    address public beneficiary;
    address public arbiter;

    // The constructor takes the arbiter and beneficiary addresses (in that order)
    constructor(address _arbiter, address _beneficiary) {
        // 1. Assign the contract deployer as the depositor
        depositor = msg.sender;

        // 2. Store the passed arguments into their respective state variables
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }
}