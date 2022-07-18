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

  // Deploy Inventories
  let rares = await deploy("Rares");
  let professions = await deploy("Professions");
  let locations =  await deploy("Locations");

  let renderer = await deploy("OfficeHoursRenderer");

  await renderer.setInventory(professions.address, locations.address, rares.address);

  // Deploy Calendar
  let calendar = await deploy("Calendar");
  let officeHours = await deploy("OfficeHours");
  
  console.log("Configuring")
  await officeHours.setRenderer(renderer.address);
  await officeHours.setCalendar(calendar.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
