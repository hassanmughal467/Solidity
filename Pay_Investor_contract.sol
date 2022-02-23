// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

contract add_invester {
    // add investor wallets
    // pay them funds
    address bank;
    uint256 amount;

    constructor() payable {
        bank = msg.sender;
        amount = msg.value;
    }

    modifier onlyOwner() {
        require(msg.sender == bank);
        _;
    }

    address payable[] InvestorsWallet;

    mapping(address => uint256) fundToInvestor;

    function Addinvestor(address payable _wallet, uint256 _fund)
        public
        onlyOwner
    {
        InvestorsWallet.push(_wallet);
        fundToInvestor[_wallet] = _fund;
    }

    function payout() private onlyOwner {
        for (uint256 i = 0; i < InvestorsWallet.length; i++) {
            InvestorsWallet[i].transfer(fundToInvestor[InvestorsWallet[i]]);
        }
    }

    function makePayment() public {
        payout();
    }

    function checkInvestor() public view returns (uint256) {
        return InvestorsWallet.length;
    }
}
