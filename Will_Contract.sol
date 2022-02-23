// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract will {
    address owner;
    uint256 fortune;
    bool deceased;

    // payable keyword used for send and recieve ether
    constructor() public payable {
        //who call this contract become owner and owner address store in owner varaible
        owner = msg.sender; //msg sender represents address that is being called
        fortune = msg.value; //msg value tell us how much ether is being send
        deceased = false;
    }

    //create modifier so that we only person who can call the contract is the owner
    modifier onlyOwner() {
        // act as if condition
        require(msg.sender == owner);
        _;
        //if continue otherwise not
    }

    //creatr modifier so that we only allocate funds if friend's grand deceased

    modifier mustbeDeceased() {
        require(deceased == true);
        _;
    }

    // array to keep list of family wallet address for send and recieve ether

    address payable[] familywallets;

    // to keep the track of address and value we made mapping

    mapping(address => uint256) inheritance;

    //set inheritance for each address

    function setInheritance(address payable wallet, uint256 ammount)
        public
        onlyOwner
    {
        //to add wallets to family wallets
        familywallets.push(wallet);
        inheritance[wallet] = ammount;
    }

    //pay each family member based on theri wallet address

    function payout() private mustbeDeceased {
        for (uint256 i = 0; i < familywallets.length; i++) {
            //transferring the funds from contract address to reciever address
            familywallets[i].transfer(inheritance[familywallets[i]]);
        }
    }

    //oracle switch simulation
    function hasDeceased() public onlyOwner {
        deceased = true;
        payout();
    }
}
