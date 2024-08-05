import axios from "axios";
import request from "@/utils/request";

// 101120201=青岛
// 101120202=崂山
const  api = 'https://devapi.qweather.com/v7/weather/now?location=101120202&key=db9606b78092487ab9d180ff5d9e8161';

// 获取天气
export function getWeather() {
  return axios.get(api).then(res => {
    return res.data
  })
}

// 获取工作数量
export function getWorks(params) {
  return request({
    url: '/sys/view/list',
    method: 'get',
    params: params
  })
}

// 获取溯源作物数量
export function getTraces() {
  return request({
    url: '/block/findAllBlockOrigin',
    method: 'get',
  })
}

// 获取公告数量
export function getNotices() {
  return request({
    url: '/web/message/list',
    method: 'get',
  })
}

