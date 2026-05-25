// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title UserRegistry
 * @dev Demonstrates mapping key types to custom struct data types in Solidity.
 */
contract UserRegistry {
    // Defines details of a user
    struct User {
        uint balance;
        bool isActive;
    }
    
    // Mapping that registers users by address
    mapping(address => User) public users;
    
    /**
     * @notice Registers the caller as a new user with an initial balance.
     * @dev Ensures that a user cannot register twice.
     */
    function createUser() external {
        require(!users[msg.sender].isActive, "User already exists");
        
        // Instantiate and store a User struct instance directly in the mapping
        users[msg.sender] = User({
            balance: 100,
            isActive: true
        });
    }
}
