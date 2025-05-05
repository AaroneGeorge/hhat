const hre = require("hardhat");
// Contract Files
const HelloWorld = "HelloWorld"
const Counter = "Counter"
const Mapping = "Mapping"
const Enum = "Enum"
const ProfileManager = "ProfileManager"
const NoReentrancy = "FunctionModifier"

async function main() {
  const contract = await hre.ethers.getContractFactory(NoReentrancy);
  const contract_dep = await contract.deploy();

  await contract_dep.waitForDeployment();
  console.log("Contract deployed to:", await contract_dep.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
