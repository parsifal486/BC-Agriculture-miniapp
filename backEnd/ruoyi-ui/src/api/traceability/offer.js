import Request from "@/utils/request";

// 查询区块链产地溯源列表
export function listOrigin(query) {
  return Request({
      url: "/block/findAllBlockOrigin",
      method: "get",
      params: query
    });
}

// 删除区块链产地溯源
export function delOrigin(query) {
  return Request({
      url: "/block/deleteBlockOrigin/",
      method: "delete",
      params: query
    });
}

// 新增区块链产地溯源
export function addOrigin(data) {
  return Request({
      url: "/block/insertOrigin",
      method: "post",
      data: data
    });
}

// 根据id查询区块链产地溯源
export function getOriginByCommodityId(query) {
  return Request({
      url: "/block/findAllBlockOriginByCommodityId",
      method: "get",
      params: query
    });
}

// 根据name查询区块链产地溯源
export function getOriginByCommodityName(query) {
  return Request({
      url: "/block/findAllBlockOriginByCommodityName",
      method: "get",
      params: query
    });
}

// 根据supervisor查询区块链产地溯源
export function getOriginBySupervisor(query) {
  return Request({
      url: "/block/findAllBlockOriginBySupervisor",
      method: "get",
      params: query
    });
}

