const {
    time,
    loadFixture,
  } = require("@nomicfoundation/hardhat-network-helpers");
  const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
  const { expect } = require("chai");
  const { ethers } = require("hardhat");
  const {ERC20ABI} = require("../artifacts/@openzeppelin/contracts/token/ERC20/IERC20.sol/IERC20.json")
  
  

    // We define a fixture to reuse the same setup in every test.
    // We use loadFixture to run this setup once, snapshot that state,
    // and reset Hardhat Network to that snapshot in every test.

    const usdtAddress = "0x55d398326f99059fF775485246999027B3197955"; // Replace with the actual USDT contract address
    const usdtAbi = ["function transfer(address to, uint256 value) returns (bool)"];
    const ALCHEMY_API_KEY = "8OBMI1oAduhQLp62MnjJY3WGCH6f__4f";
    const ALCHEMY_URL = "https://eth-mainnet.alchemyapi.io/v2/" + ALCHEMY_API_KEY;
    const privateKey = "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80";
    const wallet = new ethers.Wallet(privateKey, ethers.provider);

    const tokenAddress = "0x2170ed0880ac9a755fd29b2688956bd959f933f8";
    const tokenABI = ERC20ABI;
    // const token = new ethers.getContractAt(tokenABI, tokenAddress);
    const initialSwap = async (bnbamount, from, to, destinyAddr) => {

        let wbnbERC = await ethers.getContractAt("contracts/Interface/IBEP20.sol:IBEP20", bsc.WBNB);
        let wbnbToken = await ethers.getContractAt("contracts/Interface/IWETH.sol:IWETH", bsc.WBNB);
        let pancake = await ethers.getContractAt("contracts/Interface/AllPancakeInterface.sol:IPancakeRouter02", bsc.pancakeRouter);
        
        let res = await wbnbToken.deposit({value: ethers.utils.parseEther(bnbamount)});
        let pancakeAmounts = await pancake.getAmountsOut(ethers.utils.parseEther(bnbamount), [from, to]);
        let amount = pancakeAmounts[1].sub((pancakeAmounts[1].div(10000).mul(50)));
        res = await wbnbERC.approve(bsc.pancakeRouter, ethers.utils.parseEther(bnbamount));
        res = await pancake.swapExactTokensForTokens(
          ethers.utils.parseEther(bnbamount), 
          amount, 
          [from, to], 
          destinyAddr, 
          Date.now()
          );
        console.log("Initial Swap done!");
      
      };






    describe("Deployment", function () {
        let shortContract;
        let ShortContract;
        let usdt;
        let btc;
        let senderAddress;
        let receiverAddress;
        let spenderAddress;
        let initialSenderBalance;
        let initialReceiverBalance;
        let initialSpenderAllowance;
        let amount;
        let result;
 

      before(async function(){
 
        usdt = "0x55d398326f99059fF775485246999027B3197955";
        btc = "0x7130d2A12B9BCbFAe4f2634d864A1Ee1Ce3Ead9c";
        const userwallet = await ethers.provider.getSigner("0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266");

        const token = await ethers.getContractAt('IERC20', tokenAddress);
         amount = ethers.utils.parseEther("10"); //



         shortContract = await ethers.getContractFactory("AaveLongShortSeller");
         ShortContract = await shortContract.deploy(usdt,btc,"300");
          senderAddress = "0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC";
        
          receiverAddress = ShortContract.address;
          spenderAddress = ShortContract.address;

          await ShortContract.connect(userwallet).deposit(usdt,amount);

          initialSenderBalance = await ethers.provider.getBalance(senderAddress);
          console.log("initialSenderBalance:",initialSenderBalance)

        //   initialReceiverBalance = await ethers.provider.getBalance(receiverAddress);
        // //   initialSpenderAllowance = await token.allowance(senderAddress, spenderAddress);
        //   console.log("initialReceiverBalance:",initialReceiverBalance)
        //   console.log("initialSpenderAllowance:",initialSpenderAllowance)

            // await token.connect(userwallet).transfer(receiverAddress, amount);
             



            initialSenderBalance = await ethers.provider.getBalance(senderAddress);
            // initialReceiverBalance = await ethers.provider.getBalance(receiverAddress);
            // initialSpenderAllowance = await token.allowance(senderAddress, spenderAddress);
          console.log("initialSenderBalance:",initialSenderBalance)
        //   console.log("initialReceiverBalance:",initialReceiverBalance)
        //   console.log("initialSpenderAllowance:",initialSpenderAllowance)



         ShortContract.print();

        //  console.log("Result:", result);




      })
      it("Deploy LongShortSelling", async function(){
      })

      it("Deposit  USDT", async function(){
        // ShortContract.deposit("300");
      })
     
    });
  
  