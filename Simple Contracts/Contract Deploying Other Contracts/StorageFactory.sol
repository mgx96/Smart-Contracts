//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {BasicContract} from "./BasicContract.sol";

contract StorageFactory{

    BasicContract[] public listOfBasicContracts;

    function createBasicContract () public{

        BasicContract newListOfBasicContracts = new BasicContract();
        listOfBasicContracts.push(newListOfBasicContracts);
    }

    function sfStore (uint256 _basicContractIndex, uint256 _newBasicContractNumber) public {
        BasicContract myBasicContract = listOfBasicContracts[_basicContractIndex];
        myBasicContract.store(_newBasicContractNumber);
    }

    function sfGet (uint256 _basicContractIndex) public view returns(uint256){
        BasicContract myBasicContract = listOfBasicContracts[_basicContractIndex];
        return myBasicContract.retrieve();
    }
}