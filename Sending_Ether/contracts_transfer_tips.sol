// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        // Called when ether is sent with empty calldata
    }

    function tip() public payable {

        (bool success, ) = owner.call{value: msg.value}("");

        require(success, "Transfer failed");
    }
}