// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract AnimalRegistry {
    struct Animal {
        uint256 serialNo;
        string name;
    }
    
    Animal[] public animals;
    
    // Constructor to initialize with three animals
    constructor() {
        animals.push(Animal(1, "Lion"));
        animals.push(Animal(2, "Elephant"));
        animals.push(Animal(3, "Giraffe"));
    }
    
    // Function to add an animal to the list
    function addAnimal(uint256 _serialNo, string memory _name) public {
        animals.push(Animal(_serialNo, _name));
    }

    // Function to get an animal by index
    function getAnimal(uint256 index) public view returns (uint256, string memory) {
        require(index < animals.length, "Index out of bounds");
        Animal storage animal = animals[index];
        return (animal.serialNo, animal.name);
    }

    // Function to get the total count of animals
    function getAnimalCount() public view returns (uint256) {
        return animals.length;
    }
}
