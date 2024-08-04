package com.ruoyi.common.utils.vivoGpt;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

public class AuthUtil {
    public static Map<String, String> genSignHeaders(String appId, String appKey, String method, String uri, Map<String, String> query) {
        method = method.toUpperCase();
        String timestamp = String.valueOf(System.currentTimeMillis() / 1000);
        String nonce = genNonce();
        String canonicalQueryString = genCanonicalQueryString(query);
        String signedHeadersString = String.format("x-ai-gateway-app-id:%s\nx-ai-gateway-timestamp:%s\nx-ai-gateway-nonce:%s", appId, timestamp, nonce);
        String signingString = String.format("%s\n%s\n%s\n%s\n%s\n%s", method, uri, canonicalQueryString, appId, timestamp, signedHeadersString);
        String signature = genSignature(appKey, signingString);

        Map<String, String> headers = new HashMap<>();
        headers.put("X-AI-GATEWAY-APP-ID", appId);
        headers.put("X-AI-GATEWAY-TIMESTAMP", timestamp);
        headers.put("X-AI-GATEWAY-NONCE", nonce);
        headers.put("X-AI-GATEWAY-SIGNED-HEADERS", "x-ai-gateway-app-id;x-ai-gateway-timestamp;x-ai-gateway-nonce");
        headers.put("X-AI-GATEWAY-SIGNATURE", signature);

        return headers;
    }

    private static String genNonce() {
        String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random = new Random();
        return random.ints(8, 0, chars.length())
                .boxed()
                .map(i -> chars.charAt(i))
                .map(String::valueOf)
                .collect(Collectors.joining(""));
    }

    private static String genCanonicalQueryString(Map<String, String> params) {
        if (params != null && !params.isEmpty()) {
            return params.entrySet().stream()
                    .sorted(Map.Entry.comparingByKey())
                    .map(entry -> {
                        try {
                            return String.format("%s=%s", encodeURIComponent(entry.getKey()), encodeURIComponent(entry.getValue()));
                        } catch (UnsupportedEncodingException e) {
                            throw new RuntimeException(e);
                        }
                    })
                    .collect(Collectors.joining("&"));
        } else {
            return "";
        }
    }

    private static String encodeURIComponent(String value) throws UnsupportedEncodingException {
        return java.net.URLEncoder.encode(value, StandardCharsets.UTF_8.name())
                .replaceAll("\\+", "%20")
                .replaceAll("%21", "!")
                .replaceAll("%27", "'")
                .replaceAll("%28", "(")
                .replaceAll("%29", ")")
                .replaceAll("%7E", "~");
    }

    private static String genSignature(String appKey, String signingString) {
        try {
            Mac mac = Mac.getInstance("HmacSHA256");
            SecretKeySpec secretKeySpec = new SecretKeySpec(appKey.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
            mac.init(secretKeySpec);
            byte[] hmac = mac.doFinal(signingString.getBytes(StandardCharsets.UTF_8));
            return Base64.getEncoder().encodeToString(hmac);
        } catch (NoSuchAlgorithmException | InvalidKeyException e) {
            throw new RuntimeException("Failed to generate signature", e);
        }
    }
}