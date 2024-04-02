// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract Donation {
    address public owner;
    uint public totalDonation = 0;

    modifier OnlyOwner() {
        require(msg.sender == owner, "Only Owner can call this function");
        _;
    }

    event moneyDonated(uint amount, address doner);
    event withdrawlMoney(uint amount);

    struct DonationStruct {
        uint amount;
        string message;
    }

    DonationStruct[] public donationArray;

    mapping(address => DonationStruct[]) public DonationDetails;
    mapping(address => uint) public fundsDonatedByMe;

    constructor() {
        owner = payable(msg.sender);
    }

    function donate(string memory _message) public payable {
        require(msg.value > 0 ether, "value should be more than 1 ether");
        DonationStruct memory newDonation = DonationStruct(msg.value, _message);

        donationArray.push(newDonation);
        DonationDetails[msg.sender].push(newDonation);
        fundsDonatedByMe[msg.sender] += msg.value;

        totalDonation++;
        emit moneyDonated(msg.value, msg.sender);
    }

    function withdrawMoney() external OnlyOwner {
        uint amount = address(this).balance;
        payable(owner).transfer(amount);
        emit withdrawlMoney(amount);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
