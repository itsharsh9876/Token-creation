## Create and Mint Token

This Solidity contract is created to implement various token functionalities. The contract includes functionalities for minting(Only the contract owner can mint new tokens to any address), burning(Any user can burn tokens from their own balance), and transferring tokens(Users can transfer tokens to any address).The token is implemented using the OpenZeppelin library.
## Description
This repository contains the Solidity code for an ERC20 token named Meta (symbol: MET). The contract leverages OpenZeppelin's ERC20 and Ownable contracts to ensure secure and standardized token behavior. With help of this contact, the owner will be able to mint token, burn tokens and transfer token from one address to another. 
## Getting Started
### Installing
To use Meta, simply download or clone the solidity contact file attached to this repository.

### Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.
Further steps,
1. Compile the MyToken contract on an Ethereum-compatible blockchain. 
2. Select the environment as injected provider Metamask and connect your wallet.
3. Deploy the MyToken contract on  an Ethereum-compatible blockchain.
4. Now after deployment we have various functions available there like burn, transfer, and mint tokens.
5. You can also check the  balance of token in TotalSupply.
6. For burning the tokens insert the account address  and no. of token needs to be burnt then click on transact.
7. For minting the tokens insert the account address  and no. of token that needs to be minted then click on transact.
8. For transferring the tokens insert the account address to which the token has to be transferred and add the no of tokens .



   These are steps by which we can mint tokens, burn tokens and tracking token balance of addresses.


```
 //  function mint(address _to, uint _value) public returns (bool) {
        totalSupply += _value;
        balanceOf[_to] += _value;
        emit Mint(_to, _value);
        emit Transfer(address(0), _to, _value);
        return true;
    } 

```
    //  function burn(address _from, uint _value) public returns (bool) {
        require(balanceOf[_from] >= _value, "Insufficient balance");
        totalSupply -= _value;
        balanceOf[_from] -= _value;
        emit Burn(_from, _value);
        emit Transfer(_from, address(0), _value);
        return true;

```
//
    function transferFrom(address _from, address _to, uint _value) public override returns (bool) {
        require(balanceOf[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;

## Authors

Harsh Gautam
@gautamharshu7767@gmail.com

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
