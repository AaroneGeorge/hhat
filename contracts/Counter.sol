// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import "hardhat/console.sol";

contract Counter {
    uint256 public count = 0;

    function get() public view returns (uint256) {
        return count;
    }

    function increment() public {
        count +=1 ;
    }

    function decrement() public {
        count -= 1;
    }

}