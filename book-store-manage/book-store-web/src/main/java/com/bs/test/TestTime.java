package com.bs.test;


import com.bs.utils.time.DateFormatUtil;
import com.bs.utils.time.DateUtil;

import java.text.ParseException;
import java.util.Date;

/**
 * Created by qkk on 2017/3/4.
 */
public class TestTime {
    public static void main(String[] args) throws ParseException {
        String dateStr = "2017-03-03 20:19:00";
        Date date = DateFormatUtil.pareDate(DateFormatUtil.PATTERN_DEFAULT_ON_SECOND, dateStr);
        System.out.println(date);
        System.out.println(DateFormatUtil.getDayBeforeOrAfter(date));

        System.out.println(DateUtil.getDayWeek(date));
    }
}
