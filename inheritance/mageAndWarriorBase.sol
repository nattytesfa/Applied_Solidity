// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./hero.sol";

/**
 * @title MageAndWarriorBase
 * @dev Demonstrates basic inheritance from the Hero contract without overriding any functionality.
 *      Both Mage and Warrior inherit all of Hero's state variables and functions.
 */

/// @notice A mage hero with default behavior inherited from Hero.
contract Mage is Hero {

}

/// @notice A warrior hero with default behavior inherited from Hero.
contract Warrior is Hero {

}
