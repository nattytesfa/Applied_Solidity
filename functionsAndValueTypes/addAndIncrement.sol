// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title AddAndIncrement
 * @dev Demonstrates the difference between state-modifying functions and read-only view functions.
 */
contract AddAndIncrement {
    uint public x;
    
    constructor(uint _x) {
        x = _x;
    }
    
    /**
     * @notice Increments the state variable x by 1.
     */
    function increment() external {
        x = x + 1;
    }
    
    /**
     * @notice Adds the parameter `_value` to the state variable x and returns the result.
     * @dev Marked as `view` because it reads from state but does not modify it. View calls are free when called off-chain.
     * @param _value The value to add to x.
     * @return The resulting sum.
     */
    function add(uint _value) external view returns (uint) {
        return x + _value;
    }
}
