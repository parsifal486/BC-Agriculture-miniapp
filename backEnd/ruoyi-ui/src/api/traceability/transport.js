import Request from "@/utils/request";

// 查询区块链运输溯源列表
export function listTransport(query) {
  return Request({
      url: "/block/findAllBlockTransport",
      method: "get",
      params: query
    });
}

// 删除区块链运输溯源
export function delTransport(query) {
  return Request({
      url: "/block/deleteBlockTransport/",
      method: "delete",
      params: query
    });
}

// 新增区块链运输溯源
export function addTransport(data) {
  return Request({
      url: "/block/insertTransport",
      method: "post",
      data: data
    });
}

// 获取运输坐标
export function getTransportCoordinate(query) {
  return Request({
      url: "/block/findPointListBycommodityId",
      method: "get",
      params: query
    });
}

// 根据id获取运输溯源
export function getTransportById(query) {
  return Request({
      url: "/block/findAllBlockTransportByCommodityId",
      method: "get",
      params: query
    });
}

// 根据name获取运输溯源
export function getTransportByName(query) {
  return Request({
      url: "/block/findAllBlockTransportByCommodityName",
      method: "get",
      params: query
    });
}

// 根据supervisor获取运输溯源
export function getTransportBySupervisor(query) {
  return Request({
      url: "/block/findAllBlockTransportBySupervisor",
      method: "get",
      params: query
    });
}
