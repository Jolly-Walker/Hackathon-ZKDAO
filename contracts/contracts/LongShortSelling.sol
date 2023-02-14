// SPDX-License-Identifier: MIT
pragma solidity "0.8.17";

import "@openzeppelin/contracts/access/Ownable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";
import "./Interface/IPool.sol";
import "@aave/protocol-v2/contracts/interfaces";




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
        usdt = IERC20("0x55d398326f99059fF775485246999027B3197955");

    }

    function depositUSDT(uint _amount) public onlyOwner {

        lendingPool.deposit(address(usdt), _amount, address(this), 0);
    }

    function withdrawUSDT(uint _amount) public onlyOwner{
        lendingPool.withdraw(address(usdt), _amount, address(this), 0);

    }

    function borrowBtc(uint _amount) public Owner{

    }

}