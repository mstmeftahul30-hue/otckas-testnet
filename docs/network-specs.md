# ⚙️ Otckas Network Technical Specifications

This reference manual specifies the low-level blockchain parameters, consensus structure, and JSON-RPC implementations running on the Otckas Testnet.

## 1. Node Execution & Genesis Constants
- **Chain Identifier (EIP-155):** 88991
- **Consensus Engine:** EVM Compatible Proof-of-Authority (PoA)
- **Native Denomination:** OKAS
- **Smallest Subunit:** Wei (1 OKAS = 10^18 Wei)
- **Block Target Time:** ~2.0 - 3.0 Seconds
- **Target Gas Limit per Block:** 30,000,000 Gas
- **Base Fee Mechanism:** EIP-1559 Dynamic Gas Architecture

## 2. Infrastructure Endpoints
| Protocol | Address / Domain | Status |
| :--- | :--- | :--- |
| **HTTPS JSON-RPC** | https://rpc.otckas.com | Active |
| **Block Explorer** | https://explorer.otckas.com | Active |
| **Faucet Portal** | https://faucet.otckas.com | Active |

## 3. Supported JSON-RPC API Methods
- eth_chainId (Returns 0x15baf for 88991)
- eth_blockNumber
- eth_getBalance
- eth_getStorageAt
- eth_getTransactionCount
- eth_getCode
- eth_sendRawTransaction
- eth_call
- eth_estimateGas
- eth_getBlockByHash
- eth_getBlockByNumber
- eth_getTransactionByHash
- eth_getTransactionReceipt
- eth_getLogs
