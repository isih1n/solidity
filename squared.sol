// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
import {SimpleStorage} from "./SimpleStorage.sol";

contract squared is SimpleStorage{

    function store(uint256 _newfavNumber) public override {
        myFavoriteNumber = _newfavNumber * _newfavNumber;
    }
}