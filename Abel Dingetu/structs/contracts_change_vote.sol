// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	Vote[] public votes;
	
	function createVote(Choices choice) external {
		require(!hasVoted(msg.sender), "Already voted");
		votes.push(Vote(choice, msg.sender));
	}
	
	function changeVote(Choices choice) external {
		require(hasVoted(msg.sender), "No vote to change");
		for(uint i = 0; i < votes.length; i++) {
			if(votes[i].voter == msg.sender) {
				votes[i].choice = choice;
				return;
			}
		}
	}
	
	function hasVoted(address _voter) public view returns(bool) {
		for(uint i = 0; i < votes.length; i++) {
			if(votes[i].voter == _voter) {
				return true;
			}
		}
		return false;
	}
	
	function findChoice(address _voter) external view returns(Choices) {
		for(uint i = 0; i < votes.length; i++) {
			if(votes[i].voter == _voter) {
				return votes[i].choice;
			}
		}
		revert("Vote not found");
	}
}