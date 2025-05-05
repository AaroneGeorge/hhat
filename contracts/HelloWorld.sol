// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import "hardhat/console.sol";

contract HelloWorld {
    string public greet = "Hello World!";
    constructor() {
        console.log(greet);
    }
}