// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./Interface/IPool.sol";




contract AaveLongShortSeller is Ownable {

    address supplyToken;
    address borrowToken;
    uint8 leverageAmt;
    IPool public lendingPool;


    constructor(address _supplyToken, address _borrowToken, uint8 _leverageAmt) {
        supplyToken = _supplyToken;
        borrowToken = _borrowToken;
        leverageAmt = _leverageAmt;

        lendingPool = IPool(address(0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9));
        supplyToken = _supplyToken;
        borrowToken = _borrowToken;

    }

    function depositUSDT(uint _amount) public onlyOwner {

        lendingPool.deposit(address(supplyToken), _amount, msg.sender, 0);
    }

    function withdrawUSDT(uint _amount) public onlyOwner{
        lendingPool.withdraw(address(supplyToken), _amount, msg.sender);

    }

    function borrowBtc(uint _amount) public onlyOwner{

        lendingPool.borrow(address(borrowToken), _amount, 1, 0, msg.sender);
    }

}