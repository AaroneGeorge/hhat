// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

// storage - variable is a state variable (stored on the blockchain)
// memory - variable is in memory and it exists while a function is being called
// calldata - special data location that contains function arguments

contract ProfileManager {
    //STORAGE: stored onchain
    struct UserProfile {
        string name;
        uint256 age;
    }

    mapping(address => UserProfile) public profiles;

 // ✅ External function with calldata (efficient for input)
    function updateProfile(string calldata _name, uint256 _age) external {
        UserProfile storage user = profiles[msg.sender];
        user.name = _name;
        user.age = _age;
    }

    // ✅ Public function with memory (returns temporary data)
    function getProfileCopy() public view returns (UserProfile memory) {
        UserProfile memory tempCopy = profiles[msg.sender];
        return tempCopy; // returns a memory copy
    }

    // ✅ Internal function that takes storage reference
    function _resetProfile(UserProfile storage user) internal {
        user.name = "Anon";
        user.age = 0;
    }

    // Public function that uses the internal function
    function resetMyProfile() public {
        UserProfile storage user = profiles[msg.sender];
        _resetProfile(user); // passes storage reference
    }
}