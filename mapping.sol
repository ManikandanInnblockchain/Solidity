//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract mymapping1 {
    
    mapping(uint8 => address) private mymap1;
    uint8 i;

    function set(address _addr) public {
        mymap1[i] = _addr; // assign address to map
        i++; //increment state variable
    }

    function get(uint8 _idx) public view returns(address) {
        return mymap1[_idx];
    }

    function del(uint8 _idx) public {
        delete mymap1[_idx];
    }
}

contract multimapping {
    mapping(string => mapping(string => address[])) public mymap2;
    mapping(string => mapping(string => address)) public mymap3;

    function set(string memory _company, string memory _name, address _addr) public {
        mymap2[_company][_name].push(_addr); 
    }

    function set2(string memory _company, string memory _name, address _addr) public {
        mymap3[_company][_name] = _addr; 
    }

    function get(string memory _company, string memory _name, uint8 _idx) public view returns(address) {
        return mymap2[_company][_name][_idx];
    }

    function del(string memory _company, string memory _name) public {
        delete mymap2[_company][_name];
    }
}
