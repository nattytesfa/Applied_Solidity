// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // --- FIX: Renamed 'Friends' to 'Friend' to match your test suite ---
    enum ConnectionTypes { Unacquainted, Friend, Family, Business }

    // Maps: Origin Address => (Target Address => Connection Type)
    mapping(address => mapping(address => ConnectionTypes)) public connections;

    /**
     * @notice Connect with another address
     * @dev Establishes a relationship type from msg.sender pointing to the _other address
     * @param _other The target user address
     * @param _type The type of relationship being established
     */
    function connectWith(address _other, ConnectionTypes _type) external {
        // Access the nested layer by passing the primary key first, then the nested key
        connections[msg.sender][_other] = _type;
    }
}