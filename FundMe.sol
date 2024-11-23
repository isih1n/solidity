// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract fundme{
    uint256 public minimumUSD=5e18;
    address[] public funders;
    mapping (address fuder=> uint256 amountFunded) public addressTOamountFunded;

    function fund() public payable {
         require(getConversionrate(msg.value) >= minimumUSD, "Require minimum 5usd for fund");       //1e18= 1 ETH = 1* 10 ** 18 wei
         funders.push(msg.sender);
         addressTOamountFunded[msg.sender]= addressTOamountFunded[msg.sender] + msg.value;
    }

    function getPrice() public view returns (uint256){

        //address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI:
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();

        return uint256(price *1e10);


    }
    function getConversionrate(uint256 ethAmount) public view returns (uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethAmount*ethPrice)/1e18;
        return ethAmountInUsd;
    }

    function getVersion() public view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}

