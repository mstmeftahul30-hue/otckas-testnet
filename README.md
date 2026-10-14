cat << 'EOF' > README.md
# 🌐 Otckas Testnet (EVM Protocol Infrastructure)

[![Chain ID](https://img.shields.io/badge/Chain%20ID-88991-blue.svg)](https://rpc.otckas.com)
[![Block Explorer](https://img.shields.io/badge/Explorer-OtckasScan-orange.svg)](https://explorer.otckas.com)
[![Twitter Follow](https://img.shields.io/badge/Twitter-@otckas-1DA1F2?logo=x&logoColor=white)](https://x.com/otckas)
[![Telegram Community](https://img.shields.io/badge/Telegram-@otckas-2CA5E0?logo=telegram&logoColor=white)](https://t.me/otckas)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Network Status](https://img.shields.io/badge/Network%20Status-Operational-brightgreen.svg)](https://rpc.otckas.com)

Welcome to the official developer hub and architecture documentation for **Otckas Testnet**. 

Otckas is a decentralized, high-throughput Layer-1 EVM-compatible blockchain designed for high-frequency smart contracts, DeFi applications, tokenization, and cross-chain execution. Otckas natively implements non-custodial **Burn & Mint** bridging standards to maintain absolute token supply integrity across all connected environments.

---

## ⚡ Core Network Specifications

| Parameter | Configuration Detail |
| :--- | :--- |
| **Network Name** | Otckas Testnet |
| **Chain ID** | `88991` (Hex: `0x15baf`) |
| **Currency Symbol** | `OKAS` |
| **Decimals** | `18` |
| **Public JSON-RPC URL** | `[https://rpc.otckas.com](https://rpc.otckas.com)` |
| **Block Explorer** | `[https://explorer.otckas.com](https://explorer.otckas.com)` |
| **Testnet Faucet** | `[https://faucet.otckas.com](https://faucet.otckas.com)` |
| **Official Burn Address** | `0x000000000000000000000000000000000000dEaD` |
| **Bridge Vault Contract** | `0x4bde079e3a94a647b6cb3a3009a3d180fc170975` |

---

## 🏛️ Cross-Chain Architecture: Burn & Mint Protocol

Otckas utilizes a mathematical supply-invariant model for all asset migrations:

```
[ Otckas Testnet (88991) ]                           [ External Network (Remote) ]
           │                                                       ▲
  User invokes burnAndBridge()                                     │
           │                                                       │
           ▼                                                       │
Transfers OKAS to 0x000...dEaD (Permanent Destruction)             │
           │                                                       │
           ▼                                                       │
Emits `BridgeBurned` On-Chain Event ───────────────────────────────┘
                                     Cryptographic Proof Relayed
                                     Tokens Minted / Released
```

---

## 🚀 Rapid Developer Quickstart

### 1. MetaMask Manual Setup
- **Network Name:** Otckas Testnet
- **New RPC URL:** `[https://rpc.otckas.com](https://rpc.otckas.com)`
- **Chain ID:** `88991`
- **Currency Symbol:** `OKAS`
- **Block Explorer URL:** `[https://explorer.otckas.com](https://explorer.otckas.com)`

### 2. Querying Node State via cURL
Test network health and block height directly from your command line:

```bash
curl -X POST https://rpc.otckas.com \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}'
```

---

## 🛠️ Smart Contract Deployment

### Standard ERC-20 Token Template
Below is the optimized Solidity implementation for testing protocols on Otckas:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract OtckasStandardToken {
    string public name = "Otckas Builder Token";
    string public symbol = "OBT";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(uint256 initialSupply) {
        totalSupply = initialSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
}
```

### Hardhat Pipeline Configuration (`hardhat.config.js`)
```javascript
require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.20",
  networks: {
    otckas: {
      url: "https://rpc.otckas.com",
      chainId: 88991,
      accounts: [process.env.DEPLOYER_PRIVATE_KEY]
    }
  }
};
```

---

## 📚 In-Depth Technical Guides

- **[Network Architecture & JSON-RPC](docs/network-specs.md)**
- **[MetaMask & Wallet Integration](docs/metamask-setup.md)**
- **[Remix Deployment & Verification Guide](docs/deploy-remix.md)**
- **[Hardhat Pipeline Automation](docs/deploy-hardhat.md)**
- **[Foundry & Forge Tooling](docs/deploy-foundry.md)**
- **[Bridge Mathematical Specifications](docs/bridge-burn-mint.md)**
- **[Faucet Mechanics & Gas Strategy](docs/faucet-guide.md)**

---

## 🌐 Community & Ecosystem Channels

Follow official protocol developments:
- **X / Twitter:** [@otckas](https://x.com/otckas)
- **Telegram:** [@otckas](https://t.me/otckas)
- **Block Explorer:** [OtckasScan Explorer](https://explorer.otckas.com)

---

## 🛡️ License & Standards
This ecosystem codebase is distributed under the [MIT License](LICENSE).
EOF

git add README.md
git commit -m "docs: enrich README with architecture diagrams and quickstart code"
git push -u origin main
echo "README UPDATED SUCCESSFULLY!"
