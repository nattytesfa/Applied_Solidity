// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    enum Status {
        Pending,
        Approved,
        Rejected,
        Shipped
    }

    Status public orderStatus = Status.Pending;

    function approve() external {
        orderStatus = Status.Approved;
    }

    function reject() external {
        orderStatus = Status.Rejected;
    }

    function ship() external {
        orderStatus = Status.Shipped;
    }
}