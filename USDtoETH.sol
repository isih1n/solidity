// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract USDtoETH {
    function getprice() public view returns (uint256) {
        // first we get set the address to get the price from the blockchain
        AggregatorV3Interface PriceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,)= PriceFeed.latestRoundData();//we just need the price so we just use the int256 price
        return uint256(price)*1e10; //it is being typcasted from int to uint
    }


    function convertUsdToEth(uint256 usdAmount) public view returns(uint256){ //we use view because we just have to read the data
        uint256 ethPrice = getprice(); //this gets the data from the function getprice and stores it in ethPrice
        return (usdAmount * 1e18) / ethPrice;  //this converts usd to eth (usd valued more than 1eth only works) and returns the data
    }
}