// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {EscrowFactory} from "../src/EscrowFactory.sol";

// forge script script/DeployEscrowFactory.s.sol:DeployEscrowFactory --rpc-url bsc_testnet --broadcast --verify -vvvv --legacy
contract DeployEscrowFactory is Script {
    function run() external {
        address rewardTokenAddr = vm.envAddress("REWARD_TOKEN");
        require(rewardTokenAddr.code.length > 0, "REWARD_TOKEN belum ke-deploy di chain ini");
        address oracleAddr = vm.envAddress("ORACLE_ADDRESS");

        address initialOwner = msg.sender;
        vm.startBroadcast();
        EscrowFactory factory = new EscrowFactory(IERC20(rewardTokenAddr), initialOwner, oracleAddr);
        vm.stopBroadcast();

        console.log("EscrowFactory:", address(factory));
        console.log("Oracle:", factory.oracle());
    }
}
