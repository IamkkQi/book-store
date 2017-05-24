package com.backstage.annotation;

import java.lang.annotation.*;

/**
 * 操作对象注解
 */
@Target({ ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SystemLog {
	// 操作类型
	String type() default "";

	// 操作内容
	String content() default "";
}
