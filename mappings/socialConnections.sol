// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SocialConnections
 * @dev Demonstrates nested mappings (address -> address -> ConnectionTypes) for managing relationships between users.
 */
contract SocialConnections {
    // Relationship connection options
    enum ConnectionTypes { 
        Unacquainted,
        Friend,
        Family
    }
    
    // A nested mapping mapping a user to their relationship types with other addresses
    // connections[fromAddress][toAddress] = connectionType
    mapping(address => mapping(address => ConnectionTypes)) public connections;
    
    /**
     * @notice Connects the caller with another address using a specific connection type.
     * @param other The address of the person to connect with.
     * @param connectionType The type of relationship connection.
     */
    function connectWith(address other, ConnectionTypes connectionType) external {
        connections[msg.sender][other] = connectionType;
    }
}
