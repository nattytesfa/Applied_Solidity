// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title RequireMinEther
 * @dev Demonstrates transaction reverts using `require` statements to enforce deployment conditions.
 */
contract RequireMinEther {
    /**
     * @notice Enforces sending a minimum of 1 Ether during deployment.
     * @dev Constructors marked `payable` can receive Ether when the contract is deployed.
     *      If the `require` fails, the transaction is reverted and unused gas is returned to sender.
     */
    constructor() payable {
        require(msg.value >= 1 ether, "Must send at least 1 ether");
    }
}
