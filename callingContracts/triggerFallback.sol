// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Sidekick
 * @dev Demonstrates how to trigger the fallback/receive function of another contract using low-level empty call.
 */
contract Sidekick {
    /**
     * @notice Contacts a target contract using a low-level call, passing empty calldata.
     * @dev An empty call on an address will trigger its `receive()` function (if present) or `fallback()` function.
     * @param hero The address of the contract to contact.
     */
    function makeContact(address hero) external {
        (bool success, ) = hero.call("");
        require(success, "Contact call failed");
    }
}
