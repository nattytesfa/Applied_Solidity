// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract FixedArraySum {
    function calculateTotal(uint[5] memory _values) external pure returns(uint) {
        uint result = 0;
        for(uint idx = 0; idx < 5; idx++) {
            result += _values[idx];
        }
        return result;
    }
}