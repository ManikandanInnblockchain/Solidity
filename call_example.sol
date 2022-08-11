// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Receiver {

    fallback() external payable {}

    function foo() public returns(string memory){
        return "return data";
    }
}

interface res {
    function foo() external returns(string memory);
}

contract Caller {

    function testCallFoo(address payable _addr) public returns(string memory) {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("foo()")
        );
    }

    function testCallDoesNotExist(address _addr) public {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("doesNotExist()")
        );
    }
}
