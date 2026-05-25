// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title EscrowVariables
 * @dev Introduces the three actor roles (depositor, beneficiary, arbiter) involved in an Escrow agreement.
 */
contract EscrowVariables {
    // The party who funds the escrow contract
    address public depositor;
    
    // The party who receives the escrow funds upon approval
    address public beneficiary;
    
    // The trusted third party who decides if the funds should be released
    address public arbiter;
}
