// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function makeContact(address heroAddress) external {
        // Send a random 4-byte payload that won't match any function identifier.
        // This will force the EVM to route the transaction to the Hero's fallback function.
        (bool success, ) = heroAddress.call(abi.encodePacked(bytes4(0x12345678)));
        
        // Ensure the call completed successfully
        require(success, "Contact failed");
    }
}