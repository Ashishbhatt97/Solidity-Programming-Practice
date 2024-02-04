// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

contract UpdateNumber{
    uint public num = 135;

    function UpdateNum(uint newNum) public {
        num = newNum;
    }
}