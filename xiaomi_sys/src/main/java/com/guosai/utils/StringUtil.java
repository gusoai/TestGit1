package com.guosai.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class StringUtil {
	public static boolean isEmpty(String info)  {
		if (info == null || info.trim().equals("")) {
			return true;
		} else {
			return false;
		}
	}
	
	public static String createOrderCodeId() {
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String time = sdf.format(new Date());
		String orderCode = uuid +time;
		
		return orderCode;
	}
}
