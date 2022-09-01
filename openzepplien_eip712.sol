// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/cryptography/draft-EIP712.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract openz is EIP712 {
    address public conAddr;
    address public recAddr;
    bytes32 public digest;

    constructor(string memory name, string memory version) EIP712(name, version){
        conAddr = address(this);
    }

    function verify(bytes memory signature, address signer, address mailTo, string memory mailContents) external returns(bool){
        bytes32 digest = _hashTypedDataV4(keccak256(abi.encode(
            keccak256("Mail(address to,string contents)"),
            mailTo,
            keccak256(bytes(mailContents))
        )));
        address recoveredSigner = ECDSA.recover(digest, signature);
        recAddr = recoveredSigner;
        return recoveredSigner == signer;
    }

}
