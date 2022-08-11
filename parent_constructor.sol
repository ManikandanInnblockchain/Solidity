//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;


contract animal {
    string public a = "test";

    function get() public pure returns(string memory) {
        return "this is just string";
    }
}

contract anime {
    function getval() external pure returns(string memory) {
        return "this is another string";
    }
}

contract bird {

    function show() public returns(string memory, string memory, string memory) {
        animal a = new animal();
        anime b = new anime();
        return (a.a(), a.get(), b.getval());
    }
}
