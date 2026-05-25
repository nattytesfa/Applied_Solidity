// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title ReceiveEther
 * @dev Demonstrates how to write a contract capable of receiving Ether using the `receive()` special function.
 */
contract ReceiveEther {
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    /**
     * @notice Special function called when Ether is sent to the contract with empty calldata.
     * @dev Must be declared `external` and `payable`. Has no function keyword.
     */
    receive() external payable {
        // Empty implementation allows receiving and storing Ether in the contract balance
    }
}
