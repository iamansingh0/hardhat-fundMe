<div align="center">
  <a href="">
    <p align="center">
      <img src="logo_fundMe.png" alt="Logo" width="80" height="80">
    </p>
  </a>
  <h3 align="center"><strong>Compile and Deploy Smart Contract Using ethers.js</strong></h3>
  <hr>
</div>
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites-and-installation">Prerequisites and Installation</a></li>
        <li><a href="#what-does-this-contract-do">What does this contract do</a></li>
      </ul>
    </li>
    <li><a href="#steps-to-compile-the-smart-contract">Steps to Compile the Smart Contract</a></li>
    <li><a href="#deploy-the-smart-contract">Deploy the Smart Contract</a></li>
    <li><a href="#interact-with-simplestorage-smart-contract">Interact with SimpleStorage Smart Contract</a></li>
    <li><a href="#deploying-it-in-remix-ide">Deploying it in remix IDE</a></li>
    <li><a href="#to-read-or-write-the-contract-using-rinkeby-testnet">To Read or Write the contract using rinkeby testnet</a>
      <ul>
        <li><a href="#scan-qr-code">Scan QR Code</a></li>
        <li><a href="#click-this-link">Click this link</a></li>
    </li>
  </ol>
</details>
<hr>

## About the project
It is a very basic project for web3 beginners on how to deploy their smart contract using javascript's [ethers.js](https://docs.ethers.io/v5/). In this project, there is a smart contract called **SimpleStorage.sol**. By using step by step process you can compile and deploy your smart contract to a local blockchain (``ganache``) and on a testnet(``rinkeby``).
Let's get started! 

### Built With

<a href="https://docs.ethers.io/v5/"><img src="https://img.shields.io/static/v1?label=EthersJS&message=^5.6.9&color=green&link=https://docs.ethers.io/v5/" /></a>
<a href="https://docs.soliditylang.org/en/v0.8.7/contracts.html"><img src="https://img.shields.io/static/v1?label=Solidity&message=0.8.7-fixed&color=orange&link=https://docs.soliditylang.org/en/v0.8.7/contracts.html" /></a>
<a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript"><img src="https://img.shields.io/static/v1?label=Javascript&message=ES2015&color=blue&link=https://developer.mozilla.org/en-US/docs/Web/JavaScript" /></a>

## Getting Started
So before getting started, I want you to make sure that while following all the steps you might get errors so don't let them stop you! Search your error in the `community` and in indexed platforms like **stackoverflow** and **stackEthExchange** etc!

### Prerequisites and Installation
As a prerequisites, you should atleast know how javascript syntaxes work. If you forget about them, I'll pinpoint some keywords that will be important in this project.
- async function()
- await
- require()
- Basic variable types and strings

You should know how to write smart contract in solidity, I guess if you are trying to deploy it than you must know solidity.

As we all know that linux environment is the best for programming and tasks, so for this project also I'll be using linux environment in your windows and macOS environemnt
So first you need to install **wsl** in your environment. It lets you work on linux environment within your local environment.
- [WSL](https://docs.microsoft.com/en-us/windows/wsl/install)

After installing wsl, set username and password. Now open vscode and download an extension called **remote development**. Open command Palette and search *open in wsl window*. It will open vs code in wsl environment. Make a folder and get started!

### What does this contract do

| Functions and Variables      | What they do |
| ----------- | ----------- |
| 1. ``uint256 favoriteNumber``     | `It is a global variable to store an uint256 number.       |
| 2. ``struct People`` | It is a struct and stores name and fav number.        |
| 3. ``People[]  public people``   | people Array of type People.        |
| 4. `mapping(string => uint256)  public nameToFavoriteNumber`   |  Mapping name to fav number.      |
| 5. ``function store(uint256)``  | It's a function that takes a number and update global variable favoriteNumber to it.        |
| 6. `function retrieve()`   | It's a view function, it returns the number stored in point 1. variable.       |
| 7. `function addPerson(name, favNum)` | It is used to fill the array and mapping.