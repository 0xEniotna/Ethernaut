// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract Attacker  {
    function getByte(bytes32[3] memory data) public pure  returns (bytes16){
        return bytes16(data[2]);
    }
}