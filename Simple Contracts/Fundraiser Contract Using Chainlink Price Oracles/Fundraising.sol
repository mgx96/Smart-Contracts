//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract Fundraising{

    uint256 minimumUsd = 5;

    function deposit() public payable {
        require(msg.value >= minimumUsd, "The minimum required amount is 1 ETH");
    }
    
    function getPrice() public {
        // Address : 0x694AA1769357215DE4FAC081bf1f309aDC325306
    }

    function withdraw() public {
    }
}