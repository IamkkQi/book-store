package com.backstage.aop;

import com.backstage.annotation.SystemLog;
import com.bs.pojo.Log;
import com.bs.pojo.User;
import com.bs.service.LogService;
import com.bs.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.Map;

/**
 * Created by Kay on 2017/5/23.
 */
@Aspect
@Component
public class SystemLogAop {
    @Resource
    private LogService logService;

    // 配置接入点
    @Pointcut("@annotation(com.backstage.annotation.SystemLog)")
    private void controllerAspect() {

    }

    @Around("controllerAspect()")
    public Object around(ProceedingJoinPoint pjp) {
        // 获取登录用户账户
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        // 拦截的实体类，就是当前正在执行的controller
        Object target = pjp.getTarget();
        // 拦截的方法名称。当前正在执行的方法
        String methodName = pjp.getSignature().getName();
        // 拦截的方法参数
        Object[] args = pjp.getArgs();
        // 拦截的放参数类型
        Signature sig = pjp.getSignature();
        MethodSignature msig = null;
        if (!(sig instanceof MethodSignature)) {
            throw new IllegalArgumentException("该注解只能用于方法");
        }
        msig = (MethodSignature) sig;
        Class[] parameterTypes = msig.getMethod().getParameterTypes();

        Object object = null;
        // 获得被拦截的方法
        Method method = null;
        try {
            method = target.getClass().getMethod(methodName, parameterTypes);
        } catch (NoSuchMethodException e1) {
            e1.printStackTrace();
        } catch (SecurityException e1) {
            e1.printStackTrace();
        }
        if (null != method) {
            // 判断是否包含自定义的注解，说明一下这里的SystemLog就是我自己自定义的注解
            User user = (User) request.getSession().getAttribute("user");
            if (method.isAnnotationPresent(SystemLog.class) && user != null) {
                // 日志实体对象
                Log log = new Log();
                log.setUserName(user.getUserName());
                log.setUserTel(user.getTel());
                log.setUserId(user.getId());
                // 获取系统时间
                log.setTime(new Date());
                SystemLog systemlog = method.getAnnotation(SystemLog.class);
                log.setType(systemlog.type());
                log.setContent(systemlog.content());
                log.setIp(getIp(request));
                try {
                    object = pjp.proceed();
                    // String aopFlag = null;
                    String ms = null;
                    String aopType = null;
                    if (args != null && args.length != 0) {
                        for (Object obj : args) {
                            if (obj instanceof Map) {
                                Map<String, Object> map = (Map<String, Object>) obj;
                                // aopFlag = map.get("aopflag") == null ? "执行成功！" : map.get("aopflag").toString();
                                ms = map.get("aopmsg") == null ? null : map.get("aopmsg").toString();
                                aopType = map.get("aoptype") == null ? null : map.get("aoptype").toString();
                            }
                        }
                        log.setContent(ms == null ? log.getContent() : (log.getContent() + "," + ms));
                        log.setType(aopType == null ? log.getType() : (log.getType() + "," + aopType));
                        log.setResult("执行成功！");
                        // 保存进数据库
                        logService.save(log);
                    }
                } catch (Throwable e) {
                    log.setResult("执行失败！");
                    logService.save(log);
                }
            } else {// 没有包含注解
                try {
                    object = pjp.proceed();
                } catch (Throwable e) {
                    e.printStackTrace();
                }
            }
        } else { // 不需要拦截直接执行
            try {
                object = pjp.proceed();
            } catch (Throwable e) {
                e.printStackTrace();
            }
        }
        return object;
    }

    public static String getIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
            // 多次反向代理后会有多个ip值，第一个ip才是真实ip
            int index = ip.indexOf(",");
            if (index != -1) {
                return ip.substring(0, index);
            } else {
                return ip;
            }
        }
        ip = request.getHeader("X-Real-IP");
        if (StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
            return ip;
        }
        return request.getRemoteAddr();
    }

}
