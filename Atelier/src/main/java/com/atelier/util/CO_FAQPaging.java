package com.atelier.util;

import org.springframework.stereotype.Component;

@Component

public class CO_FAQPaging {
	private int maxNum; 
	private int FAQPageNum; 
	private int listCount; 
	private int pageCount;
	private String listName;

	public CO_FAQPaging(int maxNum, int FAQPageNum, int listCount, int pageCount, String listName) {
		this.maxNum = maxNum;
		this.FAQPageNum = FAQPageNum;
		this.listCount = listCount;
		this.pageCount = pageCount;
		this.listName = listName;
	}
	
	public String makeHtmlPaging() {
		int totalPage = (maxNum % listCount > 0 )? maxNum/listCount+1 : maxNum/listCount;
		int totalGroup = (totalPage%pageCount) > 0 ? totalPage/pageCount +1 : totalPage/pageCount ;
		int currentGroup = (FAQPageNum % pageCount) >0 ? FAQPageNum/pageCount +1 : FAQPageNum/pageCount;
		
		return makeHtml(totalPage,currentGroup);
	}

	private String makeHtml(int totalPage, int currentGroup) {
		StringBuffer sb = new StringBuffer();
		
		int start = (currentGroup * pageCount)- (pageCount-1);
		int end = (currentGroup * pageCount >= totalPage)? totalPage : currentGroup *pageCount;
		if(start != 1) {
			sb.append("<a href='" + listName + "?FAQPageNum=" +(start-1) + "'>");
			sb.append("[이전]");		
			sb.append("</a>");
			}
			for(int i = start; i<=end;i++) {
				if(FAQPageNum != i) {
					sb.append("<a href='" + listName + "?FAQPageNum=" + i + "'>");
					sb.append("[" + i +"]</a>");
				}
				else {
					sb.append("<font style='color:red;'>");
					sb.append("[" + i +"]</font>");
				}
			}
			
			if(end != totalPage) {
				sb.append("<a href='" + listName + "?FAQPageNum=" +(end+1) + "'>");
				sb.append("[다음]");			
				sb.append("</a>");
			}
			
		return sb.toString();
	}
}//CO_FAQPaging Class end
