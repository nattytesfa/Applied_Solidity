// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    // Update the relay function to accept arbitrary byte payload and pass it along
    function relay(address heroAddress, bytes calldata data) external {
        // Perform a low-level call, directly passing the raw 'data' bytes payload
        (bool success, ) = heroAddress.call(data);
        
        // Ensure the transaction reverts if the execution on the Hero contract fails
        require(success, "Relay transaction failed");
    }
}