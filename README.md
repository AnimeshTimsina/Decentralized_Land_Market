# LandMarket

## Decentralized web app for Buying and Selling Land
Unlike other apps this is Distributed App that works on Blockchain technology. Aim of our project is to replace the broker 
in real estate business and make land trade secure, transparent and decentralized.

#### Required packages:
- ethereum (geth)
- node package manager(npm)
- Truffle Framework
- Ganache
- Metamask Chrome Extension

### Installation:
##### EthreumI(geth):

Linux: `sudo apt-get install ethereum`

Mac: `brew install ethereum`

Windows: [Link to the binary](https://geth.ethereum.org/downloads/)

#### Node Package Manager(npm):

 Linux: `sudo apt install npm`

 Mac: `brew install node`

 Windows: [Link to the binary](https://nodejs.org/en/download/)

#### Truffle:

`npm install -g truffle`

#### Ganache:
[Link to the software](https://www.trufflesuite.com/ganache)

#### Metamask:
[Extension link](https://metamask.io/)



### Running
- Go to app's directory
- `npm install`
- Copy any two addresses from Ganache to LandContract.sol file's constructor's two address variables
- Use Ganache's RPC Server in Metamask and import those two accounts
- In truffle-config.js file, use port of RPC Server in port variable
- `truffle migrate --reset`
- `npm run dev`

### Screenshots

![Screen Shot 2019-11-06 at 22 13 22](https://user-images.githubusercontent.com/43087414/68317188-cf5fea80-00e2-11ea-986c-bf5648b0f6a7.png)


