// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SocialGraph {
    enum RelationshipType { 
        None,
        Companion,
        Relative
    }
    
    mapping(address => mapping(address => RelationshipType)) public relationships;
    
    function setRelationship(address _other, RelationshipType _relType) external {
        relationships[msg.sender][_other] = _relType;
    }
}