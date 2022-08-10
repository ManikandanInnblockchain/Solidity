// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract errors { 
    
    uint8 public a = 10;

    error myerror(string err);

    function require_check(uint8 _val) public pure{
        require(_val == 9, "a is not 9 asdfasdfadf asdfasdf sdfasdf esda sdf sdfsdf");// with optinal error string
        //  require(_val == 9); //without string
    }

    function revert_check() public pure{
        // it takes some gas based on error message length
        revert("a is not 9");
    }

    function revert_check2() public pure{
        // it takes some gas based on error message length
        revert myerror("this is the error");
    }
}
