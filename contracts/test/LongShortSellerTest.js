const { expect } = require("chai");
const { ethMainnet } = require("./addresses.js");
  
describe("Deployment", function () {
    let contractInstance;
    before(async function(){
        const shortContractF = await ethers.getContractFactory("LongShortSelling");
        contractInstance = await shortContractF.deploy(ethMainnet.USDT, ethMainnet.WBTC, 300);
    })

    it("Deploy LongShortSelling", async function(){
        contractInstance.deposit(ethers.utils.parseEthers("1"));
    })
});
  