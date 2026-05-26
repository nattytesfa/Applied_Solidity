// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function sendAlert(address heroAddress, uint256 enemies, bool armed) external {
        // 1. Encode the function signature along with its arguments.
        // CRITICAL: Always use the canonical name 'uint256' instead of the short-hand 'uint'.
        bytes memory payload = abi.encodeWithSignature(
            "alert(uint256,bool)", 
            enemies, 
            armed
        );

        // 2. Pass the encoded payload into the low-level call
        (bool success, ) = heroAddress.call(payload);
        
        // 3. Ensure the call was processed successfully
        require(success, "Alert failed");
    }
}