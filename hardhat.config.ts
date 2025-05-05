import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

// TODO: Consider using a .env file to manage environment variables securely
// Example: const SEPOLIA_RPC_URL = process.env.SEPOLIA_RPC_URL || "https://sepolia.infura.io/v3/YOUR-PROJECT-ID";
// Example: const PRIVATE_KEY = process.env.PRIVATE_KEY || "your private key";

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  networks: {
    hardhat: {
      // Default configuration for the local Hardhat Network
    },
    localhost: {
      url: "http://127.0.0.1:8545", // URL for a local node (e.g., running `npx hardhat node`)
      // No accounts needed here typically, Hardhat node provides them
    },
    // sepolia: {
    //   url: "https://sepolia.infura.io/v3/YOUR_INFURA_PROJECT_ID", // Replace with your Infura project ID or other RPC URL
    //   accounts: ["0xYOUR_PRIVATE_KEY"] // Replace with your deployer account's private key
    //   // Consider loading from environment variables for security: accounts: PRIVATE_KEY ? [PRIVATE_KEY] : []
    // },
    // mainnet: {
    //   url: "https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID", // Replace with your Infura project ID or other RPC URL
    //   accounts: ["0xYOUR_PRIVATE_KEY"] // Replace with your deployer account's private key
    //   // Consider loading from environment variables for security: accounts: PRIVATE_KEY ? [PRIVATE_KEY] : []
    // }
  },
};

export default config;
