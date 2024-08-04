pragma solidity 0.4.25;
pragma experimental ABIEncoderV2;

contract Agriculture {
    struct Origin {
        uint256 commodityId;
        string commodityName;
        string origin;
        int256 originX;
        int256 originY;
        string commodityPartition;
        uint256 bagging;
        uint256 growTime;
        uint256 irrigateTime;
        uint256 fertilizerTime;
        uint256 weedingTime;
        int256 temperature;
        string farming;
        uint256 pickingTime;
        string remark;
        string supervisor;
        bool deleted;
    }

    struct Transport {
        uint256 commodityId;
        string commodityName;
        string commodityTransport;
        uint256 transportTime;
        int256 transportX;
        int256 transportY;
        string remark;
        uint256 transportStatus;
        string supervisor;
        bool deleted;
    }

    struct Sell {
        uint256 commodityId;
        string commodityName;
        uint256 sellTime;
        uint256 testResult;
        string remark;
        string testPicture;
        string supervisor;
        bool deleted;
    }

    mapping(uint256 => Origin) private origins;
    mapping(uint256 => Transport) private transports;
    mapping(uint256 => Sell) private sells;

    // Add origin entry
    function addOrigin(Origin memory info) public {
        Origin storage origin = origins[info.commodityId];
        origin.commodityId = info.commodityId;
        origin.commodityName = info.commodityName;
        origin.origin = info.origin;
        origin.originX = info.originX;
        origin.originY = info.originY;
        origin.commodityPartition = info.commodityPartition;
        origin.bagging = info.bagging;
        origin.growTime = info.growTime;
        origin.irrigateTime = info.irrigateTime;
        origin.fertilizerTime = info.fertilizerTime;
        origin.weedingTime = info.weedingTime;
        origin.temperature = info.temperature;
        origin.farming = info.farming;
        origin.pickingTime = info.pickingTime;
        origin.remark = info.remark;
        origin.supervisor = info.supervisor;
        origin.deleted = info.deleted;
    }

    // Get origin details by commodity ID
    function getOrigin(uint256 _commodityId)
    public
    view
    returns (Origin memory)
    {
        require(origins[_commodityId].deleted, "id does not exist");
        return origins[_commodityId];
    }

    // Delete origin entry by commodity ID
    function deleteOrigin(uint256 _commodityId) public {
        require(origins[_commodityId].deleted, "id does not exist");
        origins[_commodityId].deleted = false;
    }

    // Add transport entry
    function addTransport(Transport memory info) public {
        Transport storage transport = transports[info.commodityId];
        transport.commodityId = info.commodityId;
        transport.commodityName = info.commodityName;
        transport.commodityTransport = info.commodityTransport;
        transport.transportTime = info.transportTime;
        transport.transportX = info.transportX;
        transport.transportY = info.transportY;
        transport.remark = info.remark;
        transport.transportStatus = info.transportStatus;
        transport.supervisor = info.supervisor;
        transport.deleted = info.deleted;
    }

    // Get transport details by commodity ID
    function getTransport(uint256 _commodityId)
    public
    view
    returns (Transport memory)
    {
        require(transports[_commodityId].deleted, "id does not exist");
        return transports[_commodityId];
    }

    // Delete transport entry by commodity ID
    function deleteTransport(uint256 _commodityId) public {
        require(transports[_commodityId].deleted, "id does not exist");
        delete transports[_commodityId];
    }

    // Add sell entry
    function addSell(Sell memory info) public {
        Sell storage sell = sells[info.commodityId];
        sell.commodityId = info.commodityId;
        sell.commodityName = info.commodityName;
        sell.sellTime = info.sellTime;
        sell.testResult = info.testResult;
        sell.remark = info.remark;
        sell.testPicture = info.testPicture;
        sell.supervisor = info.supervisor;
        sell.deleted = info.deleted;
    }

    // Get sell details by commodity ID
    function getSell(uint256 _commodityId) public view returns (Sell memory) {
        require(sells[_commodityId].deleted, "id does not exist");
        return sells[_commodityId];
    }

    // Delete sell entry by commodity ID
    function deleteSell(uint256 _commodityId) public {
        require(sells[_commodityId].deleted, "id does not exist");
        delete sells[_commodityId];
    }
}
