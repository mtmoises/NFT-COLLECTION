// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Script.sol";
import "../src/BANFTCollection.sol";

contract DeployNFTCollection is Script {
    function run() external {
        vm.startBroadcast();
        new BANFTCollection("Blockchain Accelerator NFT", "BANFT", 2, "ipfs://bafybeihtrzz56gpsldxw3hu7ukzkolcczuq6rgmwvisoyo2o7s6qwensqy/");
        vm.stopBroadcast();
    }
}