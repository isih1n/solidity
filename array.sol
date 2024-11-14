// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;


contract Name {
    struct animals{
        uint256 serialno;
        string name;
    }
    
    animals[] public getanimalsname;
    function getNoandName(uint256 _serialno,string memory _name) public {
        getanimalsname.push(animals(_serialno,_name));
    }

    // function readaAnimalsName() public view returns (uint256, string memory) {
        
    // }
    animals public tiger = animals({serialno:0 , name:'tiger' });

    function readAllAnimals() public view returns (animals[] memory) {
        return getanimalsname;
    }
}