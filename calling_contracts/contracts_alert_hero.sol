// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IHero {
    function alert() external;
}

contract Sidekick {

    function sendAlert(address heroAddress) external {

        IHero hero = IHero(heroAddress);

        hero.alert();
    }
}