// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Multiplier {
    function multiplyByTwo(uint _input) external pure returns(uint) {
        return _input * 2;
    }
}