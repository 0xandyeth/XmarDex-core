// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.17;

library XmardexLibrary{
    /// @notice base of the FEES
    uint256 public constant FEES_BASE = 1_000_000;

    /// @notice max fees of feesLp and feesPool sum, 10% FEES_BASE
    uint256 public constant FEES_MAX = FEES_BASE /10;

    /// @notice precision for approEq,not in percent but in APPROX_RECISION_BASE
    uint256 public constant APPROX_RECISION = 1;

    ///@notice base of the APPROX_RECISION
    uint256 public constant APPROX_RECISION_BASE = 1_000_000;

    

}