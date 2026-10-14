# 🦊 MetaMask & Web3 Wallet Integration Guide

This guide details how to integrate the Otckas Testnet into non-custodial Web3 wallets.

## Method 1: Automated dApp RPC Injection

    async function addOtckasNetwork() {
      if (window.ethereum) {
        try {
          await window.ethereum.request({
            method: 'wallet_addEthereumChain',
            params: [
              {
                chainId: '0x15baf',
                chainName: 'Otckas Testnet',
                nativeCurrency: {
                  name: 'OKAS',
                  symbol: 'OKAS',
                  decimals: 18,
                },
                rpcUrls: ['https://rpc.otckas.com'],
                blockExplorerUrls: ['https://explorer.otckas.com'],
              },
            ],
          });
        } catch (error) {
          console.error('Failed to add Otckas Testnet:', error);
        }
      }
    }

## Method 2: Manual Wallet Setup
1. Open MetaMask and select Add Network -> Add a network manually.
2. Enter the parameters:
   - Network Name: Otckas Testnet
   - New RPC URL: https://rpc.otckas.com
   - Chain ID: 88991
   - Currency Symbol: OKAS
   - Block Explorer URL: https://explorer.otckas.com
3. Click Save.
