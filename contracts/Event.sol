// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Voting {
    address public admin;
    mapping(string => uint256) public votes;

    event Voted(address indexed voter, string candidate);
    event AdminChanged(address indexed oldAdmin, address indexed newAdmin);

    constructor() {
        admin = msg.sender;
    }

    function vote(string calldata _candidate) external {
        votes[_candidate]++;
        emit Voted(msg.sender, _candidate);  // <-- Event emitted here
    }

    function changeAdmin(address _newAdmin) external {
        require(msg.sender == admin, "Only admin can change admin");
        emit AdminChanged(admin, _newAdmin);  // <-- Log admin change
        admin = _newAdmin;
    }
}
