const hre = require("hardhat");


async function deploy(contractName, nonce) {
  console.log("Deploying", contractName)
  const Factory = await hre.ethers.getContractFactory(contractName);
  let impl = await Factory.deploy({nonce: nonce});
  console.log(impl.address)
  return impl
}

async function main() {
  await hre.run("compile");

  let nonce = 0;

  let renderer = await deploy("OfficeHoursRenderer", nonce);
  nonce++;

  await renderer.setInventory(professions1.address, professions2.address, locations.address, rares.address, { nonce: nonce });
  nonce++;

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
