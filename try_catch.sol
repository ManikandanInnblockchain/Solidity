//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract A {
   function cal(uint _x) external pure returns(uint8) {
       require(_x != 1, "this is require");
       assert(_x != 2);
       return 10;
    } 
}

contract b {
    event log(string reason);
    event log2(uint8 num);
    event log3(bytes reason);


    function caller(address _addr, uint8 _val) public returns(string memory) {
        A x = A(_addr);

        try x.cal(_val) returns(uint8 v){
            emit log2(v);
            return "success";
        }catch Error(string memory reason) {
            emit log(reason);
            return "failed";
        }catch (bytes memory reason){
            emit log3(reason);
            return "failed-byte";
        }

    }
}
