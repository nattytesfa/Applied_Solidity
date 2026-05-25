// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title StringLiterals
 * @dev Demonstrates how string literals are stored as bytes32 (fixed-size) and string (dynamic-size) in Solidity.
 */
contract StringLiterals {
    // bytes32 is cheaper for gas when storing short strings (up to 32 characters/bytes)
    bytes32 public greeting = "Hello World";

    // string is a dynamically-sized UTF-8-encoded type, suitable for arbitrary-length text
    string public message = "This is first bytes32 and string practice.";
}
