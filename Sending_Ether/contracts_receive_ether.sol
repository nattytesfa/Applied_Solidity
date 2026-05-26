// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    
    // This special function allows the contract to accept Ether
    // It triggers when a transaction is sent with zero calldata (plain Ether transfers)
    receive() external payable {
        // The incoming Ether is automatically added to the contract's balance
    }
}