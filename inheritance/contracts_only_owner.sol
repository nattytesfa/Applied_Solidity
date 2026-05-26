// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Ownable {
    // --- YOUR GOAL: Define the owner state variable ---
    address public owner;

    // --- YOUR GOAL: Implement the onlyOwner modifier ---
    modifier onlyOwner() {
        // Ensure the account calling the function is the contract owner
        require(msg.sender == owner, "Ownable: caller is not the owner");
        _; // Resume execution of the protected function (e.g., markPrice)
    }

    /**
     * @notice Sets the initial owner to the deployer of the contract
     */
    constructor() {
        // msg.sender here is the account deploying the derived Collectible contract
        owner = msg.sender;
    }
}