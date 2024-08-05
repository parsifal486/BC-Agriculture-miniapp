import request from "@/utils/request";

// 查询公告列表
export function listMessage(query) {
  return request({
    url: '/web/message/list',
    method: 'get',
    params: query
  })
}

// 修改公告状态
export function changeMessagePermission(messageId, perm) {
  const data = {
    messageId,
    perm
  }
  return request({
    url: '/web/message/editPermission',
    method: 'put',
    data: data
  })
}

// 删除公告
export function delMessage(messageId) {
  return request({
    url: '/web/message/' + messageId,
    method: 'delete'
  })
}

// 更新公告
export function updateMessage(data) {
  return request({
    url: '/web/message',
    method: 'put',
    data: data
  })
}

// 新增公告
export function addMessage(data) {
  return request({
    url: '/web/message',
    method: 'post',
    data: data
  })
}
