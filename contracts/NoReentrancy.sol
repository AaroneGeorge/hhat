// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract FunctionModifier {
    // We will use these variables to demonstrate how to use
    // modifiers.
    address public owner;
    uint256 public x = 10;
    bool public locked;

    constructor() {
        // Set the transaction sender as the owner of the contract.
        owner = msg.sender;
    }

    // Modifier to check that the caller is the owner of
    // the contract.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    // Modifiers can take inputs. This modifier checks that the
    // address passed in is not the zero address.
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(
        address _newOwner
    ) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // Modifiers can be called before and / or after a function.
    // This modifier prevents a function from being called while
    // it is still executing.
    modifier noReentrancy() {
        require(!locked, "No reentrancy"); // Ensure function is not already executing
        locked = true; // Lock the function
        _; // Execute the rest of the function
        locked = false; // Unlock after execution
    }

    function decrement(uint256 i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1); // Recursive call (could simulate reentrancy)
        }
    }

    //TL;DR
    // Reentrancy - A vulnerability where an external call re-enters the same function before its first execution finishes.
    // Risk - Drains funds or causes logic errors.
    // Solution Used Here - A locked flag that blocks reentry until the function is done executing.
}
