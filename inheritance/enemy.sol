// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title Enemy
 * @dev Represents an enemy in the game. Provides a function to receive attacks from heroes.
 */
contract Enemy {
    /**
     * @notice Called by hero contracts when they attack this enemy.
     * @param attackType The type of attack being received (encoded as uint8 from Hero.AttackTypes enum).
     */
    function takeAttack(uint8 attackType) external {
        // In a real game, this would apply damage logic based on attack type
    }
}
