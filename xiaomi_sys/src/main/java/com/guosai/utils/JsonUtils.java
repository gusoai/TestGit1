package com.guosai.utils;

import com.guosai.vo.JsonBean;

public class JsonUtils {
	public static JsonBean createJsonBean(int code,Object msg) {
		JsonBean bean = new JsonBean();
		bean.setCode(code);
		bean.setMsg(msg);
		return bean;
	} 
}
