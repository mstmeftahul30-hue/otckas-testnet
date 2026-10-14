# 🔨 Foundry Integration & Deployment Guide

Foundry is a modular toolkit for Ethereum application development written in Rust.

## Configuration (foundry.toml)

    [profile.default]
    src = "src"
    out = "out"
    libs = ["lib"]
    solc_version = "0.8.20"

    [rpc_endpoints]
    otckas = "https://rpc.otckas.com"

## Deploy Contract via Forge

    forge create src/MyContract.sol:MyContract --rpc-url https://rpc.otckas.com --private-key $PRIVATE_KEY --legacy
