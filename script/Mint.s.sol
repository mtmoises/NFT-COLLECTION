// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Script.sol";
import "../src/BANFTCollection.sol";

contract MintScript is Script {
    function run() external {
        vm.startBroadcast();
        BANFTCollection nft = BANFTCollection(0x4457Fb209f3e20901C740bCA42C9958bebC00F49);
        nft.mint();
        nft.mint();
        vm.stopBroadcast();
    }
}