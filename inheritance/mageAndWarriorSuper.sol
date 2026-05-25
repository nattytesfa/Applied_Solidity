// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./hero.sol";

/**
 * @title MageAndWarriorSuper
 * @dev Demonstrates the `super` keyword to call the parent contract's implementation
 *      after performing the subclass-specific logic.
 */

/// @notice Mage attacks with Spell, then calls the parent Hero's attack logic via `super`.
contract Mage is Hero(50) {
    /**
     * @notice Overrides `attack` to cast a Spell, then delegates to the parent implementation.
     * @param _enemy The enemy contract to attack.
     */
    function attack(Enemy _enemy) public override {
        _enemy.takeAttack(uint8(Hero.AttackTypes.Spell));
        // `super.attack()` calls the parent Hero's attack function
        super.attack(_enemy);
    }
}

/// @notice Warrior attacks with Brawl, then calls the parent Hero's attack logic via `super`.
contract Warrior is Hero(200) {
    /**
     * @notice Overrides `attack` to perform a Brawl, then delegates to the parent implementation.
     * @param _enemy The enemy contract to attack.
     */
    function attack(Enemy _enemy) public override {
        _enemy.takeAttack(uint8(Hero.AttackTypes.Brawl));
        super.attack(_enemy);
    }
}
