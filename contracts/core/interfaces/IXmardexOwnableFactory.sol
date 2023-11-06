// SPDX-License-Identifier: GPL-2.0-or-later

pragma solidity ^0.8.17;

//contracts
import "./IXmrdexFactory.sol";

interface IXmardexOwnableFactory is IXmardexFactory {

    /**
     * @dev Returns the address of the current owner.
     * @return address of owner
     */

    function owner() external view returns(address);

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions. Can only be called by the current owner
     * 
     */

    function renounceOwnership() external;

    /**
     * @dev Transfers ownership of the contract to a new account(`newOwner`).
     * Can only be called by the current owner
     * @param newOwner: address of new owner
     */

    function transferOwnership(address newOwner) external;

}