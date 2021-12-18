async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  console.log("Account balance:", (await deployer.getBalance()).toString());

  const ArbPool = await ethers.getContractFactory("SaitoArbPool");
  const arbPool = await ArbPool.deploy("0x8A8b5a97978dB4a54367D7DCF6a50980990F2373", "0x578BAde599406A8fE3d24Fd7f7211c0911F5B29e", 1, 1);

  console.log("Saito address:", arbPool.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });