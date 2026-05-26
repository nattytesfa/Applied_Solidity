// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    function filterEven(uint[] calldata numbers) external pure returns (uint[] memory) {
        // --- PASS 1: Count the even numbers to find the required array size ---
        uint evenCount = 0;
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evenCount++;
            }
        }

        // --- PASS 2: Instantiate the fixed-size memory array ---
        // Using the 'new' keyword allows us to set the size dynamically at runtime
        uint[] memory evens = new uint[](evenCount);
        
        // Track the current index position in our new 'evens' array
        uint currentIndex = 0;
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evens[currentIndex] = numbers[i];
                currentIndex++;
            }
        }

        // Return the perfectly sized memory array
        return evens;
    }
}