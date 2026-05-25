// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title OwnerWithdrawal
 * @dev Combines require conditions, payment receiving, and safe transfer of the contract's entire balance.
 */
contract OwnerWithdrawal {
    address public owner;
    
    // Deploys the contract, enforcing that the constructor receives at least 1 Ether
    constructor() payable {
        require(msg.value >= 1 ether, "Must send at least 1 ether");
        owner = msg.sender;
    }
    
    /**
     * @notice Allows the owner to withdraw the entire contract balance.
     * @dev Reverts if the caller is not the owner, or if the transfer call fails.
     */
    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        
        uint balance = address(this).balance;
        (bool success, ) = owner.call{value: balance}("");
        require(success, "Withdrawal failed");
    }
}
