const { ethers, getNamedAccounts } = require("hardhat")

async function main() {
    const sendValue = ethers.utils.parseEther("12")
    const { deployer } = await getNamedAccounts()
    const fundMe = await ethers.getContract("FundMe", deployer)
    console.log(`funding the contract with ${sendValue / 1e18} ETH....`)
    const fundingResponse = await fundMe.fund({
        value: sendValue,
    })
    await fundingResponse.wait(1)
    console.log("Funding completed..")
    const balance = await fundMe.provider.getBalance(fundMe.address)
    console.log(`Balance in smart contract: ${balance / 1e18} ETH`)
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.log(error)
        process.exit(1)
    })
