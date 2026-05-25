// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title OnlyOwnerAccess
 * @dev Demonstrates how to use custom modifiers (`onlyOwner`) to restrict access to contract configuration functions.
 */
contract OnlyOwnerAccess {
    uint public configA;
    uint public configB;
    uint public configC;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    /**
     * @notice Modifiers are reusable checks that can be applied to functions.
     * @dev The `_;` indicates where the body of the modified function will execute.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    /**
     * @notice Sets configuration variable A. Only callable by the owner.
     * @param _configA New value for configA.
     */
    function setA(uint _configA) public onlyOwner {
        configA = _configA;
    }

    /**
     * @notice Sets configuration variable B. Only callable by the owner.
     * @param _configB New value for configB.
     */
    function setB(uint _configB) public onlyOwner {
        configB = _configB;
    }

    /**
     * @notice Sets configuration variable C. Only callable by the owner.
     * @param _configC New value for configC.
     */
    function setC(uint _configC) public onlyOwner {
        configC = _configC;
    }
}
