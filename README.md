# Solidity Smart Contract Examples

Name = Yoseph Samuel

Welcome to this refactored and modernized repository of Solidity examples. The codebase is organized into modular categories, utilizing clean **camelCase** directories and descriptive **PascalCase / camelCase** filenames. All contracts are optimized, fully commented using Solidity NatSpec format, and compatible with compiler `0.8.20`.

##  Repository Structure

Below is an overview of the directories and the topics covered:

### 1. `smartContracts/`
Focuses on basic Solidity value types, states, and variables:
- `booleanVariables.sol`: Declaring and checking boolean states.
- `unsignedIntegers.sol` & `signedIntegers.sol`: Working with various integer sizes and arithmetic limits.
- `stringLiterals.sol`: Declaring and accessing string values.
- `enumExamples.sol`: Defining custom options and status tracking via enumerations.

### 2. `arrays/`
Demonstrates array operations, including storage vs. memory arrays:
- `filterEvenStorage.sol` & `filterEvenMemory.sol`: Filtering even numbers using storage and memory configurations.
- `sumFixedArray.sol` & `sumDynamicArray.sol`: Iterating and computing sums of fixed and dynamically-sized arrays.
- `addMember.sol` & `removeLastMember.sol`: Managing dynamic arrays (pushing and popping array members).

### 3. `mappings/`
Covers key-value lookup structures:
- `membersMapping.sol` & `checkMembership.sol`: Associating addresses with boolean flags to verify membership.
- `removeMemberMapping.sol`: Deleting records from mappings using the `delete` keyword.
- `userRegistry.sol`: Storing complex user structs associated with keys.
- `userTokenTransfer.sol` & `socialConnections.sol`: Implementing address balances, tracking relations, and processing token transfers.

### 4. `functionsAndValueTypes/`
Highlights function signatures, inputs/outputs, overloading, and logic flow:
- `initializeUint.sol`: Assigning values using a constructor.
- `incrementUint.sol` & `addAndIncrement.sol`: Modifying state variables through getter and setter functions.
- `doubleUint.sol` & `overloadDouble.sol`: Showcasing function overloading with same-name functions accepting different parameters.
- `winningNumber.sol`: A basic guess-the-number contract returning secret values.

### 5. `sendingEther/`
Covers transfer patterns, payable functions, and contract self-destruction:
- `storeOwner.sol`: Initializing and verifying owner state.
- `receiveEther.sol`: Utilizing the special `receive()` fallback to accept raw Ether transfers.
- `transferTips.sol`: Tipping mechanisms and withdrawing funds safely.
- `charityDonation.sol`: Storing deposits and routing charity donations.
- `selfDestructCharity.sol`: Evacuating remaining contract funds to a charity address via `selfdestruct`.

### 6. `revertingTransactions/`
Demonstrates input validation and access control:
- `requireMinEther.sol`: Restricting function calls using require checks on transaction values.
- `onlyOwnerAccess.sol` & `ownerWithdrawal.sol`: Authorizing withdrawals only to the contract owner.

### 7. `callingContracts/`
Details communication and inter-contract execution:
- `alertHeroInterface.sol` & `alertHeroWithArgs.sol`: Calling external contracts via interfaces.
- `relayCalldata.sol` & `alertHeroManually.sol`: Triggering calls using low-level `.call` payload delivery.
- `triggerFallback.sol`: Forcing fallback method triggers.

### 8. `escrow/`
An end-to-end multi-party Escrow transaction pattern:
- `escrowVariables.sol` & `escrowConstructor.sol`: Defining roles (depositor, beneficiary, arbiter) and setting states.
- `payableEscrow.sol`: Accepting funding from the depositor.
- `escrowApprove.sol` & `securedEscrow.sol`: Restricting funds releases until approved by the arbiter.
- `completeEscrow.sol`: Executing the final payout.

### 9. `structs/`
Working with custom user-defined data structures:
- `singleVote.sol` & `voteMemory.sol`: Declaring, instantiating, and retrieving struct properties.
- `voteArray.sol` & `findVote.sol`: Handling list search logic and appending struct items.
- `voteOnce.sol` & `changeVote.sol`: Enforcing single-vote rules and vote switching.

### 10. `voting/`
An interactive on-chain proposal and polling system:
- `proposalCreation.sol`: Setting up new on-chain proposals.
- `castVote.sol` & `voteChanging.sol`: Submitting choices and managing dynamic voting state.
- `proposalVoteCounting.sol`: Tabulating results.
- `membersVoting.sol` & `executeProposal.sol`: Restricting voting to members and executing proposals.

### 11. `inheritance/`
Implements smart contract relationships, base structures, and keyword overrides:
- `hero.sol` & `enemy.sol`: Base contracts establishing hero characteristics and action limits.
- `ownableOnly.sol` & `ownableTransferable.sol`: Standard contract ownership rules.
- `mageAndWarriorBase.sol` & `mageAndWarriorHealth.sol`: Subclasses extending base stats.
- `mageAndWarriorAttack.sol` & `mageAndWarriorSuper.sol`: Overriding attacks using the `super` keyword.

### 12. `proofScreenshot/`
Contains proof artifacts or verification images.

---


