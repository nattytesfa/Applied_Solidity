// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    // Public state variables to track the three key participants
    address public depositor;
    address public beneficiary;
    address public arbiter;
}