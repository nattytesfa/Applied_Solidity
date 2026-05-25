// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Multiplier {
    function multiplyByTwo(uint _input) external pure returns(uint) {
        return _input * 2;
    }
    
    function multiplyByTwo(uint _first, uint _second) external pure returns(uint, uint) {
        return (_first * 2, _second * 2);
    }
}