//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;


contract animal {
    function sound() public virtual pure returns(string memory) {
        return "sounds like loud";
    }
}

contract bird is animal {
    function sound() public virtual override pure returns(string memory) {
        return "sounds like little low";
    }
}

contract dog is animal {
    function sound() public override pure returns(string memory) {
        return super.sound();
    }
}

contract hybread is animal, bird {
    function sound() public override(animal, bird) pure returns(string memory) {
        return super.sound();
    }
}
