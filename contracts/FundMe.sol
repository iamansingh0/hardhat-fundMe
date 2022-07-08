// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./PriceConvertor.sol";
import "hardhat/console.sol";

// error codes
error FundMe__NotOwner();

/**  @title A contract for crowd funding
 *   @author Aman K
 *   @notice This contract is to demo a sample funding contract
 *   @dev This implements price feeds as our library
 */

contract FundMe {
    using PriceConvertor for uint256;

    uint256 public constant MIN_USD = 5 * 1e18;
    address[] public s_funders;
    mapping(address => uint256) public s_addressToAmountFunded;
    address public immutable i_owner;
    AggregatorV3Interface public s_priceFeed;

    modifier onlyOwner() {
        // require(msg.sender == i_owner, "Sender is not owner");
        if (msg.sender != i_owner) revert FundMe__NotOwner();
        _;
    }

    constructor(address priceFeedAddress) {
        i_owner = msg.sender;
        s_priceFeed = AggregatorV3Interface(priceFeedAddress);
        console.log("priceFeed Address: ", priceFeedAddress);
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }

    /**
     *  @notice This function funds this contract
     *  @dev This implements price feeds as our library
     */

    function fund() public payable {
        // set minimum fund amount in USD
        require(
            msg.value.getConversionRate(s_priceFeed) >= MIN_USD,
            "Didn't send enough"
        );
        console.log("msg.value = ", msg.value.getConversionRate(s_priceFeed));

        // 1e18 = 1*10 ** 18 == value of wei for 1 eth
        // msg.value will have 18 decimal places
        s_funders.push(msg.sender);
        console.log("Just funded funder: ", msg.sender);
        s_addressToAmountFunded[msg.sender] += msg.value; // in wei
    }

    /**
     *  @notice This function is used by the owner only to withdraw the funds
     *  @dev This implements price feeds as our library
     */

    function withdraw() public onlyOwner {
        for (
            uint256 funderIndex = 0;
            funderIndex < s_funders.length;
            funderIndex++
        ) {
            address funder = s_funders[funderIndex];
            s_addressToAmountFunded[funder] = 0;
        }
        s_funders = new address[](0); //reset the array

        // actually withdraw the funds
        // msg.sender = address
        // payable(msg.sender) = payable address
        // call
        (
            bool callSuccess, /* bytes memory dataReturned */

        ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "call failed");
    }

    // function cheaperWithdraw() public payable onlyOwner {
    //     address[] memory funders = s_funders;
    //     // mappings can't be in memory
    //     for(
    //         uint256 funderIndex = 0;
    //         funderIndex < funders.length;
    //         funderIndex++
    //     )
    //     {
    //         address funder = funders[funderIndex];
    //         s_addressToAmountFunded[funder] = 0;
    //     }
    //     s_funders = new address[](0);
    //     (bool callSuccess, /* bytes memory dataReturned */) = payable(msg.sender).call{value: address(this).balance}("");
    //     require(callSuccess, "call failed");
    // }
}
