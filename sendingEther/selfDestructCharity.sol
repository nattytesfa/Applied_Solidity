// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SelfDestructCharity
 * @dev Demonstrates transferring contract balance via the `selfdestruct` function.
 * @notice WARNING: `selfdestruct` is deprecated since Solidity 0.8.18. Post-Cancun hardfork,
 * it does not destroy code/storage unless executed in the same transaction as deployment,
 * but still forwards the contract's entire balance to the specified target address.
 */
contract SelfDestructCharity {
    address public owner;
    address public charity;
    
    constructor(address _charity) {
        owner = msg.sender;
        charity = _charity;
    }
    
    receive() external payable {}
    
    function tip() public payable {
        (bool success, ) = owner.call{value: msg.value}("");
        require(success, "Transfer failed");
    }
    
    /**
     * @notice Performs a selfdestruct, transferring all contract balance to the charity.
     */
    function donate() public {
        // selfdestruct transfers all remaining funds to target and is deprecated
        selfdestruct(payable(charity));
    }
}
