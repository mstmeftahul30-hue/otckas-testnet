# ⚡ Hardhat Deployment Pipeline

Hardhat provides a flexible local development environment for building, compiling, and deploying production dApps to Otckas Testnet.

## 1. Project Initialization

    mkdir otckas-dapp && cd otckas-dapp
    npm init -y
    npm install --save-dev hardhat @nomicfoundation/hardhat-toolbox dotenv
    npx hardhat init

## 2. Hardhat Configuration (hardhat.config.js)

    require("@nomicfoundation/hardhat-toolbox");
    require("dotenv").config();

    module.exports = {
      solidity: {
        version: "0.8.20",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
      networks: {
        otckas: {
          url: process.env.RPC_URL || "https://rpc.otckas.com",
          chainId: 88991,
          accounts: process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY] : [],
        },
      },
    };

## 3. Deploy Execution

    npx hardhat run scripts/deploy.js --network otckas
