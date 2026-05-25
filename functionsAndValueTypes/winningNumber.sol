// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

/**
 * @title WinningNumber
 * @dev Demonstrates standard view functions and logging with Foundry's forge-std library.
 */
contract WinningNumber {
    /**
     * @notice Logs a secret message and returns the winning number.
     * @dev Marked as `view` because it logs message output but does not write to the blockchain state.
     * @param secretMessage The secret message string to be logged.
     * @return The constant winning number (794).
     */
    function winningNumber(string calldata secretMessage) external view returns (uint) {
        console.log(secretMessage);
        return 794;
    }
}
