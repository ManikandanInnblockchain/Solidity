// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Event {
    event Log(address indexed sender, string message);
    event Log2();

    function test() public {
        emit Log(msg.sender, "This is first event!");
        emit Log(msg.sender, "another event!");
        emit Log2();
    }
}
