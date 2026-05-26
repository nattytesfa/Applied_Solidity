// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Change the name from ArrayExercise to Contract
contract Contract {
    // A pure, external function that accepts a fixed-size array of 5 uints and returns their sum
    function sum(uint[5] calldata numbers) external pure returns (uint) {
        uint totalSum = 0;

        // Loop through all 5 elements of the fixed-sized array
        for (uint i = 0; i < 5; i++) {
            totalSum += numbers[i];
        }

        return totalSum;
    }
}