// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./hero.sol";

/**
 * @title MageAndWarriorHealth
 * @dev Demonstrates passing constructor arguments to a parent contract.
 *      `Hero(50)` and `Hero(200)` set different health values for each subclass.
 */

/// @notice A mage with 50 health points.
contract Mage is Hero(50) {

}

/// @notice A warrior with 200 health points.
contract Warrior is Hero(200) {

}
