## Create and Mint Token

This Solidity contract is created to implement various token functionalities. In this process, we will learn how to create a token, mint new tokens, how to deploy them. Also, learned to mint new tokens  and burn existing ones.

## Description
MyToken is smart contract designed for creation and management of new token on blockchain. It contains various functionalities such as creating a token, minting new token, burning existing tokens and tracking token balances of addresses. It helps in deploying of tokens with details like initial supply,token name and abbrevation for the token . MyToken provides a simple and flexible solution for token creation, suitable for various decentralized applications. 

## Getting Started
### Installing
To use Mytoken, simply download or clone the solidity contact file attached to this repository.

### Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.
Further steps,
1. Compile the MyToken contract on an Ethereum-compatible blockchain. 
2. Deploy the MyToken contract on  an Ethereum compatible blockchain.
3. Now an account address is created for that token copy it and paste it into mint token along with required number of tokens to be minted.
4. You can also check the  balance of token in balance by putt in the account address into it.
5. For burning the tokens insert the account address  and no. of token needs to be burnt then click on transact.

   These are steps by which we can mint tokens, burn tokens and tracking token balance of addresses.


```
 // mint function
    function mint(address _addr, uint _value) public{
        tSupply+=_value;
        balance[_addr]+=_value;
    } 

```
    // burn function
    function burn(address _addr, uint _value) public{
        if(balance[_addr]>=_value){
            tSupply -=_value;
        balance[_addr] -=_value;
        }



## Authors

Harsh Gautam
@ gautamharshu7767@gmail.com

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
