//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract vote {
    address public owner;
    
    struct voterStruct {
        bool isVoted;
        bool isPermissioned;
        uint8 candidateId;
    }
    
    mapping(address => voterStruct) public voter;

    struct candidateStruct {
        string name;
        uint8 voteCount;
    }

    candidateStruct[] public candidates;

    modifier isOwner() {
        require(msg.sender == owner, "Only owner can give permission");
        _;
    }

    modifier validVoter(address _addr) {
        require(!voter[_addr].isPermissioned, "This voter has permission");
        _;
    }

    modifier validVote() {
        require(voter[msg.sender].isPermissioned, "This voter has not permission");
        _;
    }

    modifier notVoted() {
        require(!voter[msg.sender].isVoted, "already voted");
        _;
    }

    constructor(string[] memory _names) {
        owner = msg.sender;
        for(uint8 i; i<_names.length ; i++) {
            candidates.push(candidateStruct({ name : _names[i], voteCount : 0 }));            
        }
    }

    function proceedVote(uint8 _candidateId) public validVote notVoted {
        voter[msg.sender].isVoted = true;
        voter[msg.sender].candidateId = _candidateId;

        candidates[_candidateId].voteCount += 1;         
    }

    function giveVotePermission(address _addr) public isOwner validVoter(_addr) {
        voter[_addr].isPermissioned = true;
    }

    function result() public isOwner view returns(uint8 vCountId) {
        uint8 vcount;
        uint8 vCountId;
        for(uint8 i; i< candidates.length; i++) {
            if( vcount < candidates[i].voteCount) {
                vcount = candidates[i].voteCount;
                vCountId = i;
            }
        }
    }
}
