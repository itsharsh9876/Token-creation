// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract Metacft is ERC20 {
    constructor() ERC20("META", "MET") {
        _mint(msg.sender, 1000000 * (10 ** 18)); // Mint 1 million tokens to the contract owner
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function balanceOf(address account) public view  virtual override returns (uint256) {
        return super.balanceOf(account);
    }
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        return super.transfer(recipient, amount);
    }
}
