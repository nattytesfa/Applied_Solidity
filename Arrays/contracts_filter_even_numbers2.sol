// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    function filterEven(uint[] memory _numbers) external pure returns(uint[] memory) {
        // First pass: count even numbers
        uint evenCount = 0;
        for(uint i = 0; i < _numbers.length; i++) {
            if(_numbers[i] % 2 == 0) {
                evenCount++;
            }
        }
        
        // Create new array with exact size needed
        uint[] memory evenNumbers = new uint[](evenCount);
        
        // Second pass: fill the array with even numbers
        uint index = 0;
        for(uint i = 0; i < _numbers.length; i++) {
            if(_numbers[i] % 2 == 0) {
                evenNumbers[index] = _numbers[i];
                index++;
            }
        }
        
        return evenNumbers;
    }
}