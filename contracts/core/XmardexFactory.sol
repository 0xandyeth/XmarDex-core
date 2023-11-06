// SPDX-License-Identifier: GPL-2.0-or-later

pragma solidity ^0.8.17;

//contracts
import "@openzeppelin/contracts/access/Ownable.sol";
import "./interfaces/IXmardexFactory.sol";
import "./XmardexPair.sol";

/**
 * @title XmardexFactory
 * @notice facilitates creation of XmardexPair to swap tokens.
 */

contract XmardexFactory is Ownable, IXmardexFactory {
    
    address public feeTo;
    uint128 private feesLp = 700; // MIN 1
    uint128 private feesPool = 300;
    mapping(address => mapping(address => address)) public getPair;
    address[] public allPairs;
    constructor(){

    }

    //@inheritdoc
    function allPairsLength() external view returns(uint256){
         return allPairs.length;
    }

     //@inheritdoc
    function getDefaultFees() external view returns(uint128 feesLp_,uint128 feesPool_){

        feesLp_ = feesLp;
        feesPool_ = feesPool;
    }

    //@inheritdoc
    function createPair(address _tokenA, address _tokenB) external returns(address pair_){
         require(_tokenA != _tokenB,"XmarDex:IDENTICAL_ADDRESS");
         (address _token0,address _token1) = _tokenA < _tokenB?(_tokenA,_tokenB):(_tokenB,_tokenA);
         require(_token0 !=address(0),"XmarDex:ZERO_ADDRESS");
         require(getPair[_token0][_token1] == address(0),"XmarDex:PAIR_EXIST");
         bytes32 _salt = keccak256(abi.encodedPacked(_token0,_token1));
         //abi.encodedPacked(_token0,_token1) - return binary data with packed data
         // keccak256 - fixed-length output of 256 bits 
         // call pair contract
         XmardexPair _pair = new XmardexPair{salt:_salt}();
         _pair.initialize(_token0,_token1,feesLp,feesPool);
         pair_ = address(_pair);
         getPair[_token0][_token1] = pair_;
         getPair[_token1][_token0] = pair_;
         allPairs.push(pair_);
         
         emit PairCreated(_token0,_token1,pair_,allPairs.length);
         
    }
    
    //@inheritdoc
    function setFeeTo(address _feeTo) external onlyOwner{

        address _previousFeeTo = feeTo;
        feeTo = _feeTo;
        emit FeeToUpdated(_previousFeeTo,_feeTo);
    }

    //@inheritdoc
    function setFees(uint128 _feesLp, uint128 _feesPool) external onlyOwner{
        require(_feesLp !=0,"XmarDex: ZERO_FEES_LP");
        require(_feesLp + _feesPool <= FEES_MAX, "XmarDex:FEES_MAX");

        feesLp = _feesLp;
        feesPool = _feesPool;

        emit FeeChanged(_feesLp,_feesPool);
    }



}