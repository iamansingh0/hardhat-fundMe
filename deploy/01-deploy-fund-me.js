// async function deployFunc(hre) {

const { network } = require("hardhat")

// }
// module.exports.default = deployFunc

// module.exports = async (hre) => {
//     const { getNamedAccounts, deployments } = hre
// }

const { networkConfig } = require("../helper-hardhat-config")

module.exports = async ({ getNamedAccounts, deployments }) => {
    const { deploy, log } = deployments
    const { deployer } = await getNamedAccounts()
    const chainId = network.config.chainId

    const ethUsdPriceFeedAddress = networkConfig[chainId]["ethUsdPriceFeed"]
    const fundMe = await deploy("fundMe", {
        from: deployer,
        args: [], //put pricefeed address here
        log: true,
    })
}