package com.tulun.model;

import org.apache.log4j.Logger;


/**
 * 封装统一的结果集给前端
 */
public class Result {

	// 操作结果
	private String resultCode;
	
	// 错误信息
	private String errorInfo;
	
	// 附属对象
	private Object object;
	
	public Result(String resultCode, String errorInfo) {
		super();
		this.resultCode = resultCode;
		//this.errorInfo = "错误";
		this.errorInfo = errorInfo;
        System.out.println(errorInfo);
	}
	
	public Result(String resultCode, String errorInfo, Object object) {
		super();
		this.resultCode = resultCode;
		this.errorInfo = errorInfo;

		this.object = object;
	}

	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getErrorInfo() {
		return errorInfo;
	}

	public void setErrorInfo(String errorInfo) {
		this.errorInfo = errorInfo;
	}

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}

	@Override
	public String toString() {
		return "Result{" +
				"resultCode='" + resultCode + '\'' +
				", errorInfo='" + errorInfo + '\'' +
				", object=" + object +
				'}';
	}
}
