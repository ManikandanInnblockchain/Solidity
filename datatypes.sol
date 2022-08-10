// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Primitives {
    bool public boolval = true;
    bool public boolvalf = false;

    //unsigned integers
    uint8 public uval8  = 1;
    uint public uval256 = 456;
    uint public uval    = 123; 

    //signed integers
    int8 public ival8   = -1;
    int public ival256  = 456;
    int public ival     = -123; 

    // minimum and maximum of int
    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    uint8 public uminInt8 = type(uint8).min;
    uint8 public umaxInt8 = type(uint8).max;

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    bytes1 a = 0xb5; //  [10110101]
    bytes1 b = 0x56; //  [01010110]

    // Default values
    // Unassigned variables have a default value
    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}
