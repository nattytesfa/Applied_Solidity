// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    int8 public a = 25;
    int8 public b = -8;

    int16 public difference;

    constructor() {
        difference = int16(a + (-b));
    }
}