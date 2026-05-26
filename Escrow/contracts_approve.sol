// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {

    address public depositor;
    address public beneficiary;
    address public arbiter;

    constructor(address arbiterAddress, address beneficiaryAddress) payable {

        depositor = msg.sender;
        arbiter = arbiterAddress;
        beneficiary = beneficiaryAddress;
    }

    function approve() external {

        uint256 contractBalance = address(this).balance;

        (bool success, ) = beneficiary.call{value: contractBalance}("");

        require(success, "Payment transfer failed");
    }
}