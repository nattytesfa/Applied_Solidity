// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    struct Proposal {
        address target;
        bytes data;
        uint256 yesCount;
        uint256 noCount;
    }

    Proposal[] public proposals;

    function newProposal(address targetAddr, bytes calldata payload) external {

        Proposal memory newProp = Proposal({
            target: targetAddr,
            data: payload,
            yesCount: 0,
            noCount: 0
        });

        proposals.push(newProp);
    }
}