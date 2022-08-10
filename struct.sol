//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract structProg {

    struct StudentInfo {
        uint8 id;
        string name;
        address addr;
    }

    StudentInfo public student;

    StudentInfo[] public student2;

    function set(uint8 _id, string memory _name, address _addr) public {
        student = StudentInfo(_id, _name, _addr);
    }

    function set2(uint8 _id, string memory _name, address _addr) public {
        student2.push(StudentInfo(_id, _name, _addr)); // method 1
        // student2.push(StudentInfo({id : _id, name : _name, addr : _addr})); // method 2

        // StudentInfo memory x;  //medhod 3
        // x.id = _id;
        // x.name = _name;
        // x.addr = _addr;

        // x.push(x);
    }

    function get(uint _index) public view returns (uint8 id, string memory name, address addr) {
        StudentInfo storage stu = student2[_index];
        return (stu.id, stu.name, stu.addr);
    }

    // update text
    function updateText(uint _index, string calldata _text) public {
        StudentInfo storage stu = student2[_index];
        stu.name = _text;
    }

}
