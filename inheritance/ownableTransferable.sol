// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title Ownable
 * @dev Base contract with ownership and modifier.
 */
contract Ownable {
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
}

/**
 * @title Transferable
 * @dev Inherits from Ownable and adds the ability to transfer ownership to a new address.
 *      Demonstrates the `is` keyword for single inheritance.
 */
contract Transferable is Ownable {
    /**
     * @notice Transfers ownership of the contract to a new address.
     * @dev Uses the inherited `onlyOwner` modifier to restrict access.
     * @param _newOwner The address of the new owner.
     */
    function transfer(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "New owner cannot be zero address");
        owner = _newOwner;
    }
}
