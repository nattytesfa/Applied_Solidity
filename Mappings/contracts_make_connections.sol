// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    enum ConnectionTypes {
        Friend,
        Family
    }

    mapping(address => mapping(address => ConnectionTypes)) public connections;

    function connectWith(address other, ConnectionTypes relation) external {
        connections[msg.sender][other] = relation;
    }
}