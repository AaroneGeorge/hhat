// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Enum {
    // Enum representing Cooking Status
    enum Status {
        Pending,
        Cooking,
        Ready,
        Burnt,
        Canceled
    }
    // Default value is the first element listed in
    // definition of the type, in this case "Pending"

    Status public cooking_status;
    // Returns uint
    // Pending  - 0
    // Cooking  - 1
    // Ready - 2
    // Burnt - 3
    // Canceled - 4

    function get() public view returns (Status){
        return cooking_status;
    }

    // Update status by passing uint into input
    function set(Status _status) public {
        cooking_status = _status;
    }

    // You can update to a specific enum like this
    function ready() public {
        cooking_status = Status.Ready;
    }

    // delete resets the enum to its first value, 0
    function reset() public {
        delete cooking_status;
    }
}