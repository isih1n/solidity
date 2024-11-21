// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract fundme{
    uint256 public minimumUSD=5;

    function fund() public payable {
         require(msg.value > 1e18, "Require minimum 1eth for fund");       //1e18= 1 ETH = 1* 10 ** 18 wei
    }

    function getPrice() public {

        //address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI:
        AggregatorV3Interface PriceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,)=PriceFeed.latestRoundData();


    }
    function getConversionrate() public{}

}

