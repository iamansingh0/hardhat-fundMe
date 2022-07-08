const { ethers, getNamedAccounts } = require("hardhat")

async function main() {
    const { deployer } = await getNamedAccounts()
    const fundMe = await ethers.getContract("FundMe", deployer)
    let balance = await fundMe.provider.getBalance(fundMe.address)
    console.log(`withdrawing ${balance / 1e18} ETH from the contract...`)
    const withdrawResponse = await fundMe.withdraw()
    await withdrawResponse.wait(1)
    console.log("Withdraw completed..")
    balance = await fundMe.provider.getBalance(fundMe.address)
    console.log(`Balance in smart contract: ${balance / 1e18} ETH`)
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.log(error)
        process.exit(1)
    })
