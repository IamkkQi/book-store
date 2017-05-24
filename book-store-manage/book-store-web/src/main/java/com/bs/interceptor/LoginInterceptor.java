package com.bs.interceptor;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Kay on 2017/5/22.
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
    /**
     * 拦截前的处理
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // 从session中获取用户登录信息
        Object obj = request.getSession().getAttribute("user");
        if(obj != null) {
            return true;
        }
        // 如果没有用户信息，说明没有登录跳转到login
        response.sendRedirect("/bs/loginUI");
        return false;
    }

    /**
     * 拦截后处理
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }

    /**
     * 全部完成后处理
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
}
