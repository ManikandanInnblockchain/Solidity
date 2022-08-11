// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    uint256 public count;

    function increment() external {
        count += 1; 
    }

    function foo() external pure returns(string memory) {
        return "this is foo"; 
    }

    function bar() external pure returns(string memory) {
        return "this is bar"; 
    }
}

//deploy above as a contract

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICounter {
    function count() external view returns (uint);

    function increment() external;

    function foo() external returns (string memory);

    function bar() external returns (string memory);
}

contract b {
    function getcount(address _addr) external view returns (uint256) {
        return ICounter(_addr).count();
    }

    function increment(address _addr) external {
      ICounter(_addr).increment();
    }

    function fooo(address _addr) external returns (string memory) {
      return ICounter(_addr).foo();
    }

    function barr(address _addr) external returns (string memory) {
      return ICounter(_addr).bar();
    }
}
