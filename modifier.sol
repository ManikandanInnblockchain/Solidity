// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract modifierProg { 
    
    address public owner;
    address public zero = address(0);

    constructor(){
        owner = msg.sender;
    }

    modifier check_owner() {
        require (owner == msg.sender, "This is not owner");
        _;
    }

    modifier check_adderss(address _addr) {
        require (_addr != address(0), "this address is not valid");
        _;
    }

    function changeOwner(address _addre) public check_owner check_adderss(_addre) {
        owner = _addre;
    }

}
