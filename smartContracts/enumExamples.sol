// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title EnumExamples
 * @dev Demonstrates user-defined enums in Solidity and their state representation.
 */
contract EnumExamples {
    // Enums are internally represented by integers (starting from 0)
    enum Foods { Apple, Pizza, Bagel, Banana }

    // State variables storing enum values
    Foods public primaryChoice = Foods.Apple;   // Value is 0
    Foods public secondaryChoice = Foods.Pizza; // Value is 1
    Foods public snackChoice = Foods.Bagel;     // Value is 2
    Foods public dessertChoice = Foods.Banana;   // Value is 3
}
