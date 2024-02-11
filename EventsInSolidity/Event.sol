// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract EventExample {
    mapping (address  => uint) public tokenBalance;
    
    constructor (){
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to , uint _amount) public  returns(bool) {
        require(tokenBalance[msg.sender] >= _amount , "Not enough tokens");
        
        tokenBalance[_to] += _amount;
        tokenBalance[msg.sender] -= _amount;
        return true;
    }
}