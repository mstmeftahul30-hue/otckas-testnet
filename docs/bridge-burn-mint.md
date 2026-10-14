# 🌉 Cross-Chain Bridge Architecture (Burn & Mint Protocol)

Otckas Testnet implements a non-custodial, verifiable Burn & Mint cross-chain bridge architecture to eliminate central counterparty risk and guarantee circulating supply precision.

## Core Components
- **Burn Address:** 0x000000000000000000000000000000000000dEaD
- **Bridge Vault Smart Contract:** 0x4bde079e3a94a647b6cb3a3009a3d180fc170975
- **Bridge Hex Data Tag:** 0x4252494447455f4255524e

## Outbound Execution (Otckas -> Remote)
1. User calls burnAndBridge(targetChain).
2. Tokens are sent directly to 0x000...dEaD.
3. The explorer labels the transaction with Burn / Bridge.
4. An event BridgeBurned triggers the relayer to mint assets on the target chain.

## Inbound Execution (Remote -> Otckas)
1. User deposits on remote bridge.
2. Relayer validates cryptographic proofs and calls bridgeMint(receiver, amount, sourceTxHash) on Otckas.
3. Contract checks processedHashes mapping to prevent replay attacks.
4. Explorer marks transaction with Bridge Mint.
