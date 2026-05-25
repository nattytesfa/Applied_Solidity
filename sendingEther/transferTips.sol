// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title TransferTips
 * @dev Demonstrates how to transfer incoming Ether (value) to another address using the low-level `.call` method.
 */
contract TransferTips {
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    /**
     * @notice Allows receiving Ether directly to the contract.
     */
    receive() external payable {}
    
    /**
     * @notice Forwards the received tip amount directly to the owner.
     * @dev `.call{value: val}("")` is preferred over `.transfer` and `.send` to avoid gas limit dependencies.
     */
    function tip() public payable {
        (bool success, ) = owner.call{value: msg.value}("");
        require(success, "Transfer failed");
    }
}
