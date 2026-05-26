// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // 1. Create a public, dynamically-sized state variable array
    uint[] public evenNumbers;

    // 2. Create the external function to filter even numbers
    function filterEven(uint[] calldata numbers) external {
        // Loop through the incoming array
        for (uint i = 0; i < numbers.length; i++) {
            // Check if the current number is even using the modulo operator (%)
            if (numbers[i] % 2 == 0) {
                // 3. Push the even number into the storage array
                evenNumbers.push(numbers[i]);
            }
        }
    }
}