// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title BooleanVariables
 * @dev Demonstrates the declaration and initialization of boolean state variables in Solidity.
 */
contract BooleanVariables {
    // A public boolean variable initialized to true.
    // Solidity automatically generates a getter function for public state variables.
    bool public myVariable = true;

    // Explicit boolean variables demonstrating different truth states
    bool public isCompleted = true;
    bool public isFailed = false;
}
