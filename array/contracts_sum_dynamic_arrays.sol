// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // A pure, external function that accepts a dynamic-size array of uints and returns their sum
    function sum(uint[] calldata numbers) external pure returns (uint) {
        uint totalSum = 0;

        // Use the length member to dynamically determine how many elements are in the array
        for (uint i = 0; i < numbers.length; i++) {
            totalSum += numbers[i];
        }

        return totalSum;
    }
}