package com.sky.aspect;

import com.sky.annotation.AutoFill;
import com.sky.constant.AutoFillConstant;
import com.sky.context.BaseContext;
import com.sky.enumeration.OperationType;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.util.Args;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.time.LocalDateTime;

//自定义切面，实现公共字段自动填充
@Aspect
@Component
@Slf4j
public class AutoFIiiAspect {
    //指定切入点
    @Pointcut("@annotation(com.sky.annotation.AutoFill)")
    public void autoFillPonitCut() {
    }

    //前置通知，为公共字段赋值
    @Before("autoFillPonitCut()")
    public void autoFill(JoinPoint joinPoint) {
        log.info("开始进行公共字段自动填充");
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();//方法签名对象


        AutoFill autoFill = signature.getMethod().getAnnotation(AutoFill.class);//获得方法上的注解对象
        OperationType operationType = autoFill.value();//获得数据库的操作类型
        //获得当前被拦截的方法的参数--实体对象
        Object[] args = joinPoint.getArgs();
        if (args == null || args.length == 0) {
            return;
        }
        Object entity = args[0];
        LocalDateTime now = LocalDateTime.now();
        Long currentId = BaseContext.getCurrentId();
        //根据不同的操作类型来进行不同的判断
        if (operationType == OperationType.INSERT) {
            //为四个公共字段来赋值
            try {
                //通过反射获取实体对象的相应方法。
                Method setCreateTime = entity.getClass().getDeclaredMethod(AutoFillConstant.SET_CREATE_TIME, LocalDateTime.class);
                Method setCreateUser = entity.getClass().getDeclaredMethod(AutoFillConstant.SET_CREATE_USER, Long.class);
                Method setUpdateTime = entity.getClass().getDeclaredMethod(AutoFillConstant.SET_UPDATE_TIME, LocalDateTime.class);
                Method setUpdateUser = entity.getClass().getDeclaredMethod(AutoFillConstant.SET_UPDATE_USER, Long.class);
                //调用这些方法为公共字段赋值
                setCreateTime.invoke(entity, now);
                setCreateUser.invoke(entity, currentId);
                setUpdateTime.invoke(entity, now);
                setUpdateUser.invoke(entity, currentId);


            } catch (Exception e) {
                throw new RuntimeException(e);
            }


        } else if (operationType == OperationType.UPDATE) {
            //为两个公共字段进行赋值即可
            try {

                Method setUpdateTime = entity.getClass().getDeclaredMethod(AutoFillConstant.SET_UPDATE_TIME, LocalDateTime.class);
                Method setUpdateUser = entity.getClass().getDeclaredMethod(AutoFillConstant.SET_UPDATE_USER, Long.class);

                setUpdateTime.invoke(entity, now);
                setUpdateUser.invoke(entity, currentId);


            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }


    }

}
