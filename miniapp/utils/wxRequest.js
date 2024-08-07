/**
 * 将基于回调的函数转换为基于 Promise 的函数。
 * @param {Function} fn - 要进行 promise 化的函数。它应该接受一个带有 `success` 和 `fail` 回调的对象。
 * @returns {Function} - 一个返回 Promise 的函数。
 */
function wxPromisify(fn) {
  return function (options = {}) {
      return new Promise((resolve, reject) => {
          options.success = function (res) {
              resolve(res);
          };
          options.fail = function (res) {
              console.error(res);
              reject(res);
          };
          fn(options);
      });
  };
}

/**
* 使用微信 API 发起 GET 请求。
* @param {string} url - 请求的 URL。
* @param {Object} data - 以对象格式传入的请求数据，作为查询参数。
* @returns {Promise} - 一个 Promise 对象，成功时解析响应，失败时拒绝错误。
*/
function getRequest(url, data) {
  const request = wxPromisify(wx.request);
  wx.showNavigationBarLoading(); // 显示加载指示器
  return request({
      url: url,
      method: 'GET',
      data: data,
      header: {
          'Content-Type': 'application/json'
      }
  });
}

/**
* 使用微信 API 发起 POST 请求。
* @param {string} url - 请求的 URL。
* @param {Object} data - 以对象格式传入的请求主体数据。
* @returns {Promise} - 一个 Promise 对象，成功时解析响应，失败时拒绝错误。
*/
function postRequest(url, data) {
  const request = wxPromisify(wx.request);
  wx.showNavigationBarLoading(); // 显示加载指示器
  return request({
      url: url,
      method: 'POST',
      data: data,
      header: {
          'Content-Type': 'application/json'
      }
  });
}

/**
* 使用微信 API 上传文件。
* @param {string} url - 上传的 URL。
* @param {Object} data - 包含 `imgfile` 和 `formData` 的数据对象。
* @returns {Promise} - 一个 Promise 对象，成功时解析响应，失败时拒绝错误。
*/
function uploadFile(url, data) {
  const upload = wxPromisify(wx.uploadFile);
  return upload({
      url: url,
      filePath: data.imgfile,
      name: 'file',
      formData: data.formData
  });
}

module.exports = {
  postRequest: postRequest,
  getRequest: getRequest,
  uploadFile: uploadFile
};
