//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract arrays {
    
    uint[] public a;
    uint[3] public b = [1,2,3];
    uint[] public c = new uint[](2);
    string[] public e = new string[](3); 
    
    function set() public {
        for(uint8 i=0; i<4; i++) {
            a.push(i+1);
            e[i] = "value";
        }
    }

    function del(uint _idx) public returns (uint[3] memory){ 
        // b[_idx] = b[b.length-1];
        // b[b.length-1] = 0;

        delete b[_idx];
        return b;
    }

    //pop(), push() works only dynamic array 
    //fixed type of array we can assign, but cannot modify lenght or slot

}
