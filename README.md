# 🖼️ BA NFT Collection Smart Contract

A gas-optimized, secure **ERC-721** non-fungible token collection smart contract built with **Solidity 0.8.20** and OpenZeppelin contracts. 

This contract features a dynamic token minting mechanism with a strict supply cap, automatic URI concatenation for metadata management, and custom event logging.

---

## 📌 Architecture & Features

- **ERC-721 Standard Compliance:** Inherits from OpenZeppelin's robust ERC-721 implementation for safe and secure token ownership management.
- **Capped Supply Control:** Enforces a maximum token limit (`totalSupply`) defined upon deployment, ensuring strict digital scarcity (`sold_out` checks).
- **Dynamic Metadata & BaseURI:** Overrides `_baseURI()` and `tokenURI()` to seamlessly append `.json` extensions to individual token IDs.
- **Transparent Event Emission:** Emits a custom `MintNFTCollection` event on every successful mint for off-chain indexing and frontend tracking.
- **Secure Minting Logic:** Uses `_safeMint` to ensure recipient addresses are fully capable of handling ERC-721 tokens, preventing accidental loss.

---

## 🛠 Tech Stack & Tools

- **Language:** Solidity `^0.8.20`
- **Framework:** Foundry / Hardhat
- **Libraries:** OpenZeppelin Contracts (`ERC721`, `Strings`)
- **Target Network:** EVM Compatible Chains

---

## 🚀 Smart Contract Overview

### Core Functions

1. **`constructor(string memory name_, string memory symbol_, uint256 totalSupply_, string memory baseURI_)`**
   - Initializes the NFT collection with a custom name, symbol, max supply cap, and base metadata URI.

2. **`mint()`**
   - External function allowing any user to mint the next available token ID.
   - Enforces the `totalSupply` limit via a `require` check.
   - Triggers `_safeMint` to `msg.sender` and increments the tracker.

3. **`tokenURI(uint256 tokenId)`**
   - Public view function that checks ownership via `_requireOwned` and returns the concatenated URL string (`baseURI + tokenId + .json`).

---

## ⚡ Quickstart & Testing (Foundry)

### 1. Clone Repository & Install Dependencies
```bash
git clone [https://github.com/mtmoises/ba-nft-collection.git](https://github.com/mtmoises/ba-nft-collection.git)
cd ba-nft-collection
forge install
