// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library priceConvertor {

    function getPrice(AggregatorV3Interface priceFeed) internal view returns(uint256){
        (,int256 price,,,) = priceFeed.latestRoundData();
        // ETH in terms of USD
        // solidity doesn't work with decimals
        // but we know there are 8 decimal places after price of 1 eth in usd
        // 1000.00000000
        return uint256(price * 1e10); // 18 decimal places
    }

    function getConversionRate(uint256 ethAmount, AggregatorV3Interface priceFeed) internal view returns(uint256) {
        uint256 ethPrice = getPrice(priceFeed); // price of 1 eth
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}