//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Fundraising{

    uint256 minimumUsd = 5;

    function deposit() public payable {
        require(msg.value >= minimumUsd, "The minimum required amount is 1 ETH");
    }
    
    function getPrice() public view returns (uint256) {
        // Address : 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price,,,)= priceFeed.latestRoundData();
        //Matching the number of 0's with msg.value 
        return uint256(price * 1e10);
    }

    function getConversionRate() public {

    }

    function withdraw() public {
    }
}