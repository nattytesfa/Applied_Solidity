// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Sidekick
 * @dev Demonstrates how to write a generic forwarder/relay that forwards arbitrary payload data (calldata) to a target contract.
 */
contract Sidekick {
    /**
     * @notice Relays arbitrary calldata to a target address.
     * @dev Commonly used in proxy contracts or multi-signature wallet execution.
     * @param hero The target contract address.
     * @param data The pre-encoded function selector and arguments data.
     */
    function relay(address hero, bytes memory data) external {
        (bool success, ) = hero.call(data);
        require(success, "Calldata relay execution failed");
    }
}
