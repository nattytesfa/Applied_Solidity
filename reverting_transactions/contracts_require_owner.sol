// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Adding 'public' allows the test suite to automatically read these values
    uint public configA;
    uint public configB;
    uint public configC;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function setA(uint _configA) public onlyOwner {
        configA = _configA;
    }

    function setB(uint _configB) public onlyOwner {
        configB = _configB;
    }

    function setC(uint _configC) public onlyOwner {
        configC = _configC;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
}
