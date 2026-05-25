// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title IHero
 * @dev Interface for the Hero contract, specifying external functions sidekicks can call.
 */
interface IHero {
    function alert() external;
}

/**
 * @title Sidekick
 * @dev Demonstrates contacting another contract using a strongly-typed Solidity interface.
 */
contract Sidekick {
    /**
     * @notice Alerts the hero contract via its interface.
     * @dev Calling via an interface is safer and more readable than low-level `.call()`.
     * @param hero The address of the Hero contract.
     */
    function sendAlert(address hero) external {
        IHero(hero).alert();
    }
}
