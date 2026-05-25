// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SignedIntegers
 * @dev Demonstrates signed integers (int8, int16, etc.) and basic arithmetic operations in Solidity.
 */
contract SignedIntegers {
    // int8 stores signed integers from -128 to 127
    int8 public a = 10;
    int8 public b = -15;

    // int16 stores signed integers from -32,768 to 32,767
    // Calculates the difference between `a` and `b`. (10 - (-15) = 25)
    // Solidity 0.8+ has built-in overflow/underflow checks.
    int16 public difference = int16(a) - int16(b);
}
