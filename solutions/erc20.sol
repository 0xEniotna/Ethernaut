// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Attacker {
    ERC20 immutable victim;
    address attacker;
    constructor(address _victim) {
        victim = ERC20(_victim);
        attacker = msg.sender;
    }

    function attack() external {
        uint256 attacker_balance = victim.balanceOf(attacker);
        victim.transferFrom(attacker, address(this), attacker_balance);
    }
}