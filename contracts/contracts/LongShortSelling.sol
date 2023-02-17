// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import '@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol';
import '@uniswap/v3-periphery/contracts/interfaces/IQuoter';

import "./Interface/IPool.sol";

contract AaveLongShortSeller is Ownable {

    address supplyToken;
    address borrowToken;
    uint8 leverageAmt;
    IPool public lendingPool;
    AaveOracle aaveOracle = AaveOracle(address(0x54586bE62E3c3580375aE3723C145253060Ca0C2));

    constructor(address _supplyToken, address _borrowToken, uint8 _leverageAmt) {
        supplyToken = _supplyToken;
        borrowToken = _borrowToken;
        leverageAmt = _leverageAmt;

        lendingPool = IPool(address(0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2));
    }

    function deposit(uint _amount) public onlyOwner {

        IERC20(supplyToken).transferFrom(msg.sender, address(this), _amount);

        lendingPool.supply(supplyToken, _amount, address(this), 0);
        
        // uint256 totalAmt = aaveOracle.getAssetPrice(supplyToken) * _amount
        // uint256 targetAmount = (totalAmt * 6000 / aaveOracle.getAssetPrice(borrowToken)) / 10000;
        // lendingPool.borrow(borrowToken, targetAmount, 2, 0, address(this));

        // uint256 borrowBalance = IERC20(borrowToken).balanceOf(address(this));



    }

    // function withdraw() external onlyOwner {

    // }

}