package com.bs.utils.string;

import com.bs.utils.time.DateFormatUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.RandomStringUtils;

import java.text.NumberFormat;
import java.util.Date;
import java.util.Random;

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

    /**
     * 获取订单号
     * @return
     */
    public static String getOrderNum() {
        String timeStr = DateFormatUtil.formatDate("yyyyMMddHHmmss", new Date());
        String countStr;
        Random ne = new Random();// 实例化一个random的对象ne
        int count = ne.nextInt(9999 - 1000 + 1) + 1000;// 为变量赋随机值1000-9999

        NumberFormat formatter = NumberFormat.getNumberInstance();
        formatter.setMinimumIntegerDigits(4);
        formatter.setGroupingUsed(false);
        countStr = formatter.format(count);
        return timeStr + countStr;
    }
    public static void main(String[] args) {
        String md5 = StringUtil.getMD5("123123");
        System.out.println(md5);
        String randomString = getRandomString(8);
        System.out.println(randomString);
    }


}
