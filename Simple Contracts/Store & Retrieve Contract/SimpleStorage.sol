//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage{
   uint256 testNumber;

   function store(uint256 _testNumber) public {
    testNumber = _testNumber;
   }

   function retrieve() public view returns(uint256){
    return testNumber;
   }
}