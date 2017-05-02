package com.bs.utils.string;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.RandomStringUtils;

/**
 * 字符串工具类
 * Created by Kay on 2017/4/25.
 */
public class StringUtil {
    /**
     * md5加密
     * @param str
     * @return
     */
    public static String getMD5(String str) {
        return DigestUtils.md5Hex(str);
    }

    /**
     * 生成随机字符串
     * @param n
     * @return
     */
    public static String getRandomString(int n) {
       return RandomStringUtils.randomAlphanumeric(n);
    }

    public static void main(String[] args) {
        String md5 = StringUtil.getMD5("123123");
        System.out.println(md5);
        String randomString = getRandomString(8);
        System.out.println(randomString);
    }


}
