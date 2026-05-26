// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {

    // The constructor must be marked 'payable' to accept Ether during deployment
    constructor() payable {
        // Enforce that the attached value (msg.value) is at least 1 ether
        // If it is less, the transaction reverts and provides an error message
        require(msg.value >= 1 ether, "Must deposit at least 1 Ether");
    }
}