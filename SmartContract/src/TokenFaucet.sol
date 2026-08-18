// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title TokenFaucet - faucet untuk RewardToken, agar bisa drip ke siapa saja.
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract TokenFaucet is Ownable {
    using SafeERC20 for IERC20;

    IERC20 public immutable dripToken;
    uint256 public immutable dripAmount;

    constructor(IERC20 _dripToken, uint256 _dripAmount) Ownable(msg.sender) {
        dripToken = _dripToken;
        dripAmount = _dripAmount;
    }
    
    function receiveDrip() external {
        dripToken.safeTransfer(msg.sender, dripAmount);
    }
}