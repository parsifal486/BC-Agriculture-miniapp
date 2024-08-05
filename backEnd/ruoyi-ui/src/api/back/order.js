import Request from "@/utils/request";

// 查询订单列表
export function listOrder(query) {
  return Request({
    url: "/web/orders/list",
    method: "get",
    params: query
  });
}

// 删除订单
export function delOrder(orderId) {
  return Request({
    url: "/web/orders/" + orderId,
    method: "delete"
  });
}

// 修改订单状态
export function changeOrderStatus(ordersId, perm) {
  const data = {
    ordersId,
    perm // true 正常 false 禁用
  }
  return Request({
    url: '/web/orders//editPermission',
    method: 'put',
    data: data
  })
}
