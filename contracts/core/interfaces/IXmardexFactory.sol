// SPDX-License-Identifier: GPL-2.0-or-later

pragma solidity ^0.8.17;


interface IXmardexFactory{

    /**
     * @notice emitted at each XmardexPair created
     * @param token0 address of the token0
     * @param token1 address of the token1
     * @param pair address of the XmardexPair created
     * @param totalPair number of XmardexPair created so far
     */
    event PairCreated(address indexed token0, address indexed token1,address pair,uint256 totalPair);

    /**
     * @notice return which address fees will be transferred
     */

    function feeTo() external view returns(address);

    /**
     * @notice return the quantity of pairs
     * @return quantity in uint256
     */

    function allPairsLength() external view(uint256);

    /**
     * @notice return numerators of pair fees,denominator is 1_000_00
     * @return feesLP_ numerator of fees sent to LP at pair creation
     * @return feesPool_ numberator of fees sent to pool at pair creation
     */

    function getDefaultFees() external view returns(uint128 feesLP_,uint128 feesPool_);

    
    

}