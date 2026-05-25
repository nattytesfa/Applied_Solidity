// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title OverloadDouble
 * @dev Demonstrates function overloading (multiple functions with the same name but different signatures) in Solidity.
 */
contract OverloadDouble {
    /**
     * @notice Doubles a single uint.
     * @param _value The value to double.
     * @return The doubled value.
     */
    function double(uint _value) external pure returns (uint) {
        return _value * 2;
    }
    
    /**
     * @notice Doubles two separate uint values.
     * @dev Demonstrates function overloading and returning multiple values in a tuple.
     * @param _value1 The first value to double.
     * @param _value2 The second value to double.
     * @return The first doubled value, and the second doubled value.
     */
    function double(uint _value1, uint _value2) external pure returns (uint, uint) {
        return (_value1 * 2, _value2 * 2);
    }
}
