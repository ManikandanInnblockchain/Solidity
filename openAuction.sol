//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract openAuction {

    address payable public benificiery;
    uint endTime;

    struct pendingBittersStruct {
        address bitterAddr;
        uint amount;
    }

    mapping(uint => pendingBittersStruct) public pendingBitters;

    address public highestBitter;
    uint public highestAmount;

    address public owner;

    bool isStarted;
    bool isEnded = true;
    uint count;
    
    constructor(address _benificery, uint _endDay) {
        owner = msg.sender;
        benificiery = payable(_benificery);
        endTime = block.timestamp + (_endDay * 24 * 60 * 60);
    }

    modifier isOwner() {
        require(msg.sender == owner ,"This is not Owner");
        _;
    }

    modifier canBit() {
        require(isStarted, "Bitting not started");
        require(!isEnded, "Bitting ended");
        _;
    }

    function startBitting() external isOwner {
        require(!isStarted, "Bitting not started");
        require(isEnded, "Bitting not ended");

        isStarted = true;
        isEnded = false;
    }

    function bit() external payable canBit{
        if(msg.value <= highestAmount) {
            revert("amout is less than highest bit");
        }
        
        if(msg.value > highestAmount) {
            pendingBitters[count] = pendingBittersStruct(highestBitter, highestAmount);
            ++count;

            highestAmount = msg.value;
            highestBitter = msg.sender;
        }

        isStarted = true;
    }

    function endBitting() external isOwner canBit{
        if(block.timestamp < endTime) {
            revert("bitting end time not met");
        }

        isEnded = true;
        isStarted = false;
    }

    function finaliseBit() external isOwner {
        require(!isStarted, "Bitting is in progress");
        require(isEnded, "Bitting not ended");

        benificiery.transfer(highestAmount);
        
        for(uint8 i; i<count; i++) {
            payable(pendingBitters[i].bitterAddr).transfer( pendingBitters[i].amount );
            delete pendingBitters[i];
        }

    }
