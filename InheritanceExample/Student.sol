// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract StudentContract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    //Modifier So That only owner can do changes
    modifier OnlyOwner() {
        require(
            owner == msg.sender,
            "You can Not Add Student Details in the database"
        );
        _;
    }

    struct Student {
        string name;
        uint256 rollNumber;
    }

    Student[] public studentArray;

    function addStudent(
        string memory _name,
        uint256 _rollNumber
    ) external OnlyOwner {
        studentArray.push(Student(_name, _rollNumber));
    }

    function calling(string memory _newName) public returns (string memory) {
        GetDetails g = new GetDetails("Ashi"); // making instance of GetDetails Smart Contract
        return g.changeName(_newName);
    }
}

//Another contract

contract GetDetails {
    string public name;
    constructor(string memory _name) {
        name = _name;
    }

    function changeName(string memory _name) external returns (string memory) {
        name = _name;
        return name;
    }
}
