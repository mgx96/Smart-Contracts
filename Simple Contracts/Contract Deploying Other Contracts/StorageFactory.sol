//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./BasicContract.sol";

contract StorageFactory{

    BasicContract public basicContract;

    function createBasicContract () public{

        basicContract = new BasicContract();
    }
}