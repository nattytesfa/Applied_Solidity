// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title SumFixedArray
 * @dev Demonstrates processing fixed-size arrays in Solidity.
 */
contract SumFixedArray {
    /**
     * @notice Computes the sum of a fixed-size array of 5 elements.
     * @param _numbers A fixed-size array containing exactly 5 uints.
     * @return The sum of the numbers in the array.
     */
    function sum(uint[5] calldata _numbers) external pure returns (uint) {
        uint total = 0;
        
        // Loop through the 5 elements and calculate the sum.
        for (uint i = 0; i < 5; i++) {
            total += _numbers[i];
        }
        
        return total;
    }
}
