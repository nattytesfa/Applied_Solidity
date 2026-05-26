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

    function newProposal(address target, bytes calldata data) external {
        proposals.push(
            Proposal({
                target: target,
                data: data,
                yesCount: 0,
                noCount: 0
            })
        );
    }

    function castVote(uint256 proposalId, bool support) external {
        if (support) {
            proposals[proposalId].yesCount += 1;
        } else {
            proposals[proposalId].noCount += 1;
        }
    }
}