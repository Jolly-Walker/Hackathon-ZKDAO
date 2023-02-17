// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./LongShortSelling.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SellerFactory {

    mapping(address => address[]) public deployedContracts;

    constructor() {
    }

    function deployContract(address supplyToken, address borrowToken, uint8 leverageAmt) public returns (address){
        address newContract = address(new AaveLongShortSeller(supplyToken, borrowToken, leverageAmt));
        deployedContracts[msg.sender].push(newContract);
        Ownable(newContract).transferOwnership(msg.sender);
        return newContract;
    }
}