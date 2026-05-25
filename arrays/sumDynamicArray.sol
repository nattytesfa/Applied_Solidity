// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title SumDynamicArray
 * @dev Demonstrates processing dynamic-size arrays in Solidity.
 */
contract SumDynamicArray {
    /**
     * @notice Computes the sum of a dynamic-size array.
     * @param _numbers A dynamically-sized array of uints.
     * @return The sum of the numbers in the array.
     */
    function sum(uint[] calldata _numbers) external pure returns (uint) {
        uint total = 0;
        
        // Loop through all elements in the dynamic array using `.length`.
        for (uint i = 0; i < _numbers.length; i++) {
            total += _numbers[i];
        }
        
        return total;
    }
}
