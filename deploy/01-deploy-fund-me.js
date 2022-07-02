const { network } = require("hardhat")

// async function deployFunc(hre) { }
// module.exports.default = deployFunc

// module.exports = async (hre) => {
//     const { getNamedAccounts, deployments } = hre
// }

const { networkConfig, developmentChains } = require("../helper-hardhat-config")

module.exports = async ({ getNamedAccounts, deployments }) => { 
    const { deploy, log } = deployments
    const { deployer } = await getNamedAccounts()

    const chainId = network.config.chainId

    let ethUsdPriceFeedAddress
    if(developmentChains.includes(network.name)){ //local network
        const ethUsdAggregator = await deployments.get("MockV3Aggregator") 
        ethUsdPriceFeedAddress = ethUsdAggregator.address
    } else {
        ethUsdPriceFeedAddress = networkConfig[chainId]["ethUsdPriceFeed"]
    }

    const fundMe = await deploy("FundMe", {
        from: deployer,
        args: [ethUsdPriceFeedAddress], //put constructor args here
        log: true,
    })
    log("Contract Deployed!!")
}

module.exports.tags = ["all", "fundMe"]