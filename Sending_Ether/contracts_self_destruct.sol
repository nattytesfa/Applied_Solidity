// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    // Storage variable for the charity address
    address public charity;

    // The constructor accepts the charity address upon deployment
    constructor(address _charity) {
        charity = _charity;
    }

    // Allows the contract to accept incoming Ether transfers
    receive() external payable {
        // Funds accumulate in address(this).balance automatically
    }

    // Triggers contract self-destruction and sends all funds to charity
    function donate() external {
        // 1. Cast the charity address to 'payable' so it can receive Ether
        address payable target = payable(charity);

        // 2. Trigger selfdestruct, passing the target address
        // This implicitly transfers address(this).balance to 'target' and clears the contract
        selfdestruct(target);
    }
}