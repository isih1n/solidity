// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

//799,727 gas without any constant anf immutable
//779,358 gas with constant
contract fundme{
    using PriceConverter for uint256; //this allows us to use the PriceConverter array
    uint256 public constant MINIMUM_USD=5e18;
    address[] public funders;
    mapping (address funder=> uint256 amountFunded) public addressTOamountFunded;

    address public immutable  i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
         require(msg.value.getConversionrate() >= MINIMUM_USD, "Require minimum 5usd for fund");//1e18= 1 ETH = 1* 10 ** 18 wei
         funders.push(msg.sender); //this stores the funder address to the funders array
         addressTOamountFunded[msg.sender]= addressTOamountFunded[msg.sender] + msg.value; // this keeps updating the amount dinated by the funders
    }

    function withdraw() public onlyOwner{

        // loop for setting funders balance to zero as we call withdraw
        for (uint256 funderIndex=0;funderIndex <funders.length;funderIndex++) 
        {
            //this line creates funder which stores addressof funders as they change per itteration 
            address funder = funders[funderIndex];
            addressTOamountFunded[funder]=0; // as funder sotres addresses and this line sets them to zero
        }

        funders= new address[](0); // we are using new keyword to creates a brand new address array compleletly reseting it
        
        //transfer
        // payable (msg.sender).transfer(address(this).balance);
        //send
        // bool sendSucess =payable (msg.sender).send(address(this).balance);
        // require(sendSucess, "send failed");
        //call
        (bool callSucess,)=msg.sender.call{value: address(this).balance}("");
        require(callSucess,"call failed");
    }

    modifier onlyOwner(){
        // require( msg.sender == i_owner ,"Withdraw function can omly be called by the owner of the contract");
        if(msg.sender!= i_owner){revert NotOwner();}
        _;
    }

    receive() external payable { 
        fund();
    }
    fallback() external payable {
        fund();
     }
}

