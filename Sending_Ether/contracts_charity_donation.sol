// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    // Public storage variable to save the charity's address
    address public charity;

    // 1. Modify the constructor to accept the charity address upon deployment
    constructor(address _charity) {
        charity = _charity;
    }

    // 2. Add the receive function to safely accept incoming Ether
    receive() external payable {
        // Ether is automatically added to address(this).balance
    }

    // 3. Add the donate function to send all contract funds to the charity
    function donate() external {
        // Get the contract's total current balance
        uint256 currentBalance = address(this).balance;

        // Transfer the entire balance to the charity address
        (bool success, ) = charity.call{ value: currentBalance }("");
        
        // Ensure the transfer succeeded
        require(success, "Charity donation failed");
    }
}
