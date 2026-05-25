// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CharityDonation
 * @dev Demonstrates forwarding the entire contract balance to a recipient address using low-level call.
 */
contract CharityDonation {
    address public owner;
    address public charity;
    
    constructor(address _charity) {
        owner = msg.sender;
        charity = _charity;
    }
    
    receive() external payable {}
    
    /**
     * @notice Tip the owner of the contract.
     */
    function tip() public payable {
        (bool success, ) = owner.call{value: msg.value}("");
        require(success, "Transfer failed");
    }
    
    /**
     * @notice Forward the entire contract balance to the charity address.
     */
    function donate() public {
        uint balance = address(this).balance;
        (bool success, ) = charity.call{value: balance}("");
        require(success, "Donation failed");
    }
}
