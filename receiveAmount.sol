//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract receiveAmount {
    
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    modifier isOwner() {
        require( owner == msg.sender ,"Not a Owner");
        _;
    }

    receive() external payable {}  

    function withdraw(uint _amount) external isOwner {
        payable(msg.sender).transfer(_amount);

        //we can also use
        // payable(msg.sender).call{value:_amount}("");
    }
}
