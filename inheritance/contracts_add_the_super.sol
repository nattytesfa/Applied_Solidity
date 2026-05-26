// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Hero.sol";

contract Mage is Hero(50) {
    /**
     * @notice Overrides the attack function for Mage and calls the base contract
     * @param _enemy The target Enemy contract instance
     */
    // --- FIX: Changed visibility from external to public ---
    function attack(Enemy _enemy) public override {
        // 1. Perform Mage-specific behavior
        _enemy.takeAttack(Hero.AttackTypes.Spell);

        // 2. Invoke the base contract function
        super.attack(_enemy);
    }
}

contract Warrior is Hero(200) {
    /**
     * @notice Overrides the attack function for Warrior and calls the base contract
     * @param _enemy The target Enemy contract instance
     */
    // --- FIX: Changed visibility from external to public ---
    function attack(Enemy _enemy) public override {
        // 1. Perform Warrior-specific behavior
        _enemy.takeAttack(Hero.AttackTypes.Brawl);

        // 2. Invoke the base contract function
        super.attack(_enemy);
    }
}