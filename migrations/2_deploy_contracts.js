var LandContract = artifacts.require("./LandContract.sol");

module.exports = function(deployer) {
  deployer.deploy(LandContract);
};
