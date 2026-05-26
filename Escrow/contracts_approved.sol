// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {

    address public depositor;
    address public beneficiary;
    address public arbiter;

    event Approved(uint256 amount);

    constructor(address arbiterAddress, address beneficiaryAddress) payable {

        depositor = msg.sender;
        arbiter = arbiterAddress;
        beneficiary = beneficiaryAddress;
    }

    function approve() external {

        require(msg.sender == arbiter, "Only arbiter can approve");

        uint256 currentBalance = address(this).balance;

        (bool success, ) = beneficiary.call{value: currentBalance}("");

        require(success, "Transfer failed");

        emit Approved(currentBalance);
    }
}