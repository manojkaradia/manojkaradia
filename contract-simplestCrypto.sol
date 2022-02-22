// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Coin {
// The keyword "public" makes variables accessible from other contracts
    address public minter;
    mapping (address => uint) public balances;

//Events allow clients to react to specific contract changes you declare
    event Sent( address from, address to, uint amount );

//Constructor code is only run when contract is being created 
    constructor() {
        minter= msg.sender;
    }

//Sends an amount of newly created coins to an address. It can only be called by the contract creator
    function mint( address receiver, uint amount) public {
        require (msg.sender == minter);
        balances[receiver]+=amount;
    }
    
//Error allow you to provide information about why an operation failed, they are returned to the caller of the function.
    error InsufficientBalance( uint requested, uint available);

//sends an amount of existing coins from any caller to an address 
    function send( address receiver, uint amount) public {
         if (amount > balances[msg.sender])
             revert InsufficientBalance({
                  requested: amount,
                  available: balances[msg.sender]
             });
         balances[msg.sender] -= amount;
         balances[receiver] += amount;
         emit sent(msg.sender, receiver, amount);
    }
