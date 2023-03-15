pragma solidity ^0.8.17 ;

import "hardhat/console.sol";

contract Test {
    constructor ()  {
        uint8 small = 0;
        small--;

        uint8 large = 255;
        large++;
        console.log(small); // prints 255
        console.log(large); // prints 0
    }
}