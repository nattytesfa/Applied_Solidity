// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title IncrementUint
 * @dev Demonstrates an external function that modifies state storage by incrementing a variable.
 */
contract IncrementUint {
    uint public x;
    
    constructor(uint _x) {
        x = _x;
    }
    
    /**
     * @notice Increments the state variable x by 1.
     * @dev As an external function modifying state, calling this requires a transaction and costs gas.
     */
    function increment() external {
        x = x + 1;
    }
}
