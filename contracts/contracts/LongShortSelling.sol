// SPDX-License-Identifier: MIT
pragma solidity "0.8.17";

import "@openzeppelin/contracts/access/Ownable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";
import "./Interface/IPool.sol";
import "@aave/protocol-v2/contracts/interfaces";
import {ILendingPoolAddressesProvider} from './ILendingPoolAddressesProvider.sol';




contract AaveLongShortSeller is Ownable {

    address supplyToken;
    address borrowToken;
    uint8 leverageAmt;
    LendingPool public lendingPool;


    constructor(address _supplyToken, address _borrowToken, uint8 _leverageAmt) {
        supplyToken = _supplyToken;
        borrowToken = _borrowToken;
        leverageAmt = _leverageAmt;

        lendingPool = LendingPool("0x7d2768de32b0b80b7a3454c06bdac94a69ddc7a9");
        supplyToken = IERC20(_supplyToken);
        borrowToken = IERC20(_borrowToken);

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

    function print() public view {
        console.log(supplyToken);
        console.log(borrowToken);
        console.log(leverageAmt);
    }

}