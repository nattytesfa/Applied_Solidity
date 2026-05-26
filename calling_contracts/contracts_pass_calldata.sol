// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {

    function relay(address heroAddress, bytes memory callData) external {

        (bool success, ) = heroAddress.call(callData);

        require(success, "Relay failed");
    }
}