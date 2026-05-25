// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title Ownable
 * @dev Base contract providing an ownership model with the `onlyOwner` modifier.
 */
contract Ownable {
    address public owner;
    
    // Constructor sets the deployer as the initial owner
    constructor() {
        owner = msg.sender;
    }
    
    /**
     * @notice Modifier that restricts function access to the owner.
     * @dev `_;` is the placeholder for the function body that uses this modifier.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
}
