// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    function sum(uint[] memory numbers) external pure returns (uint) {

        uint result = 0;

        for (uint256 i = 0; i < numbers.length; i++) {
            result += numbers[i];
        }

        return result;
    }
}