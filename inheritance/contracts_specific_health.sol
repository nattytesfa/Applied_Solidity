// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Import the updated base Hero contract that requires a health argument
import "./Hero.sol";

// --- YOUR GOAL: Initialize Mage with 50 health ---
contract Mage is Hero(50) {
    // Under the hood, 50 is forwarded directly to the Hero constructor
}

// --- YOUR GOAL: Initialize Warrior with 200 health ---
contract Warrior is Hero(200) {
    // Under the hood, 200 is forwarded directly to the Hero constructor
}