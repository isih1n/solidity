// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract mapingExample{
    struct wallet{
        address addressOfUser;
        uint256 balance;
    }
    wallet[] public Walletlist;
    mapping (address => uint256) public addressTobalance;

    function addAddressandBalance(address _addressOfUser,uint256 _balance) public {
       Walletlist.push(wallet(_addressOfUser,_balance));

       addressTobalance[_addressOfUser] = _balance;
    }

}