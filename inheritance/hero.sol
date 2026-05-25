// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./enemy.sol";

/**
 * @title Hero
 * @dev Base contract for hero characters in the game. Defines health, attack types,
 *      and a virtual attack function that subclasses (Mage, Warrior) can override.
 */
contract Hero {
    // Enum representing different attack strategies
    enum AttackTypes { Brawl, Spell }

    // Health points assigned during construction
    uint public health;

    /**
     * @notice Initializes the hero with a specific amount of health.
     * @param _health The starting health points.
     */
    constructor(uint _health) {
        health = _health;
    }

    /**
     * @notice Base attack function. Subcontracts should override this to define their attack behavior.
     * @dev Marked `virtual` so derived contracts can override it with the `override` keyword.
     * @param _enemy The enemy contract to attack.
     */
    function attack(Enemy _enemy) public virtual {}
}
