// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract EvenFilterPure {
    function extractEvenValues(uint[] memory _inputArray) external pure returns(uint[] memory) {
        // Count how many even values exist in the input
        uint evenTotal = 0;
        for(uint idx = 0; idx < _inputArray.length; idx++) {
            if(_inputArray[idx] % 2 == 0) {
                evenTotal++;
            }
        }
        
        // Allocate a fixed-size array to store results
        uint[] memory results = new uint[](evenTotal);
        
        // Populate the results array with even values
        uint pos = 0;
        for(uint idx = 0; idx < _inputArray.length; idx++) {
            if(_inputArray[idx] % 2 == 0) {
                results[pos] = _inputArray[idx];
                pos++;
            }
        }
        
        return results;
    }
}