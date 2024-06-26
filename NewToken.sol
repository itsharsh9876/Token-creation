// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

 contract MyERC20Token {
    address public owner; 
    mapping (address => uint256) public balances;
    mapping (address => mapping (address => uint256)) public allowances;

    uint256 public totalSupply;
    string public name;
    string public symbol;
    uint8 public decimals;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    constructor() {
        name = "META";
        symbol = "MET";
        decimals = 10;
        totalSupply = 0;
        owner = msg.sender; // assign owner to the deployer of the contract
    }
    function mint(address _to, uint256 _amount) public {
        require(msg.sender == owner, "Only the owner can mint tokens");
        totalSupply += _amount;
        balances[_to] += _amount;
        emit Mint(_to, _amount);
    }
    function burn(address _from, uint256 _amount) public {
        require(msg.sender == _from, "Only the owner of the tokens can burn them");
        require(balances[_from] >= _amount, "Insufficient balance");
        balances[_from] -= _amount;
        totalSupply -= _amount;
        emit Burn(_from, _amount);
    }

    function transfer(address _from, address _to, uint256 _amount) public {
        require(msg.sender == _from, "Only the owner of the tokens can transfer them");
        require(balances[_from] >= _amount, "Insufficient balance");
        balances[_from] -= _amount;
        balances[_to] += _amount;
        emit Transfer(_from, _to, _amount);
    }
    function approve(address _spender, uint256 _amount) public {
        allowances[msg.sender][_spender] = _amount;
    }
    function transferFrom(address _from, address _to, uint256 _amount) public {
        require(allowances[_from][msg.sender] >= _amount, "Insufficient allowance");
        require(balances[_from] >= _amount, "Insufficient balance");
        balances[_from] -= _amount;
        balances[_to] += _amount;
        allowances[_from][msg.sender] -= _amount;
        emit Transfer(_from, _to, _amount);
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }

}
