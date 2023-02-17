// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// import "./Interface/IPool.sol";
import {IPool} from "@aave/core-v3/contracts/interfaces/IPool.sol";
import {IPoolAddressesProvider} from "@aave/core-v3/contracts/interfaces/IPoolAddressesProvider.sol";
// import {IERC20} from "@aave/core-v3/contracts/dependencies/openzepplelin/contarcts/IERC20.sol";
import "hardhat/console.sol";




contract AaveLongShortSeller is Ownable {

    address supplyToken;
    address borrowToken;
    uint leverageAmt;
    IPool public lendingPool;
    IPoolAddressesProvider public ADDRESSES_PROVIDER;


    constructor(address _supplyToken, address _borrowToken, uint _leverageAmt) {
        supplyToken = _supplyToken;
        borrowToken = _borrowToken;
        leverageAmt = _leverageAmt;

        lendingPool = IPool(address(0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2));


    }

    function deposit(address _token,uint _amount) public onlyOwner {
        address asset = _token;
        uint amount = _amount;
        address onBehalfOf=address(this);
        uint16 referalCode =0;
        lendingPool.deposit(asset, amount, msg.sender, 0);

    }


    function withdraw(uint _amount) public onlyOwner{
        lendingPool.withdraw(address(supplyToken), _amount, msg.sender);

    }

    function borrow(uint _amount) public onlyOwner{

        lendingPool.borrow(address(borrowToken), _amount, 1, 0, msg.sender);
    }

    function print() public view {
        console.log(IERC20(supplyToken).balanceOf(address(this)));
        console.log(supplyToken);
        console.log(borrowToken);
        console.log(leverageAmt);
    }
}