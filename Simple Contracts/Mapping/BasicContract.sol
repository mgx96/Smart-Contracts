//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract BasicContract{
   uint256 testNumber;

   struct Person{
    uint256 favoriteNumber;
    string name;
   }

   Person[] public listOfPeople;

   mapping (string => uint256) public nameToFavoriteNumber;

   function store(uint256 _testNumber) public {
    testNumber = _testNumber;
   }

   function retrieve() public view returns(uint256){
    return testNumber;
   }

   function addPerson(string memory _name, uint256 _favoriteNumber) public {
    listOfPeople.push(Person(_favoriteNumber,_name));

    nameToFavoriteNumber[_name] = _favoriteNumber;
   }
}