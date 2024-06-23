// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Meta is IERC20 {
    string public name = "META";
    string public symbol = "MET";
    uint8 public decimals = 18;
    uint public override totalSupply = 100 * (10 ** uint(decimals));

    mapping (address => uint) public balanceOf;
    mapping (address => mapping (address => uint)) public allowance;
    
    event Mint(address indexed to, uint value);
    event Burn(address indexed from, uint value);

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint _value) public override returns (bool) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint _value) public override returns (bool) {
        require(balanceOf[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint _value) public override returns (bool) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function mint(address _to, uint _value) public returns (bool) {
        totalSupply += _value;
        balanceOf[_to] += _value;
        emit Mint(_to, _value);
        emit Transfer(address(0), _to, _value);
        return true;
    }

    function burn(address _from, uint _value) public returns (bool) {
        require(balanceOf[_from] >= _value, "Insufficient balance");
        totalSupply -= _value;
        balanceOf[_from] -= _value;
        emit Burn(_from, _value);
        emit Transfer(_from, address(0), _value);
        return true;
    }
}
