// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Foo {
    string public name = "Foo";
}

//save above code as seperate contract

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// import Foo.sol from current directory
import "./Foo.sol";

contract Import {

    Foo public foo = new Foo();
    function getFooName() public view returns (string memory) {
        return foo.name();
    }
}
