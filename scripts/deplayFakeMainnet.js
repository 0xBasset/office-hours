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

  let nonce = 13;

  let renderer = await deploy("MockOfficeHoursRenderer", nonce);
  nonce++;

  // Deploy Calendar
  let calendar = await deploy("MockCalendar", nonce);
  nonce++;

  let officeHours = await deploy("OfficeHours", nonce);
  nonce++;
  
  console.log("Configuring")
  await officeHours.setRenderer(renderer.address, { nonce: nonce });
  nonce++;

  await officeHours.setCalendar(calendar.address, { nonce: nonce });
  nonce++;
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
