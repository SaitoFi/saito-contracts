require("@nomiclabs/hardhat-waffle");

const RINKEBY_API_KEY = "";

const RINKEBY_PRIVATE_KEY = "";

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.0",
  networks: {
    rinkeby: {
      url: RINKEBY_API_KEY,
      accounts: [`${RINKEBY_PRIVATE_KEY}`]
    }
  }
};
