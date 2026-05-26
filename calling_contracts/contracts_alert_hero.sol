// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// 1. Define the IHero interface detailing the function we want to call
interface IHero {
    function alert() external;
}

contract Sidekick {
    // 2. Complete the sendAlert function
    function sendAlert(address heroAddress) external {
        // Instantiate the interface at the targeted contract address and call alert()
        IHero(heroAddress).alert();
    }
}
