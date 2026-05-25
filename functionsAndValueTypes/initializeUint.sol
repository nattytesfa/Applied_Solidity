// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title InitializeUint
 * @dev Demonstrates contract constructor initialization of state variables.
 */
contract InitializeUint {
    // Public state variable
    uint public x;
    
    /**
     * @notice Constructor runs once upon contract deployment.
     * @param _x The initial value for the state variable x.
     */
    constructor(uint _x) {
        x = _x;
    }
}
