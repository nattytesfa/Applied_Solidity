// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title UnsignedIntegers
 * @dev Demonstrates unsigned integers (uint8, uint16, uint256) and their arithmetic in Solidity.
 */
contract UnsignedIntegers {
    // uint8 stores unsigned integers from 0 to 255
    uint8 public a = 15;

    // uint16 stores unsigned integers from 0 to 65,535
    uint16 public b = 256;

    // uint256 stores unsigned integers up to 2^256 - 1
    // The sum of `a` and `b` is calculated and stored.
    // Solidity 0.8+ automatically checks for arithmetic overflows.
    uint256 public sum = uint256(a) + uint256(b);
}
