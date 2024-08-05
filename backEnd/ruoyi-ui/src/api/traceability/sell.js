import Request from "@/utils/request";

// 新增区块链销售溯源
export function addSell(data) {
  return Request({
      url: "/block/insertSell",
      method: "post",
      data: data
    });
}

// 查询区块链销售溯源列表
export function listSell(query) {
  return Request({
      url: "/block/findAllBlockSell",
      method: "get",
      params: query
    });
}

// 删除区块链销售溯源
export function delSell(query) {
  return Request({
      url: "/block/deleteBlockSell/",
      method: "delete",
      params: query
    });
}

// 根据id获取销售溯源
export function getSellById(query) {
  return Request({
      url: "/block/findAllBlockSellByCommodityId",
      method: "get",
      params: query
    });
}

// 根据name获取销售溯源
export function getSellByName(query) {
  return Request({
      url: "/block/findAllBlockSellByCommodityName",
      method: "get",
      params: query
    });
}

// 根据supervisor获取销售溯源
export function getSellBySupervisor(query) {
  return Request({
      url: "/block/findAllBlockSellBySupervisor",
      method: "get",
      params: query
    });
}
