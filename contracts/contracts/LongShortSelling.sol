// SPDX-License-Identifier: MIT
pragma solidity "0.8.17";

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Interface/IPool.sol";

contract AaveLongShortSeller {

    address supplyToken;
    address borrowToken;
    uint8 leverageAmt

    constructor(address _supplyToken, address _borrowToken, uint8 _leverageAmt) {
        supplyToken = _supplyToken;
        borrowToken = _borrowToken;
        leverageAmt = _leverageAmt;
    }

}