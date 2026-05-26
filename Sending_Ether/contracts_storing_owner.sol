// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    // 1. Create a public address state variable called owner
    address public owner;

    // 2. The constructor runs exactly once upon contract deployment
    constructor() {
        // Store the address of the deployer into the owner variable
        owner = msg.sender;
    }
}