(async () => {
    const address = "0x5A86858aA3b595FD6663c2296741eF4cd8BC4d01";
    const accounts = await web3.eth.getAccounts();
    const abiArray = [
        {
            "inputs": [
                {
                    "internalType": "uint256",
                    "name": "newNum",
                    "type": "uint256"
                }
            ],
            "name": "UpdateNum",
            "outputs": [],
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "inputs": [],
            "name": "num",
            "outputs": [
                {
                    "internalType": "uint256",
                    "name": "",
                    "type": "uint256"
                }
            ],
            "stateMutability": "view",
            "type": "function"
        }
    ]
    const contractInstance = new web3.eth.Contract(abiArray, address);
    console.log("Previous Number = " + await contractInstance.methods.num().call());

    const TransDetails = await contractInstance.methods.UpdateNum(154).send({ from: accounts[0] });
    console.log("Updated Number = " + await contractInstance.methods.num().call());
    console.log(TransDetails);
})()
