// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import "contracts/SimpleStorage.sol";

contract Store is SimpleStorage {
    string public name = "Ashibhatt";

    function StoreNumber(string memory _newName) public {
        name = _newName;
    }
}
