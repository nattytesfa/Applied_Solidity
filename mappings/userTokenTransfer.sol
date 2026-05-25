// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title UserTokenTransfer
 * @dev Extends UserRegistry to implement a basic transaction/transfer mechanism between registered users.
 */
contract UserTokenTransfer {
    // Defines details of a user
    struct User {
        uint balance;
        bool isActive;
    }
    
    // Mapping that registers users by address
    mapping(address => User) public users;
    
    /**
     * @notice Registers the caller as a new user with an initial balance.
     */
    function createUser() external {
        require(!users[msg.sender].isActive, "User already exists");
        
        users[msg.sender] = User({
            balance: 100,
            isActive: true
        });
    }
    
    /**
     * @notice Transfers a specific token/balance amount from the caller to a recipient.
     * @param _recipient The address of the user receiving the tokens.
     * @param _amount The quantity of tokens to transfer.
     */
    function transfer(address _recipient, uint _amount) external {
        require(users[msg.sender].isActive, "Sender is not an active user");
        require(users[_recipient].isActive, "Recipient is not an active user");
        require(users[msg.sender].balance >= _amount, "Insufficient balance");
        
        // Update user balances in state storage
        users[msg.sender].balance -= _amount;
        users[_recipient].balance += _amount;
    }
}
