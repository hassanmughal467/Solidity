// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract First_App {
    function Add_Numbers() public pure returns (uint256) {
        uint256 num1 = 2;
        uint256 num2 = 9;
        uint256 total = num1 + num2;
        return total;
    }

    uint256 public count;

    function getCount(uint256 _count) public {
        count = _count;
    }

    function countInc() public returns (uint256) {
        return count++;
    }

    function countDec() public returns (uint256) {
        return count--;
    }
}
