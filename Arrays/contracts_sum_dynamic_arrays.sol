// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    function sum(uint[] memory _numbers) external pure returns(uint) {
        uint total = 0;
        for(uint i = 0; i < _numbers.length; i++) {
            total += _numbers[i];
        }
        return total;
    }
}