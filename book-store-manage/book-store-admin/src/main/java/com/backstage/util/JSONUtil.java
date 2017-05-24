package com.backstage.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

/**
 * json工具类
 * @author Kay
 *
 */

public class JSONUtil {

	/**
	 * 不带日期的对象转换成json
	 * @param object
	 * @param type
	 * @param response
	 */
	public static void OutputJson(Object object, String type, HttpServletResponse response) {
		PrintWriter out = null;
		response.setContentType(type);
		response.setCharacterEncoding("utf-8");
		String json = null;
		try {
			out = response.getWriter();
			json = JSON.toJSONString(object);
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(json);
		out.close();
	}

	/**
	 * 带日期的对象转json
	 * @param object
	 * @param type
	 * @param datePattern
	 * @param response
	 */
	public static void OutputJson(Object object, String type, String datePattern, HttpServletResponse response) {
		PrintWriter out = null;
		response.setContentType(type);
		response.setCharacterEncoding("utf-8");
		String json = null;
		try {
			out = response.getWriter();
			json = JSON.toJSONStringWithDateFormat(object, datePattern);
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(json);
		out.close();
	}

}
