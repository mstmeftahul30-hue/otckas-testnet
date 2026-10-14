// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract OtckasBridge {
    address public owner;
    address public constant BURN_ADDRESS = 0x000000000000000000000000000000000000dEaD;
    
    uint256 public totalBurned;
    uint256 public totalMinted;

    event BridgeBurned(address indexed user, uint256 amount, string targetChain, uint256 timestamp);
    event BridgeMinted(address indexed receiver, uint256 amount, bytes32 indexed sourceTxHash, uint256 timestamp);
    event VaultFunded(address indexed funder, uint256 amount);

    mapping(bytes32 => bool) public processedHashes;

    modifier onlyOwner() {
        require(msg.sender == owner, "OtckasBridge: Unauthorized access");
        _;
    }

    constructor() payable {
        owner = msg.sender;
    }

    function burnAndBridge(string memory targetChain) external payable {
        require(msg.value > 0, "OtckasBridge: Transfer amount must exceed zero");
        totalBurned += msg.value;

        (bool success, ) = payable(BURN_ADDRESS).call{value: msg.value}("");
        require(success, "OtckasBridge: Burn transfer execution failed");

        emit BridgeBurned(msg.sender, msg.value, targetChain, block.timestamp);
    }

    function bridgeMint(
        address payable receiver,
        uint256 amount,
        bytes32 sourceTxHash
    ) external onlyOwner {
        require(!processedHashes[sourceTxHash], "OtckasBridge: Replay detected");
        require(address(this).balance >= amount, "OtckasBridge: Insufficient reserve balance");

        processedHashes[sourceTxHash] = true;
        totalMinted += amount;

        (bool success, ) = receiver.call{value: amount}("");
        require(success, "OtckasBridge: Disbursement failed");

        emit BridgeMinted(receiver, amount, sourceTxHash, block.timestamp);
    }

    receive() external payable {
        emit VaultFunded(msg.sender, msg.value);
    }

    function getBridgeReserve() external view returns (uint256) {
        return address(this).balance;
    }
}
