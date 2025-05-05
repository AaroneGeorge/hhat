// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import "hardhat/console.sol";

contract Mapping {
    mapping(address => uint256) public myMap;

    function get(address _addr) public view returns (uint256) {
        return myMap[_addr];
    }

    function set(address _addr, uint256 _i) public {
        myMap[_addr] = _i; 
    }

    function remove(address _addr) public {
        delete myMap[_addr];
    }
}

contract NestedMapping {
    mapping(address => mapping(uint256 => bool)) public nestedMap;

    function get(address _addr, uint256 _i) public view returns (bool){
        return nestedMap[_addr][_i];
    }

    function set(address _addr, uint256 _i, bool _b) public {
        nestedMap[_addr][_i] = _b;
    }

    function remove(address _addr, uint256 _i) public {
        delete nestedMap[_addr][_i];
    }
}