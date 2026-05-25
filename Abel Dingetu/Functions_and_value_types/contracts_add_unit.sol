// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract NumberStore {
    uint public value;
    
    constructor(uint _initialValue) {
        value = _initialValue;
    }
    
    function incrementByOne() external {
        value = value + 1;
    }
    
    function addTo(uint _amount) external view returns(uint) {
        return value + _amount;
    }
}