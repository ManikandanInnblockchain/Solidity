//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract myconstant {

    // These values cannot be change
    uint8 constant public minage = 18;
    address constant public myaddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // function change() public {
    //     minage = 19; //produce error => Cannot assign to a constant variable.
    // }
    
}
