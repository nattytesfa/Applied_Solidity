// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title FilterEvenMemory
 * @dev Demonstrates how to filter and return a newly allocated memory array in a pure function.
 * Since memory arrays cannot be resized with `push()`, a two-pass algorithm is used.
 */
contract FilterEvenMemory {
    /**
     * @notice Filters even numbers from the input array without modifying state, returning the results.
     * @param _numbers The input array of numbers.
     * @return A new memory array containing only the even numbers.
     */
    function filterEven(uint[] calldata _numbers) external pure returns (uint[] memory) {
        // First pass: count the even numbers to determine the size of the memory array.
        uint evenCount = 0;
        for (uint i = 0; i < _numbers.length; i++) {
            if (_numbers[i] % 2 == 0) {
                evenCount++;
            }
        }
        
        // Initialize a fixed-size memory array with the exact size needed.
        uint[] memory evenNumbers = new uint[](evenCount);
        
        // Second pass: populate the memory array with the filtered even numbers.
        uint index = 0;
        for (uint i = 0; i < _numbers.length; i++) {
            if (_numbers[i] % 2 == 0) {
                evenNumbers[index] = _numbers[i];
                index++;
            }
        }
        
        return evenNumbers;
    }
}
