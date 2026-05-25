// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title StoreOwner
 * @dev Demonstrates saving the deployment address (owner) to contract state.
 */
contract StoreOwner {
    // The address of the owner of this contract
    address public owner;
    
    // Assigns msg.sender (deployer) to owner when contract is initialized
    constructor() {
        owner = msg.sender;
    }
}
