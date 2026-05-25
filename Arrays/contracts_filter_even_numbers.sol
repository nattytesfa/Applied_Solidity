// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract EvenFilter {
    uint[] public filteredResults;
    
    function extractEvenValues(uint[] memory _inputArray) external {
        for(uint idx = 0; idx < _inputArray.length; idx++) {
            if(_inputArray[idx] % 2 == 0) {
                filteredResults.push(_inputArray[idx]);
            }
        }
    }
}