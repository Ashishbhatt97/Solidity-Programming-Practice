// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract SimpleStorage {
    uint public favoriteNumber;

    constructor() {
        favoriteNumber = 5;
    }

    function setFavoriteNumber(uint _favouriteNumber) public {
        favoriteNumber = _favouriteNumber;
    }
}
