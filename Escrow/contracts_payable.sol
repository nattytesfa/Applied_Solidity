// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    // Added the 'payable' modifier to the constructor
    constructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        
        // Any Ether sent during deployment is now automatically 
        // locked in this contract's balance: address(this).balance
    }
}