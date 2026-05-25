// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract DynamicArraySum {
    function calculateTotal(uint[] memory _values) external pure returns(uint) {
        uint result = 0;
        for(uint idx = 0; idx < _values.length; idx++) {
            result += _values[idx];
        }
        return result;
    }
}