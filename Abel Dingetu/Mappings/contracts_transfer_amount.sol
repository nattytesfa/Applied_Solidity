// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TokenLedger {
    struct Account {
        uint tokenBalance;
        bool exists;
    }
    
    mapping(address => Account) public accounts;
    
    function openAccount() external {
        require(!accounts[msg.sender].exists, "Account already registered");
        
        accounts[msg.sender] = Account({
            tokenBalance: 100,
            exists: true
        });
    }
    
    function sendTokens(address _to, uint _amount) external {
        require(accounts[msg.sender].exists, "Sender account not found");
        require(accounts[_to].exists, "Recipient account not found");
        require(accounts[msg.sender].tokenBalance >= _amount, "Not enough tokens");
        
        accounts[msg.sender].tokenBalance -= _amount;
        accounts[_to].tokenBalance += _amount;
    }
}