// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Import the base Hero contract 
import "./Hero.sol";

// --- YOUR GOAL: Create Mage inheriting from Hero ---
contract Mage is Hero {
    // This contract automatically inherits:
    // 1. The public uint 'health' state variable
    // 2. The external 'takeDamage' function
}

// --- YOUR GOAL: Create Warrior inheriting from Hero ---
contract Warrior is Hero {
    // This contract automatically inherits:
    // 1. The public uint 'health' state variable
    // 2. The external 'takeDamage' function
}