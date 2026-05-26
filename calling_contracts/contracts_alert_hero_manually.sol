// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {

    function sendAlert(address targetHero) external {

        bytes4 functionSignature = bytes4(keccak256("alert()"));

        (bool sent, ) = targetHero.call(
            abi.encodePacked(functionSignature)
        );

        require(sent, "Alert failed");
    }
}