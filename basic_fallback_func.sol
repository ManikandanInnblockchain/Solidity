// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract fallbackProg {
    event log(address _adddr);

    fallback() external payable {
        emit log(msg.sender);
    } 

    function getMyBal() public view returns(uint){
        return address(this).balance;
    }
}

//deploy above contract and get address

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract caller {

    function trigger(address _addr) public payable {
        _addr.call{value:msg.value}("");
    } 
}
