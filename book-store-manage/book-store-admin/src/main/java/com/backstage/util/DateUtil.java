package com.backstage.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang3.Validate;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.commons.lang3.time.FastDateFormat;

/**
 * 日期工具类.
 * 
 * 在不方便使用joda-time时，使用本类降低Date处理的复杂度与性能消耗, 封装Common Lang及移植Jodd的最常用日期方法
 * 
 */
public class DateUtil {

	public static final long MILLIS_PER_SECOND = 1000; // Number of milliseconds in a standard second.

	public static final long MILLIS_PER_MINUTE = 60 * MILLIS_PER_SECOND; // Number of milliseconds in a standard minute.

	public static final long MILLIS_PER_HOUR = 60 * MILLIS_PER_MINUTE; // Number of milliseconds in a standard hour.

	public static final long MILLIS_PER_DAY = 24 * MILLIS_PER_HOUR; // Number of milliseconds in a standard day.
	
	
	// 以T分隔日期和时间，并带时区信息，符合ISO8601规范
	public static final String PATTERN_ISO = "yyyy-MM-dd'T'HH:mm:ss.SSSZZ";
	public static final String PATTERN_ISO_ON_SECOND = "yyyy-MM-dd'T'HH:mm:ssZZ";
	public static final String PATTERN_ISO_ON_DATE = "yyyy-MM-dd";
	
	// 以空格分隔日期和时间，不带时区信息
	public static final String PATTERN_DEFAULT = "yyyy-MM-dd HH:mm:ss.SSS";
	public static final String PATTERN_DEFAULT_ON_SECOND = "yyyy-MM-dd HH:mm:ss";

	private static final int[] MONTH_LENGTH = { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

	/**
	 * 获得日期是一周的第几天. 已改为中国习惯，1 是Monday，而不是Sundays.
	 */
	public static int getDayOfWeek(Date date) {
		int result = get(date, Calendar.DAY_OF_WEEK);
		return result == 1 ? 7 : result - 1;
	}

	/**
	 * 每天的开始时间
	 * 2017-03-10 07:33:23, 则返回2017-03-10 00:00:00
	 * @param date
	 * @return
	 */
	public static Date beginOfDate(Date date) {
		return DateUtils.truncate(date, Calendar.DATE);
	}
	
	/**
	 * 格式化时间
	 * @param pattern
	 * @param date
	 * @return
	 */
	public static String formatDate(String pattern, Date date) {
		return FastDateFormat.getInstance(pattern).format(date);
	}

	/**
	 * 获得日期是周几
	 */
	public static String getDayWeek(Date date) {
		int dayOfWeek = getDayOfWeek(date);
		switch (dayOfWeek) {
			case 1 : return "周一";
			case 2 : return "周二";
			case 3 : return "周三";
			case 4 : return "周四";
			case 5 : return "周五";
			case 6 : return "周六";
			case 7 : return "周日";
			default: return "";
		}
	}


	/**
	 * 获得日期是一年的第几天，返回值从1开始
	 */
	public static int getDayOfYear(Date date) {
		return get(date, Calendar.DAY_OF_YEAR);
	}

	/**
	 * 获得日期是一月的第几周，返回值从1开始.
	 * 
	 * 开始的一周，只要有一天在那个月里都算. 已改为中国习惯，1 是Monday，而不是Sunday
	 */
	public static int getWeekOfMonth(Date date) {
		return get(date, Calendar.WEEK_OF_MONTH);
	}

	/**
	 * 获得日期是一年的第几周，返回值从1开始.
	 * 
	 * 开始的一周，只要有一天在那一年里都算.已改为中国习惯，1 是Monday，而不是Sunday
	 */
	public static int getWeekOfYear(Date date) {
		return get(date, Calendar.WEEK_OF_YEAR);
	}

	private static int get(final Date date, int field) {
		Validate.notNull(date, "The date must not be null");
		Calendar cal = Calendar.getInstance();
		cal.setFirstDayOfWeek(Calendar.MONDAY);
		cal.setTime(date);
		return cal.get(field);
	}

	/**
	 * 是否闰年.
	 */
	public static boolean isLeapYear(Date date) {
		return isLeapYear(get(date, Calendar.YEAR));
	}

	/**
	 * 是否闰年，移植Jodd Core的TimeUtil
	 * 
	 * 参数是公元计数, 如2016
	 */
	public static boolean isLeapYear(int y) {
		boolean result = false;

		if (((y % 4) == 0) && // must be divisible by 4...
				((y < 1582) || // and either before reform year...
						((y % 100) != 0) || // or not a century...
						((y % 400) == 0))) { // or a multiple of 400...
			result = true; // for leap year.
		}
		return result;
	}

	/**
	 * 获取某个月有多少天, 考虑闰年等因数, 移植Jodd Core的TimeUtil
	 */
	public static int getMonthLength(Date date) {
		int year = get(date, Calendar.YEAR);
		int month = get(date, Calendar.MONTH);
		return getMonthLength(year, month);
	}

	/**
	 * 获取某个月有多少天, 考虑闰年等因数, 移植Jodd Core的TimeUtil
	 */
	public static int getMonthLength(int year, int month) {

		if ((month < 1) || (month > 12)) {
			throw new IllegalArgumentException("Invalid month: " + month);
		}
		if (month == 2) {
			return isLeapYear(year) ? 29 : 28;
		}

		return MONTH_LENGTH[month];
	}
	
	/**
     * 计算前几秒，前几分，前几个小时，前几天,后几秒，后几分，后几个小时，后几天
     * @param date
     * @return
     */
	public static String getDayBeforeOrAfter(Date date, String pattern) {
		Date dateNow = new Date();
        long now = dateNow.getTime();
        long span = now - date.getTime();
        if (span < 0) {
            long s = date.getTime() - now;
            if (s < DateUtil.MILLIS_PER_MINUTE) {
        		return String.format("%d秒后", span / DateUtil.MILLIS_PER_SECOND);
    		} else if (s < DateUtil.MILLIS_PER_HOUR) {
                return String.format("%d分钟后", s / DateUtil.MILLIS_PER_MINUTE);
            } else if (s < DateUtil.MILLIS_PER_DAY) {
                return String.format("%d小时后", s / DateUtil.MILLIS_PER_HOUR);
            } else {
            	 long s2 = beginOfDate(date).getTime() - beginOfDate(dateNow).getTime();
            	// 如果时间大于三天，直接返回时间字符串
            	if(s2 / DateUtil.MILLIS_PER_DAY > 3) {
            		return DateUtil.formatDate(pattern, date);
            	}
                return String.format("%d天后", s2 / DateUtil.MILLIS_PER_DAY);
            }
        } else {
        	if (span < DateUtil.MILLIS_PER_MINUTE) {
        		return String.format("%d秒前", span / DateUtil.MILLIS_PER_SECOND);
    		} else if (span < DateUtil.MILLIS_PER_HOUR) {
                return String.format("%d分钟前", span / DateUtil.MILLIS_PER_MINUTE);
            } else if (span < DateUtil.MILLIS_PER_DAY) {
                return String.format("%d小时前", span / DateUtil.MILLIS_PER_HOUR);
            } else {
            	long s1 = beginOfDate(dateNow).getTime() - beginOfDate(date).getTime();
            	if(s1 / DateUtil.MILLIS_PER_DAY > 3) {
            		return DateUtil.formatDate(pattern, date);
            	}
                return String.format("%d天前", s1 / DateUtil.MILLIS_PER_DAY);
            }
        }
    }
	
	public static void main(String[] args) throws ParseException {
		String timeStr = "2017-03-15 10:25:00";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:ss:mm");
		Date date = sdf.parse(timeStr);
		String dayBeforeOrAfter = getDayBeforeOrAfter(date, "yyyy-MM-dd HH:ss:mm");
		System.out.println(dayBeforeOrAfter);
	}
}
