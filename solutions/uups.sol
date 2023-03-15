// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SelfDestruct {
    function selfDestruct(address payable transferAddress) external {
        selfdestruct(transferAddress);
    }
}