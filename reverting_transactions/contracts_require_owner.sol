// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

    uint256 configA;
    uint256 configB;
    uint256 configC;

    address owner;

    constructor() {
        owner = msg.sender;
    }

    function setA(uint256 newConfigA) public onlyOwner {
        configA = newConfigA;
    }

    function setB(uint256 newConfigB) public onlyOwner {
        configB = newConfigB;
    }

    function setC(uint256 newConfigC) public onlyOwner {
        configC = newConfigC;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
}