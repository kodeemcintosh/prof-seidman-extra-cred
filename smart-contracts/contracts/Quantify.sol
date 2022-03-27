// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/** 
 * @title Quantify
 * @dev Calculates product of function inputs while tracking total number of function calls and also implements a Matic token quantity check for any contract on Polygon network
 */

 contract Quantify {
   address private _tokenAddress = '';
   uint public callCount = 0;

   mapping (address => uint) public targetBalance;

   function calculateProduct(uint[] memory factors) public
    returns (uint) {
    uint product;

    for (uint i = 0; i < factors.length; i++) {
      product *= factors[uint(i)];
    }

    callCount++;
    return product;
   }
   function retrieveERC20Balance(address _targetContract) public view returns (uint) {
    return TargetInterface(_tokenAddress).balanceOf(_targetContract);
  }
 }

 contract TargetInterface {
   function balanceOf(address _tokenContract, address _targetContract) public view returns (uint);
 }