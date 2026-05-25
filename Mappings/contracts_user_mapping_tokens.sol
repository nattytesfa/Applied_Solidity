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
}