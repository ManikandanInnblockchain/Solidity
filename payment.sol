// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    
    address payable owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposit() public payable {}

    function withdraw() public {
        owner.call{value:address(this).balance}("");
    }

    function transfer(address payable _to, uint _val) public {
        _to.call{value:_val}("");
    }

    function getMyBalance() public view returns(uint) {
        return address(this).balance;
    }
}
