// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

contract BANFTCollection is ERC721 {
    using Strings for uint256;

    uint256 public currentTokenId;
    uint256 public totalSupply;
    string public baseURI;

    event MintNFTCollection(address indexed userAddress_, uint256 tokenId_);

    constructor(string memory name_, string memory symbol_, uint256 totalSupply_, string memory baseURI_) ERC721(name_, symbol_) {
        totalSupply = totalSupply_;
        baseURI = baseURI_;
    }

      function mint() external {
        require(currentTokenId < totalSupply, "sold out");
        
        _safeMint(msg.sender, currentTokenId);
        uint256 id = currentTokenId;
        emit MintNFTCollection(msg.sender, id);
        currentTokenId++;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        _requireOwned(tokenId);
        string memory base = _baseURI();
        return bytes(base).length > 0 ? string.concat(base, tokenId.toString(), ".json") : "";
    }
}