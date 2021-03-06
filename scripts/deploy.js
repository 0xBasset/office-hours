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

  // Deploy Inventories
  let rares = await deploy("Rares", nonce);
  nonce++;

  let professions1 = await deploy("Professions1", nonce);
  nonce++;

  let professions2 = await deploy("Professions2", nonce);
  nonce++;

  let locations =  await deploy("Locations", nonce);
  nonce++;

  let renderer = await deploy("OfficeHoursRenderer", nonce);
  nonce++;

  await renderer.setInventory(professions1.address, professions2.address, locations.address, rares.address, { nonce: nonce });
  nonce++;

  // Deploy Calendar
  let calendar = await deploy("Calendar", nonce);
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
