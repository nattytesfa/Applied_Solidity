// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract SecretRevealer {
    function revealWinningNumber(string calldata hiddenMessage) external view returns(uint) {
        console.log(hiddenMessage);
        return 794;
    }
}
