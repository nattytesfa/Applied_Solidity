// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FundReceiver {
    address public admin;
    
    constructor() {
        admin = msg.sender;
    }
    
    receive() external payable {
        // Accept incoming ETH transfers
    }
}