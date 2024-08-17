package com.sky.test;

import com.sky.config.RedisConfiguration;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import java.util.concurrent.TimeUnit;

//@SpringBootTest
public class SpringDataRedis {
    @Autowired
    private RedisTemplate redisTemplate;

    @Test
    public void testRedisTemplate() {
        System.out.println(redisTemplate);
        //5个接口
        redisTemplate.opsForValue();
        redisTemplate.opsForHash();
        redisTemplate.opsForGeo();

    }
    @Test
    //操作字符串类型的数据
    public void testString(){
        ValueOperations valueOperations = redisTemplate.opsForValue();
        //set get setex setnx
        valueOperations.set("city","北京");
        Object city = (String) valueOperations.get("city");
        System.out.println(city);
        valueOperations.set("address","beijig",20, TimeUnit.SECONDS);

        valueOperations.setIfAbsent("city","shanghai");
        Object city1 = valueOperations.get("city");
        System.out.println(city1);
    }

}
