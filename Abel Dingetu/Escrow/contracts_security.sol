// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract EscrowAgreement {
    address public sender;
    address public receiver;
    address public mediator;
    
    constructor(address _mediator, address _receiver) payable {
        sender = msg.sender;
        mediator = _mediator;
        receiver = _receiver;
    }
    
    function releaseFunds() external {
        require(msg.sender == mediator, "Only the mediator can release funds");
        uint contractBalance = address(this).balance;
        (bool sent, ) = receiver.call{value: contractBalance}("");
        require(sent, "Failed to release funds to receiver");
    }
}