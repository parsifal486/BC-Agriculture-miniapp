// 获取缓存项
// key: 缓存项的键
// options: 配置选项对象，可以包含 'nocache' 属性
// 返回值: 如果 'nocache' 为 true 或缓存项不存在/过期，则返回 undefined，否则返回缓存的值
function getCacheItem(key, options) {
  // 默认配置
  options = options || {};
  
  // 如果设置了 'nocache' 选项，则不使用缓存
  if (options.nocache) {
    console.log("nocache=true")
    return undefined;
  }

  // 从缓存中获取数据
  var data = wx.getStorageSync(key);
  if (!data) {
    return undefined;
  }

  // 检查数据是否过期
  if (new Date() > new Date(data.expire_date)) {
    console.log(`${key} expired.`);
    return undefined;
  }

  // 返回缓存的数据项
  return data.item;
}

// 设置缓存项
// key: 缓存项的键
// item: 要缓存的数据
// expire_hours: 缓存过期的小时数
// expire_minutes: 缓存过期的分钟数（可选）
// 无返回值
function setCacheItem(key, item, expire_hours, expire_minutes) {
  // 计算缓存过期时间
  var expire_date = new Date();
  expire_minutes = (expire_minutes || 0) + parseInt(expire_hours * 60);
  expire_date.setMinutes(expire_date.getMinutes() + (expire_minutes || 0));

  // 组织缓存数据
  var data = {
    item: item,
    expire_date: expire_date
  };

  // 将数据存储到缓存中
  wx.setStorageSync(key, data);
}

// 获取缓存日期
// key: 日期缓存项的键
// 返回值: 如果缓存项存在，则返回日期对象；否则返回 undefined
function getCacheDate(key) {
  // 从缓存中获取日期
  var date = wx.getStorageSync(key);
  if (!date) {
    return undefined;
  }

  // 返回日期对象
  return new Date(date);
}

// 设置缓存日期
// key: 日期缓存项的键
// date: 要缓存的日期对象，如果不传入，则默认当前日期
// 无返回值
function setCacheDate(key, date) {
  if (!date) {
    date = new Date();
  }

  // 将日期存储到缓存中
  wx.setStorageSync(key, date);
}

// 导出模块中的函数
module.exports = {
  getCacheDate,
  setCacheDate,
  getCacheItem,
  setCacheItem
}
