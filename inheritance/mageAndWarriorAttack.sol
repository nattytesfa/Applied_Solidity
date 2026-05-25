// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./hero.sol";

/**
 * @title MageAndWarriorAttack
 * @dev Demonstrates overriding a virtual function from the parent contract.
 *      Each subclass implements its own attack type.
 */

/// @notice Mage attacks with Spell.
contract Mage is Hero(50) {
    /**
     * @notice Overrides the base `attack` function to use a Spell attack.
     * @param _enemy The enemy contract to attack.
     */
    function attack(Enemy _enemy) public override {
        _enemy.takeAttack(uint8(Hero.AttackTypes.Spell));
    }
}

/// @notice Warrior attacks with Brawl.
contract Warrior is Hero(200) {
    /**
     * @notice Overrides the base `attack` function to use a Brawl attack.
     * @param _enemy The enemy contract to attack.
     */
    function attack(Enemy _enemy) public override {
        _enemy.takeAttack(uint8(Hero.AttackTypes.Brawl));
    }
}
