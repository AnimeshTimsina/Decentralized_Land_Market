pragma experimental ABIEncoderV2;
pragma solidity ^0.5.0;


contract LandContract {
    address owner;
    mapping (address => uint) public balances;

    struct Plot {
        uint id;
        address owner;
        bool forSale;
        uint price;
        string name;
        string location;
        uint area;
    }

    Plot[12] public plots;

    uint public noOfPlots = 12;
    uint public plotsForSaleCount;

    event PlotOwnerChanged(
        uint index
    );

    event PlotPriceChanged(
        uint index,
        uint price
    );

    event PlotAvailabilityChanged(
        uint index,
        uint price,
        bool forSale
    );

    constructor() public {
        owner = msg.sender;
        address x1 = 0xa43A9c5cbFcE8E324AF63fc346A05171e8cfE757;
        address x2 = 0x026513360c12159C8a3b4c6D9351082E2f5DB0A9;
        plots[0].id = 1;
        plots[0].owner= x1;
        plots[0].price = 4000;
        plots[0].forSale = true;
        plots[0].name = 'Plot 1';
        plots[0].location = 'Baneswor';
        plots[0].area = 20;
        plots[1].id = 2;
        plots[1].owner = x1;
        plots[1].price = 4000;
        plots[1].forSale = false;
        plots[1].name = 'Plot 2';
        plots[1].location = 'Koteswor';
        plots[1].area = 25;
        plots[2].id = 3;
        plots[2].owner = x1;
        plots[2].price = 4000;
        plots[2].forSale = true;
        plots[2].name = 'Plot 3';
        plots[2].location = 'Thimi';
        plots[2].area = 22;
        plots[3].id = 4;
        plots[3].owner= x1;
        plots[3].price = 4000;
        plots[3].forSale = false;
        plots[3].name = 'Plot 4';
        plots[3].location = 'Jorpati';
        plots[3].area = 24;
        plots[4].id = 5;
        plots[4].owner = x1;
        plots[4].price = 4000;
        plots[4].forSale = false;
        plots[4].name = 'Plot 5';
        plots[4].location = 'Lokanthali';
        plots[4].area = 20;
        plots[5].id = 6;
        plots[5].owner = x1;
        plots[5].price = 4000;
        plots[5].forSale = true;
        plots[5].name = 'Plot 6';
        plots[5].location = 'Jawalakhel';
        plots[5].area = 20;
        plots[6].id = 7;
        plots[6].owner = x2;
        plots[6].price = 4000;
        plots[6].forSale = true;
        plots[6].name = 'Plot 7';
        plots[6].location = 'Pulchowk';
        plots[6].area = 20;
        plots[7].id = 8;
        plots[7].owner = x2;
        plots[7].price = 4000;
        plots[7].forSale = true;
        plots[7].name = 'Plot 8';
        plots[7].location = 'Balaju';
        plots[7].area = 20;
        plots[8].id = 9;
        plots[8].owner = x2;
        plots[8].price = 4000;
        plots[8].forSale = true;
        plots[8].name = 'Plot 9';
        plots[8].location = 'Pepsicola';
        plots[8].area = 20;
        plots[9].id = 10;
        plots[9].owner = x2;
        plots[9].price = 4000;
        plots[9].forSale = true;
        plots[9].name = 'Plot 10';
        plots[9].location = 'Satdobato';
        plots[9].area = 20;
        plots[10].id = 11;
        plots[10].owner = x2;
        plots[10].price = 4000;
        plots[10].forSale = true;
        plots[10].name = 'Plot 11';
        plots[10].location = 'Balkhu';
        plots[10].area = 20;
        plots[11].id = 12;
        plots[11].owner = x2;
        plots[11].price = 4000;
        plots[11].forSale = true;
        plots[11].name = 'Plot 12';
        plots[11].location = 'Ekantakuna';
        plots[11].area = 20;
        plotsForSaleCount = 12;

    }


    function putPlotUpForSale(uint index, uint price) public {
        Plot storage plot = plots[index];

        require(msg.sender == plot.owner && price > 0);

        plot.forSale = true;
        plot.price = price;
        emit PlotAvailabilityChanged(index, price, true);
        plotsForSaleCount ++;
    }

    function takeOffMarket(uint index) public {
        Plot storage plot = plots[index];

        require(msg.sender == plot.owner);

        plot.forSale = false;
        emit PlotAvailabilityChanged(index, plot.price, false);
        plotsForSaleCount --;
    }

    function getPlots() public view returns(address[] memory, bool[] memory, uint[] memory) {
        address[] memory addrs = new address[](12);
        bool[] memory available = new bool[](12);
        uint[] memory price = new uint[](12);

        for (uint i = 0; i < 12; i++) {
            Plot storage plot = plots[i];
            addrs[i] = plot.owner;
            price[i] = plot.price;
            available[i] = plot.forSale;
        }

        return (addrs, available, price);
    }

    function onSaleName() public view returns(string[] memory,uint) {

      uint j = 0;
      string[] memory plotName = new string[](12);
      for (uint i=0;i<12;i++) {
        Plot storage plot = plots[i];
        if (plot.forSale){
          plotName[j] = plot.name;
          j++;
        }
      }
      return (plotName,j);
    }

    function onSaleLocation() public view returns(string[] memory,uint) {

      uint j = 0;
      string[] memory plotLocation = new string[](12);
      for (uint i=0;i<12;i++) {
        Plot storage plot = plots[i];
        if (plot.forSale){
          plotLocation[j] = plot.location;
          j++;
        }
      }
      return (plotLocation,j);
    }

    function onSalePrice() public view returns(uint[] memory,uint) {

      uint j = 0;
      uint[] memory plotPrice = new uint[](12);
      for (uint i=0;i<12;i++) {
        Plot storage plot = plots[i];
        if (plot.forSale){
          plotPrice[j] = plot.price;
          j++;
        }
      }
      return (plotPrice,j);
    }

    function myPlotsName() public view returns (string[] memory,uint){
      uint j = 0;
      string[] memory plotName = new string[](12);
      for (uint i=0;i<12;i++) {
        Plot storage plot = plots[i];
        if (plot.owner == msg.sender){
          plotName[j] = plot.name;
          j++;
        }
      }
      return (plotName,j);
    }

    function myPlotsLocation() public view returns (string[] memory,uint){
      uint j = 0;
      string[] memory plotLocation = new string[](12);
      for (uint i=0;i<12;i++) {
        Plot storage plot = plots[i];
        if (plot.owner == msg.sender){
          plotLocation[j] = plot.location;
          j++;
        }
      }
      return (plotLocation,j);
    }

    function myPlotsPrice() public view returns (uint[] memory,uint){
      uint j = 0;
      uint[] memory plotPrice = new uint[](12);
      for (uint i=0;i<12;i++) {
        Plot storage plot = plots[i];
        if (plot.owner == msg.sender){
          plotPrice[j] = plot.price;
          j++;
        }
      }
      return (plotPrice,j);
    }

    function myPlotsSaleCheck() public view returns (bool[] memory,uint){
      uint j = 0;
      bool[] memory plotSaleCheck = new bool[](12);
      for (uint i=0;i<12;i++) {
        Plot storage plot = plots[i];
        if (plot.owner == msg.sender){
          plotSaleCheck[j] = plot.forSale;
          j++;
        }
      }
      return (plotSaleCheck,j);
    }


    function idOfMyOffSalePlot() public view returns(uint[] memory, uint){
      uint[] memory ids = new uint[](12);
      uint j=0;
      for (uint i=0;i<12;i++){
        Plot storage plot = plots[i];
        if (plot.owner == msg.sender && plot.forSale == false) {
          ids[j] = plot.id;
          j++;
        }
      }
      return (ids,j);
    }

    function priceOfMyOffSalePlot() public view returns(uint[] memory, uint){
      uint[] memory prices = new uint[](12);
      uint j=0;
      for (uint i=0;i<12;i++){
        Plot storage plot = plots[i];
        if (plot.owner == msg.sender && plot.forSale == false) {
          prices[j] = plot.price;
          j++;
        }
      }
      return (prices,j);
    }

    function nameOfMyOffSalePlot() public view returns(string[] memory, uint){
      string[] memory names=new string[](12);
      uint j=0;
      for (uint i=0;i<12;i++){
        Plot storage plot = plots[i];
        if (plot.owner == msg.sender && plot.forSale == false) {
          names[j] = plot.name;
          j++;
        }
      }
      return (names,j);
    }



    function buyPlot(uint index) public payable {
        Plot storage plot = plots[index];
        require(msg.sender != plot.owner && plot.forSale);
        balances[plot.owner] += msg.value;
        plot.owner = msg.sender;
        plot.forSale = false;
        emit PlotOwnerChanged(index);
    }

    function idOfOnSalePlots() public view returns(uint[] memory,uint){
      uint j=0;
      uint[] memory plotId= new uint[](12);
      for(uint i=0; i<12; i++){
        Plot storage plot=plots[i];
        if(plot.owner==msg.sender){
          if(plot.forSale==true){
            plotId[j]=plot.id;
            j++;
          }

        }
      }
      return (plotId,j);
    }

    function onSaleCount() public view returns(uint[] memory) {

      uint j = 0;
      uint[] memory plotID = new uint[](12);
      for (uint i=0;i<12;i++) {
        Plot storage plot = plots[i];
        if (plot.forSale){
          plotID[j] = plot.id;
          // plotName[j] = plot.name;
          j++;
        }
      }
      return (plotID);
    }


    function myPlotsCount() public view returns (uint[] memory){
      uint j = 0;
      uint[] memory plotID = new uint[](12);
      for (uint i=0;i<12;i++) {
        Plot storage plot = plots[i];
        if (plot.owner==msg.sender){
          plotID[j] = plot.id;
          // plotName[j] = plot.name;
          j++;
        }
      }
      return (plotID);
    }

    function onSaleId() public view returns(uint[] memory, uint) {

      uint j = 0;
      uint[] memory plotId = new uint[](12);
      for (uint i=0;i<12;i++) {
        Plot storage plot = plots[i];
        if (plot.forSale&&plot.owner!=msg.sender){
          plotId[j] = plot.id;
          j++;
        }
      }
      return (plotId, j);
    }


}
