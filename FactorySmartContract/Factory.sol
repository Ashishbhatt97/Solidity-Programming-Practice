// SPDX-License-Identifier: MIT

pragma solidity 0.8.22;

contract Factory {
    NewContract[] public contractsArray;

    function publishNewContract() public {
        NewContract cont = new NewContract();
        cont.assignName();
        contractsArray.push(cont);
    }

    function getOwnerOfContract(uint index) public view returns (address) {
        return contractsArray[index].owner();
    }
}

contract NewContract {
    address public owner;
    address public name;

    constructor() {
        owner = tx.origin; // Tells the first smart contract transaction initiater (wallet address)
    }

    function assignName(string memory _name) public returns (string memory) {
        return name = _name;
    }
}
