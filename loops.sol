// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract loopss{
    uint256[] public numbers;
    function pushNumbers() public {
        for (uint256 Index=1; Index<11; Index++) 
        {
            numbers.push(Index);
        }
    }
}