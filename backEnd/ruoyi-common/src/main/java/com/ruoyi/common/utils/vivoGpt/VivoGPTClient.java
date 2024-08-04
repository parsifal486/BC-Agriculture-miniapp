package com.ruoyi.common.utils.vivoGpt;

import com.google.gson.Gson;
import okhttp3.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class VivoGPTClient {

    private static final String APP_ID = "3035939530";
    private static final String APP_KEY = "uJVpxtryWYGOnGSB";
    private static final String DOMAIN = "api-ai.vivo.com.cn";

    public static String getPictureId(String prompt) {
        String requestId = UUID.randomUUID().toString();
        System.out.println("requestId: " + requestId);

        Map<String, Object> data = new HashMap<>();
        data.put("styleConfig","55c682d5eeca50d4806fd1cba3628781");
        data.put("height", "768");
        data.put("width", "576");
        data.put("prompt", prompt);

        Map<String, String> params = new HashMap<>();
        params.put("requestId", requestId);

        return (String)((Map<String, Object>) getResen(data, params, "POST", "/api/v1/task_submit").get("result")).get("task_id");

    }

    public static String contentGenerate(String prompt) {
        Map<String, Object> data = new HashMap<>();
        data.put("model", "vivo-BlueLM-TB");
        data.put("sessionId", UUID.randomUUID().toString());
        data.put("prompt", prompt);
        Map<String, Object> extra = new HashMap<>();
        extra.put("temperature", 0.9);
        data.put("extra", extra);
        Map<String, String> params = new HashMap<>();
        String requestId = UUID.randomUUID().toString();
        params.put("requestId", requestId);
        return (String)((Map<String, Object>) getResen(data, params, "POST", "/vivogpt/completions").get("data")).get("content");
    }

    public static Object pictureGenerate(String task_id) {
        Map<String, String> params1 = new HashMap<>();
        params1.put("task_id",task_id);
        return ((Map<String, Object>) getResen(null, params1,"GET","/api/v1/task_progress").get("result")).get("images_url");

    }

    private static Map<String, Object> getResen(Map<String, Object> data, Map<String, String> params, String METHOD, String URI) {
        OkHttpClient client = new OkHttpClient();
        MediaType JSON = MediaType.get("application/json; charset=utf-8");
        RequestBody body = RequestBody.create(JSON, new Gson().toJson(data));
        String url = "https://" + DOMAIN + URI;
        Map<String, String> headers = AuthUtil.genSignHeaders(APP_ID, APP_KEY, METHOD, URI, params);
        headers.put("Content-Type", "application/json");

        Request request = null;
        if ("GET".equals(METHOD)) {
            request = new Request.Builder()
                    .url(url + "?" + toQueryString(params))
                    .get()
                    .headers(Headers.of(headers))
                    .build();
        } else {
            request = new Request.Builder()
                    .url(url)
                    .post(body)
                    .headers(Headers.of(headers))
                    .url(url + "?" + toQueryString(params))
                    .build();
        }

        long startTime = System.currentTimeMillis();
        Map<String, Object> resObj = null;
        try (Response response = client.newCall(request).execute()) {
            if (response.code() == 200) {
                String responseBody = response.body().string();
                Gson gson = new Gson();
                resObj = gson.fromJson(responseBody, Map.class);
            }
            response.body().close(); // 添加这行代码来关闭ResponseBody
        } catch (IOException e) {
            e.printStackTrace();
        }
        long endTime = System.currentTimeMillis();
        double timeCost = (endTime - startTime) / 1000.0;
        System.out.printf("请求耗时: %.2f秒%n", timeCost);
        return resObj;
    }


    // 辅助方法，用于将参数Map转换为查询字符串
    private static String toQueryString(Map<String, String> params) {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<String, String> entry : params.entrySet()) {
            if (sb.length() > 0) {
                sb.append('&');
            }
            sb.append(entry.getKey()).append('=').append(entry.getValue());
        }
        return sb.toString();
    }
}
