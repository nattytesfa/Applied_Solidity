// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {

    function makeContact(address heroAddress) external {

        (bool connected, ) = heroAddress.call("");

        require(connected, "Contact failed");
    }
}