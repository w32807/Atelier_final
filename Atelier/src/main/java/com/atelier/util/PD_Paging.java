package com.atelier.util;

public class PD_Paging {
	private int maxNum; 
	private int pageNum; 
	private int listCount; 
	private int pageCount; 
	private String listName; 


	public PD_Paging(int maxNum, int pageNum, int listCount, int pageCount, String listName) {
		this.maxNum = maxNum;
		this.pageNum = pageNum;
		this.listCount = listCount;
		this.pageCount = pageCount;
		this.listName = listName;
	}

	public String makeHtmlPaging() {
		int totalPage = (maxNum % listCount > 0) ? maxNum/listCount+1 : maxNum/listCount;
		int totalGroup = (totalPage % pageCount > 0) ? totalPage/pageCount+1 : totalPage/pageCount;
		int currentGroup = (pageNum%pageCount>0) ? pageNum/pageCount+1 : pageNum/pageCount;

		return makeHtml(totalPage, currentGroup, listName);
	}

	private String makeHtml(int totalPage, int currentGroup, String listName) {
		StringBuffer sb = new StringBuffer();
		
		int start = (currentGroup*pageCount)-(pageCount-1);

		int end = (currentGroup*pageCount >= totalPage) ? totalPage:currentGroup*pageCount;

		if(start != 1) {
			sb.append("<a href='" + listName + "?pageNum=" + (start-1) +"'>");
			sb.append("[이전]");
			sb.append("</a>");
		}

		for(int i = start; i <= end; i++) {
			if(pageNum != i) {
				sb.append("<a href='" + listName + "?pageNum=" + i + "'>");
				sb.append(" [ " + i + " ]</a>");
			}
			else {
				sb.append("<font style='color:red;'>");
				sb.append(" [ " + i + " ]</font>");
			}
		}

		if(end != totalPage) {
			sb.append("<a href='" + listName + "?pageNum=" + (end+1) +"'>");
			sb.append("[다음]");
			sb.append("</a>");
		}

		return sb.toString();
	}
	
}//PD_Paging Class end
