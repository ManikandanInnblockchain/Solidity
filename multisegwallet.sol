//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract multisegWallet {

    uint8 public requiredConformNum;
    mapping(address => bool) public validOwnerAddr;

    struct transaction_stu {
        address to;
        uint8 value;
        bool isExecuted;
        uint8 numOfApproveCount;
    }

    uint8 public tnxCount;
    mapping(uint8 => transaction_stu) public allTxs;
    mapping(uint8 => mapping(address => bool)) public conformations;

    modifier validOwner() {
        require(validOwnerAddr[msg.sender], "Not valid Owner");
        _;
    }

    modifier notExecuted(uint8 _tnxid) {
        require(allTxs[_tnxid].isExecuted == false, "Aready executed");
        _;
    }

    modifier validConfirm(uint8 _tnxid) {
        require(!conformations[_tnxid][msg.sender], "Aready confirmed");
        _;
    }

    modifier validDecline(uint8 _tnxid) {
        require(conformations[_tnxid][msg.sender], "Aready Declined");
        _;
    }

    modifier validApprovedCount(uint8 _tnxid) {
        require(allTxs[_tnxid].numOfApproveCount >= requiredConformNum, "Need Approved count to execute");
        _;
    }

    constructor(address[] memory _owners, uint8 _required) payable {

        for(uint8 i=0; i<=_owners.length-1; i++ ) {
            require(_owners[i] != address(0), "Address not valid");
            validOwnerAddr[_owners[i]] = true;
        }

        require(_required <= _owners.length , "Required number of conformation is not valid");
        requiredConformNum = _required;
    }

    receive()external payable {} // for receive ether

    // To submit transaction 
    function submitTransaction(address _to, uint8 _value) external {

        allTxs[tnxCount] = transaction_stu({
                to: _to,
                value: _value,
                isExecuted: false, 
                numOfApproveCount: 0
            });
        ++tnxCount;
    }

    // To confirm transaction 
    function conformTransaction(uint8 _tnxId) external validOwner validConfirm(_tnxId){
        conformations[_tnxId][msg.sender] = true;
        allTxs[_tnxId].numOfApproveCount += 1;
    }

    // // To decline transaction
    function declineTransaction(uint8 _tnxId) external validOwner validDecline(_tnxId) {
        conformations[_tnxId][msg.sender] = false;
        allTxs[_tnxId].numOfApproveCount -= 1;
    }

    // To execute transaction
    function executeTransaction(uint8 _tnxId) external validOwner validApprovedCount(_tnxId) notExecuted(_tnxId) {
        allTxs[_tnxId].isExecuted = true;
        address to = allTxs[_tnxId].to;
        uint8 value = allTxs[_tnxId].value;
        (bool success, ) =  to.call{value: value}("");
        require(success, "tx failed");

    }   

}
