// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function createUser() external {
        require(!users[msg.sender].isActive, "User already exists and is active");

        users[msg.sender] = User({
            balance: 100,
            isActive: true
        });
    }

    /**
     * @notice --- YOUR GOAL: Transfer Amount & Contract Security ---
     * @dev Transfers internal tokens from the caller to a recipient.
     * @param _recipient The address receiving the tokens.
     * @param _amount The number of tokens to transfer.
     */
    function transfer(address _recipient, uint _amount) external {
        // --- SECURITY CHECK 1: Ensure both users are active ---
        require(users[msg.sender].isActive, "Sender account is not active");
        require(users[_recipient].isActive, "Recipient account is not active");

        // --- SECURITY CHECK 2: Ensure sender has enough tokens ---
        require(users[msg.sender].balance >= _amount, "Insufficient balance for transfer");

        // --- STATE MODIFICATION: Update Balances ---
        // Subtract the amount from the sender's balance
        users[msg.sender].balance -= _amount;

        // Add the amount to the recipient's balance
        users[_recipient].balance += _amount;
    }
}