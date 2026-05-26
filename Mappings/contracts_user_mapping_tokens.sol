// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Define the User struct properties
    struct User {
        uint balance;
        bool isActive;
    }

    // --- YOUR GOAL: 1. Create a public mapping mapping address to User ---
    mapping(address => User) public users;

    /**
     * @notice --- YOUR GOAL: 2. Create User & Contract Security ---
     * @dev Provisions 100 tokens to a new user. Reverts if they already exist.
     */
    function createUser() external {
        // --- SECURITY CHECK ---
        // Ensure the sender is not already an active user
        require(!users[msg.sender].isActive, "User already exists and is active");

        // --- STRUCT INITIALIZATION ---
        // Option A: Instantiating directly into the mapping slot
        users[msg.sender] = User({
            balance: 100,
            isActive: true
        });

        // Alternative Option B (Equivalent):
        // users[msg.sender].balance = 100;
        // users[msg.sender].isActive = true;
    }
}