import request from '@/utils/request'

// 查询用户列表
export function listUser(query) {
  return request({
    url: '/web/userDetail/list',
    method: 'get',
    params: query
  })
}

// 修改用户信息
export function updateUser(data) {
  return request({
    url: '/web/userDetail/updateUser',
    method: 'put',
    data: data
  })
}

// 删除用户信息
export function delUser(userId) {
  return request({
    url: '/web/userDetail/' + userId,
    method: 'delete'
  })
}

// 新增用户信息
export function addUser(data) {
  return request({
    url: '/web/userDetail/addUser',
    method: 'post',
    data: data
  })
}

// 修改用户状态
export function changeUserStatus(userId, perm) {
  const data = {
    userId,
    perm // true 正常 false 禁用
  }
  return request({
    url: '/web/userDetail/updateUser',
    method: 'put',
    data: data
  })
}
