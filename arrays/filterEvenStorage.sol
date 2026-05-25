// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title FilterEvenStorage
 * @dev Demonstrates filtering even numbers from an input array and persisting them to a storage state variable.
 */
contract FilterEvenStorage {
    // Dynamic storage array to store the filtered even numbers
    uint[] public evenNumbers;
    
    /**
     * @notice Filters even numbers from the input array and appends them to storage.
     * @param _numbers The array of numbers to filter.
     */
    function filterEven(uint[] calldata _numbers) external {
        for (uint i = 0; i < _numbers.length; i++) {
            if (_numbers[i] % 2 == 0) {
                evenNumbers.push(_numbers[i]);
            }
        }
    }
}
