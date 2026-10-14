# 🛠️ Deploying Smart Contracts via Remix IDE

Remix IDE is the fastest browser-based environment for compiling, deploying, and debugging smart contracts on Otckas Testnet.

## Step 1: Open Environment
1. Launch Remix IDE (https://remix.ethereum.org/).
2. Create a contract file named OtckasStandardToken.sol under contracts/.

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

## Step 2: Compile & Deploy
1. Compile using Solidity Compiler 0.8.20.
2. Under Deploy & Run Transactions, select Injected Provider - MetaMask.
3. Verify connection to chain 88991.
4. Enter 1000000 for initial supply and click Deploy.
5. Verify your source code on OtckasScan Explorer (https://explorer.otckas.com).
