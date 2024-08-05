import Request from "@/utils/request";

// 查询优惠券列表
export function listCoupon(query) {
  return Request({
    url: "/web/coupons/list",
    method: "get",
    params: query
  });
}

// 修改优惠卷权限
export function changeCouponStatus(couponsId, perm) {
  const data = {
    couponsId,
    perm
  }
  return Request({
    url: "/web/coupons/editPermission",
    method: "put",
    data: data
  });
}

// 删除优惠卷
export function delCoupon(couponsId) {
  return Request({
    url: "/web/coupons/" + couponsId,
    method: "delete"
  });
}

// 增加优惠卷
export function addCoupon(data) {
  return Request({
    url: "/web/coupons",
    method: "post",
    data: data
  });
}

// 修改优惠卷
export function updateCoupon(data) {
  return Request({
    url: "/web/coupons",
    method: "put",
    data: data
  });
}
