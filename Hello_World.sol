/ SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Hello_World
{
    string public greet = "Hello World!";

    string name;

    function setName(string memory _name) public
    {
       name =_name;
    }

    function getName() public view returns(string memory)
    {
       return name;
    }
  
}