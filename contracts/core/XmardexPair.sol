// SPDX-License-Identifier: GPL-2.0-or-later

pragma solidity ^0.8.17;

/**
 * @title XmardexPair
 * @notice Pair 
 */

contract XmardexPair{

    uint8 private constant CONTRACT_UNLOCKED =1;
    uint8 private constant CONTRACT_LOCKED =2;
    uint256 private constant MINIMUM_LIQUIDITY = 10 ** 3;
    bytes4 private constant AUTOSWAP_SELECTOR = bytes4(keccak256(bytes("executeWork(address,address)")));

    address public immutable factory;
    address public token0;
    address public token1;




    function initialize(address _token0,address _token1,uint128 _feesLp,uint128 _feesPool) external override{
        require(msg.sender == factory,"XmarDex:FORBIDEN");
        token0 = _token0;
        token1 = _token1;
        
    }

    //1. swap
    //2. mint -lp token
    //3. burn -lp token

}