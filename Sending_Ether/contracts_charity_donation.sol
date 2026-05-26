// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    address public owner;
    address public charity;

    constructor(address charityAddress) {
        owner = msg.sender;
        charity = charityAddress;
    }

    receive() external payable {
        // Called when ether is sent with empty calldata
    }

    function tip() public payable {

        (bool success, ) = owner.call{value: msg.value}("");

        require(success, "Transfer failed");
    }

    function donate() public {

        uint256 contractBalance = address(this).balance;

        (bool success, ) = charity.call{value: contractBalance}("");

        require(success, "Donation failed");
    }
}