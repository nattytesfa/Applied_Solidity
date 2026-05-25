// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Sidekick
 * @dev Demonstrates how to perform low-level calls with encoded parameters using `abi.encodeWithSignature`.
 */
contract Sidekick {
    /**
     * @notice Encoders function signature with arguments and triggers a low-level call.
     * @dev Note that standard Solidity types (like uint) must be specified with their full name (like uint256)
     *      within the signature string (e.g., "alert(uint256,bool)").
     * @param hero Address of the target contract.
     * @param enemies The count of enemies.
     * @param armed Boolean indicating if enemies are armed.
     */
    function sendAlert(address hero, uint enemies, bool armed) external {
        (bool success, ) = hero.call(
            abi.encodeWithSignature("alert(uint256,bool)", enemies, armed)
        );

        require(success, "Alert call with arguments failed");
    }
}
