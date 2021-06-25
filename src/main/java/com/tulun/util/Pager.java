package com.tulun.util;

import java.util.ArrayList;
import java.util.List;

/**
 * @功能：分页类
 * 
 * 分页信息主要包括几个：当前页   每页显示数  总页数  总数量  和分页返回的信息
 * 
 * @作者： gdz
 * @时间： 2019-6-18 下午5:14:29
 */
public class Pager<T> {
	
	/**
	 * 默认每页显示数
	 */
	public static final int PAGE_SIZE = 10;
	
	/**
	 * 默认页数
	 */
	public static final int PAGE_NUM = 1;
	
	/**
	 * 页数
	 */
	private int page;
	
	/**
	 * 每页显示数
	 */
	private int limit = PAGE_SIZE;
	
	/**
	 * 总页数
	 */
	private int totalPageNum;
	
	/**
	 * 记录总数
	 */
	private int totalCount;
	
	/**
	 * 分页信息
	 */
	private List<T> rows = new ArrayList<T>();
	
	/**
	 * 分页计算起始值
	 */
	private int start;
	
	/**
	 * 分页计算结束值  暂时没用
	 */
	private int endIndex;
	
	public void setPageNum(int pageNum) {
		if(pageNum <= 0){
			pageNum = PAGE_NUM;
		}
		if(pageNum > totalPageNum){
			pageNum = totalPageNum;
		}
		// 分页开始值 关键
		if(pageNum == 0){
			start = 0;
		}else{
			start = (pageNum - 1) * limit;
		}
		this.page = pageNum;
	}
	
	public int getStart() {
		// 分页开始值 关键
		if (page == 0) {
			start = 0;
		} else {
			start = (page - 1) * limit;
		}
		return start;
	}

	public void setPageSize(int pageSize) {
		if(pageSize <= 0){
			pageSize = PAGE_SIZE;
		}
		// 计算最大页数
		int pageCount = totalCount / pageSize;
		if(totalCount % pageSize == 0){
			totalPageNum = pageCount;
		}else{
			totalPageNum = pageCount + 1;
		}
		this.limit = pageSize;
	}

	public int getTotalPageNum() {
		return totalPageNum;
	}

	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		if(totalCount > 0){
			if(page <= 0){
				page = PAGE_NUM;
			}
			// 计算最大页数
			int pageCount = totalCount / PAGE_SIZE;
			if(totalCount % PAGE_SIZE == 0){
				totalPageNum = pageCount;
			}else{
				totalPageNum = pageCount + 1;
			}
		}else{
			totalPageNum = 0;
		}
		
		if(page > totalPageNum){
			page = totalPageNum;
		}
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public void setStart(int start) {
		this.start = start;
	}

	@Override
	public String toString() {
		return "Pager{" +
				"page=" + page +
				", limit=" + limit +
				", totalPageNum=" + totalPageNum +
				", totalCount=" + totalCount +
				", rows=" + rows +
				", start=" + start +
				", endIndex=" + endIndex +
				'}';
	}
}
