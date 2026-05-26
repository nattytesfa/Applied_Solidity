// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function sendAlert(address heroAddress) external {
        // 1. Define the exact canonical function signature string
        bytes4 selector = bytes4(keccak256("alert()"));

        // 2. Perform the low-level call using the 4-byte selector as calldata
        (bool success, ) = heroAddress.call(abi.encodePacked(selector));
        
        // 3. Ensure the low-level call didn't fail
        require(success, "Alert failed");
    }
}