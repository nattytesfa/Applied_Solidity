// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// --- STEP 1: Keep Ownable in the same file instead of importing it ---
contract Ownable {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Ownable: caller is not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }
}

// --- STEP 2: Transferable can now cleanly inherit from Ownable directly ---
contract Transferable is Ownable {
    /**
     * @notice Transfer ownership to another address
     * @dev Restricted to the current owner via the inherited onlyOwner modifier
     * @param _newOwner The address of the account receiving ownership
     */
    function transfer(address _newOwner) external onlyOwner {
        // Prevent accidental transfers to the 0x0 zero address
        require(_newOwner != address(0), "New owner is the zero address");
        
        // Update the inherited owner storage variable to the new address
        owner = _newOwner;
    }
}