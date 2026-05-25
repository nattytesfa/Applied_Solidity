// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TipJar {
    address public admin;
    
    constructor() {
        admin = msg.sender;
    }
    
    receive() external payable {
        // Accept incoming ETH transfers
    }
    
    function sendTip() public payable {
        (bool sent, ) = admin.call{value: msg.value}("");
        require(sent, "Tip transfer unsuccessful");
    }
}