//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConvertor} from "./PriceConvertor_Library.sol";

contract Fundraising{

    using PriceConvertor for uint256;

    uint256 minimumUsd = 5e18;

    address [] public listOfUsers;
    mapping (address => uint256) public addressToAmountFunded;

    function deposit() public payable {
        require(msg.value.getConversionRate() >= minimumUsd, "The minimum required amount is 5 USD");
        listOfUsers.push(msg.sender);
        //the "+=" is to check for an already existent balance in the wallet and then adds it to whatever they're additionally adding.
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public {
        for (uint256 listOfUsersIndex = 0; listOfUsersIndex < listOfUsers.length; listOfUsersIndex++){
            address user = listOfUsers[listOfUsersIndex];
            addressToAmountFunded[user] = 0;
        }
    }
}