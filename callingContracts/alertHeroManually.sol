// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Sidekick
 * @dev Demonstrates manually calculating a function selector and calling another contract.
 */
contract Sidekick {
    /**
     * @notice Sends an alert message manually using function signature hash.
     * @dev Calculates the first 4 bytes of keccak256 of the function signature string `alert()`.
     *      Then sends it using low-level `.call()`.
     * @param hero The address of the target contract.
     */
    function sendAlert(address hero) external {
        // Calculate the function selector manually: bytes4(keccak256("functionSignature"))
        bytes4 signature = bytes4(keccak256("alert()"));

        // Call the target contract, forwarding the function selector byte array
        (bool success, ) = hero.call(abi.encodePacked(signature));

        require(success, "Manual alert call failed");
    }
}
