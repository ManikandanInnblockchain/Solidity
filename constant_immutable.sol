//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract myconstant {

    // These values cannot be change
    uint8 constant public MINIMUM_AGE = 18;
    address constant public CONTRACT_ADDRESS = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    
    // These values cannot be change once set in constructor
    uint8 immutable public MINAGE;
    address immutable public MYADDRESS;
    
    constructor(uint8 _age, address _addr){
        MINAGE = _age;
        MYADDRESS = _addr;
    }   

    // function change() public {
    //     MINIMUM_AGE = 19; //produce error => Cannot assign to a constant variable.
    // }
    
}
