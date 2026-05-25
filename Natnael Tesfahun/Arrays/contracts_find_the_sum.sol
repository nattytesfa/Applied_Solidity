// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    function sum(uint[5] memory _numbers) external pure returns(uint) {
        uint total = 0;
        for(uint i = 0; i < 5; i++) {
            total += _numbers[i];
        }
        return total;
    }
}