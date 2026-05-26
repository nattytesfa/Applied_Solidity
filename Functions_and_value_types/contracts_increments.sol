// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    uint256 public x;

    constructor(uint256 initialValue) {
        x = initialValue;
    }

    function increment() external {
        x += 1;
    }
}