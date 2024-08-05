import Request from "@/utils/request";

// 查询商品列表
export function listCommodity(query) {
  return Request({
    url: "/web/commodityDetail/list",
    method: "get",
    params: query
  });
}

// 新增商品
export function addCommodity(data) {
  return Request({
    url: "/web/commodityDetail/add",
    method: "post",
    data: data
  });
}

// 修改商品
export function updateCommodity(data) {
  return Request({
    url: "/web/commodityDetail/edit",
    method: "put",
    data: data
  });
}

// 删除商品
export function delCommodity(commodityId) {
  return Request({
    url: "/web/commodityDetail/" + commodityId,
    method: "delete"
  });
}

// 获取商品树
export function getCommodityTree() {
  return Request({
    url: "/web/commodityDetail/commodityTree",
    method: "get"
  });
}

// 更改商品状态
export function changeCommodityPermission(commodityId, perm) {
  const data = {
    commodityId,
    perm
  };
  return Request({
    url: "/web/commodityDetail/editPermission",
    method: "put",
    data: data
  });
}

// 获取商品动态定价
export function getDynamicPricing(id) {
  return Request({
    url: "/web/order/dynamicPrice",
    method: "get",
    params: {
      CommodityId: id
    }
  });
}
