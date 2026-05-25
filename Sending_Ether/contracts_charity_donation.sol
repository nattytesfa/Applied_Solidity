// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DonationBox {
    address public admin;
    address public charityAddress;
    
    constructor(address _charityAddress) {
        admin = msg.sender;
        charityAddress = _charityAddress;
    }
    
    receive() external payable {
        // Accept incoming ETH transfers
    }
    
    function sendTip() public payable {
        (bool sent, ) = admin.call{value: msg.value}("");
        require(sent, "Tip transfer unsuccessful");
    }
    
    function forwardToCharity() public {
        uint currentBalance = address(this).balance;
        (bool sent, ) = charityAddress.call{value: currentBalance}("");
        require(sent, "Charity donation unsuccessful");
    }
}