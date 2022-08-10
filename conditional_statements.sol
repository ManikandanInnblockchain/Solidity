//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract conditional_statements {

    function myprog(uint256 _val) internal pure returns(uint) {
        uint256 a = _val;

        if(a == 11) { //nested if condition
            return 0;
        }else if(a == 12){
            return 1;
        }else {
            return 2;
        }  
    }

    function set(uint256 _val) public pure returns(uint){
        uint b = myprog(_val);
        uint i;
        bool can_proceed = ( b == 0) ? true : false; //ternery

        if(can_proceed){
            while(i<=3) { // while loop
                i++;
            }
        }

        for(i; i<=9; i++) { //for loop
            i++; 
        }
        
        return i;
    }     
}
