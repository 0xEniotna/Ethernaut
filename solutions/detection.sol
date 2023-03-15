// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IDetectionBot {
    function handleTransaction(address user, bytes calldata msgData) external;
}

interface IForta {
    function raiseAlert(address user) external;
}

contract DoubleEntryPointSolution is IDetectionBot {
    address cryptoVault;

    constructor(address _cryptoVault) {
        cryptoVault = _cryptoVault;
    }

    function handleTransaction(address user, bytes calldata msgData) external {
        // msgData is ABI-encoded data for:
        // function delegateTransfer(address to, uint256 value, address origSender) returns (bool)
        (, , address origSender) = abi.decode(
            msgData[4:],
            (address, uint256, address)
        );
        if (cryptoVault == origSender) {
            IForta(msg.sender).raiseAlert(user);
        }
    }
}