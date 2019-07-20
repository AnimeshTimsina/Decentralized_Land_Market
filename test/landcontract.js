var LandContract = artifacts.require("./LandContract.sol");

contract("LandContract", function(accounts) {
  var landInstance;
  it("it initializes the plots with the correct values", function() {
    return LandContract.deployed().then(function(instance) {
      landInstance = instance;
      return landInstance.noOfPlots();
    }).then(function(count){
        assert.equal(count, 12, "contains the correct price");
        return landInstance.plotsForSaleCount();
    }).then(function(forSaleCount){
        assert.equal(forSaleCount, 12, "contains the correct price");
        return landInstance.plots(1);
    }).then(function(plots) {
      assert.equal(plots[2], 4000, "contains the correct price");  
      assert.equal(plots[1], true, "contains the correct forSale boolean");
      return landInstance.plots(2);
  }).then(function(plots) {
    assert.equal(plots[2], 4000, "contains the correct price");  
    assert.equal(plots[1], true, "contains the correct forSale boolean");
    return landInstance.plots(11);
  }).then(function(plots){
    assert.equal(plots[2], 4000, "contains the correct price");  
    assert.equal(plots[1], true, "contains the correct forSale boolean");
    return landInstance.plots(0);
  }).then(function(plots){
    assert.equal(plots[2], 4000, "contains the correct price");  
    assert.equal(plots[1], true, "contains the correct forSale boolean");
  });
});
});