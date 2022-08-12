//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract Biscut {
    string public name;
    address public owner;
    uint public price;

    constructor(string memory _name, uint _price) payable {
        name = _name;
        price = _price;
        owner = address(this);
    }
}

contract biscutFactory {
    Biscut[] public bis;

    function create(string memory _name, uint _price) public {
        Biscut biscut = new Biscut(_name, _price);
        bis.push(biscut);
    }

    function createWithEther(string memory _name, uint _price, uint _val) public payable {
        Biscut biscut = (new Biscut){value : _val}(_name, _price);
        bis.push(biscut);
    }

    function getContract(uint _indx) public view returns (string memory name, uint price, address owner, uint balance) {
       Biscut b =  bis[_indx];
       return (b.name(), b.price(), b.owner(), address(b).balance );
    }
}
