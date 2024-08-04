var baseUrl = "http://localhost:81/dev-api"; //用于拼接之后请求的url
//全局公共请求方法
var funAjax = {
    get: (url, async, data, method = "get") => {
        return new Promise((resolve, reject) => {
            // 这里可以使用一些小的插件来显示正在请求
            // 加载中动画开启
            //设置默认异步请求
            /*此处同步请求： 同步请求（Synchronous Request）：在发送请求时，JavaScript 引擎会等待请求完成并且收到响应，然后才会继续执行后续的代码。执行阶段会被阻塞，直到接收到请求的结果。这意味着，同步请求会阻塞后续的代码执行，直到请求完成，页面可能会出现“假死”状态。同步请求不适用于长时间的操作，因为它会冻结页面并阻塞用户的交互，异步请求则不用等待返回结果，根据情况设置参数
      */
            if (async == "" || async == null || typeof async == "undefined") {
                async = true;
            }
            $.ajax({
                url: baseUrl + url,
                type: method,
                async: async,
                //dataType: "json",
                //data: JSON.stringify(data),
                data:data,
                headers: {
                    Token: localStorage.getItem("token"), //自定义请求头 此处我的token配置自动获取。根据自己配置位置进行获取
                    "Content-Type": "application/json;charset=utf8",
                },
                success: function (ret) {
                    // 加载中动画关闭
                    // loading && loading.close();
                    if (ret.code == 200) {
                        resolve(ret);
                    } else {
                        if (ret.code == 401) {
                            //给用户提示登录超时，您需要重新登录 并返回登录页面，清空请求头
                            setTimeout(() => {
                                localStorage.setItem("token", null);
                                window.open("login.html");
                            }, 1500);
                        }
                        reject(ret);
                    }
                },
                error: function (err) {
                    //console.log(JSON.stringify(err));
                    // 加载中动画关闭
                    // statusCode--->网络请求状态码，数字类型
                    // code--->错误码，数字类型。（0：连接错误、1：超时、2：授权错误、3：数据类型错误、4：不安全的数据） 可以自己根据后端的返回数据来编写对应错误的提示
                    if (err.statusCode == 1) {
                        //提示用户请求超时，请稍后再试
                    }
                    reject(err);
                },
            });
        });
    },
    post: (url, async, data, method = "post") => {
        return new Promise((resolve, reject) => {
            // 加载中动画开启
            //设置默认异步请求
            if (async == "" || async == null || typeof async == "undefined") {
                async = true;
            }
            $.ajax({
                url: baseUrl + url,
                type: method,
                async: async,
                dataType: "json",
                data: JSON.stringify(data),
                headers: {
                    Token: localStorage.getItem("token"), //自定义请求头
                    "Content-Type": "application/json;charset=utf8",
                },
                success: function (ret) {
                    // 加载中动画关闭
                    if (ret.code == 200) {
                        resolve(ret);
                    } else {
                        if (ret.code == 401) {
                            //登录超时，您需要重新登录
                            setTimeout(() => {
                                localStorage.setItem("token", null);
                                window.open("login.html");
                            }, 1500);
                        }
                        reject(ret);
                    }
                },
                error: function (err) {
                    //console.log(JSON.stringify(err));
                    // 加载中动画关闭
                    // statusCode--->网络请求状态码，数字类型
                    // code--->错误码，数字类型。（0：连接错误、1：超时、2：授权错误、3：数据类型错误、4：不安全的数据）
                    if (err.statusCode == 1) {
                        //请求超时，请稍后再试
                    }
                    reject(err);
                },
            });
        });
    },
    put: (url, async, data, method = "put") => {
        return new Promise((resolve, reject) => {
            // 加载中动画开启
            //设置默认异步请求
            if (async == "" || async == null || typeof async == "undefined") {
                async = true;
            }
            $.ajax({
                url: baseUrl + url,
                type: method,
                async: async,
                dataType: "json",
                data: JSON.stringify(data),
                headers: {
                    Token: localStorage.getItem("token"), //自定义请求头
                    "Content-Type": "application/json;charset=utf8",
                },
                success: function (ret) {
                    // 加载中动画关闭
                    // loading && loading.close();
                    if (ret.code == 200) {
                        resolve(ret);
                    } else {
                        if (ret.code == 401) {
                            //登录超时，您需要重新登录
                            setTimeout(() => {
                                localStorage.setItem("token", null);
                                window.open("login.html");
                            }, 1500);
                        }
                        reject(ret);
                    }
                },
                error: function (err) {
                    //console.log(JSON.stringify(err));
                    // 加载中动画关闭
                    // statusCode--->网络请求状态码，数字类型
                    // code--->错误码，数字类型。（0：连接错误、1：超时、2：授权错误、3：数据类型错误、4：不安全的数据）
                    if (err.statusCode == 1) {
                        //  请求超时，请稍后再试
                    }
                    reject(err);
                },
            });
        });
    },
    delete: (url, async, data, method = "delete") => {
        return new Promise((resolve, reject) => {
            // 加载中动画开启
            //设置默认异步请求
            if (async == "" || async == null || typeof async == "undefined") {
                async = true;
            }
            $.ajax({
                url: baseUrl + url,
                type: method,
                async: async,
                dataType: "json",
                data: JSON.stringify(data),
                headers: {
                    Token: localStorage.getItem("token"), //自定义请求头
                    "Content-Type": "application/json;charset=utf8",
                },
                success: function (ret) {
                    // 加载中动画关闭
                    // loading && loading.close();
                    if (ret.code == 200) {
                        resolve(ret);
                    } else {
                        if (ret.code == 401) {
                            //登录超时，您需要重新登录。
                            setTimeout(() => {
                                localStorage.setItem("token", null);
                                window.open("../../authentication-login.html");
                            }, 1500);
                        }
                        reject(ret);
                    }
                },
                error: function (err) {
                    //console.log(JSON.stringify(err));
                    // 加载中动画关闭
                    // statusCode--->网络请求状态码，数字类型
                    // code--->错误码，数字类型。（0：连接错误、1：超时、2：授权错误、3：数据类型错误、4：不安全的数据）
                    if (err.statusCode == 1) {
                        //请求超时，请稍后再试。
                    }
                    reject(err);
                },
            });
        });
    },
};