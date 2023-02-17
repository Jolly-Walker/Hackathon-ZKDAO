require("@nomicfoundation/hardhat-toolbox");
require("@nomicfoundation/hardhat-chai-matchers");
const {ethRPCNode} = require("./secrets.json");
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    localhost: {
      chainId: 31337,
      url: "http://127.0.0.1:8545",
    },
    hardhat: {
      forking: {
        url: ethRPCNode,
        blockNumber: 16625969
      }
    }
  },
  solidity: "0.8.17",
};
