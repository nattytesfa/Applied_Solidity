// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title DoubleUint
 * @dev Demonstrates pure functions that do not read or modify state.
 */
contract DoubleUint {
    /**
     * @notice Multiplies the input value by 2.
     * @dev Marked as `pure` because it neither reads nor modifies state variables.
     * @param _value The input value.
     * @return The doubled value.
     */
    function double(uint _value) external pure returns (uint) {
        return _value * 2;
    }
}
