//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConvertor} from "./PriceConvertor_Library.sol";

contract Fundraising{

    using PriceConvertor for uint256;

    uint256 minimumUsd = 5e18;

    address [] public listOfUsers;
    mapping (address => uint256) public addressToAmountFunded;

    address public owner;

    constructor (){
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value.getConversionRate() >= minimumUsd, "The minimum required amount is 5 USD");
        listOfUsers.push(msg.sender);
        //the "+=" is to check for an already existent balance in the wallet and then adds it to whatever they're additionally adding.
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public authenticateOwnership {
        for (uint256 listOfUsersIndex = 0; listOfUsersIndex < listOfUsers.length; listOfUsersIndex++){
            address user = listOfUsers[listOfUsersIndex];
            //resetting the wallet's balance to 0
            addressToAmountFunded[user] = 0;
        }
        listOfUsers = new address[](0);
        (bool callSuccess,) = payable (msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed!");
    }

    modifier authenticateOwnership(){
                require(msg.sender == owner , "Must be owner");
                _;
    }
}