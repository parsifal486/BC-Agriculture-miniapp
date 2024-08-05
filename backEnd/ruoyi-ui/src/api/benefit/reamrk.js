import Request from "@/utils/request";

// 查询评论列表
export function listView(query) {
  return Request({
    url: "/sys/view/list",
    method: "get",
    params: query
  });
}

// 修改评论状态
export function changeViewStatus(viewId, perm) {
  const data = {
    viewId,
    perm
  };
  return Request({
    url: "/sys/view/editPermission",
    method: "put",
    data: data
  });
}

// 删除评论
export function delView(viewId) {
  return Request({
    url: "/sys/view/" + viewId,
    method: "delete"
  });
}

// 修改评论
export function updateView(data) {
  return Request({
    url: "/sys/view/edit",
    method: "put",
    data: data
  });
}
