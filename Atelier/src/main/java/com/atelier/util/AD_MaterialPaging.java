package com.atelier.util;

import org.springframework.stereotype.Component;

@Component
public class AD_MaterialPaging {
	private int maxNum; 
	private int adcPageNum;
	private int listCount;
	private int pageCount;
	private String listName;
	
	public AD_MaterialPaging(int maxNum, int adcPageNum, int listCount, int pageCount, String listName) {
		this.maxNum = maxNum;
		this.adcPageNum = adcPageNum;
		this.listCount = listCount;
		this.pageCount = pageCount;
		this.listName = listName;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 원자재 리스트 출력 / 페이징 처리
	  * 작성자: JSH
	  * 작성일 : 2019.02.07
	  -----------------------------------------------------------------------------------*/
	public String makeHtmlPaging() {
		int totalPage = (maxNum % listCount > 0 )? maxNum/listCount+1 : maxNum/listCount;
		int totalGroup = (totalPage%pageCount) > 0 ? totalPage/pageCount +1 : totalPage/pageCount ;
		
		int currentGroup = (adcPageNum % pageCount) >0 ? adcPageNum/pageCount +1 : adcPageNum/pageCount;
		
		return makeHtml(totalPage,currentGroup);
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 원자재 리스트 출력 / 페이징 처리
	  * 작성자: JSH
	  * 작성일 : 2019.02.07
	  -----------------------------------------------------------------------------------*/
	private String makeHtml(int totalPage, int currentGroup) {
		StringBuffer sb = new StringBuffer();
		int start = (currentGroup * pageCount)- (pageCount-1);
		int end = (currentGroup * pageCount >= totalPage)? totalPage : currentGroup *pageCount;
		
		if(start != 1) {
			sb.append("<li>");
			sb.append("<a href='" + listName + "?adcPageNum=" +(start-1) + "'>");
			sb.append("«");	
			}
			for(int i = start; i<=end;i++) {
				if(adcPageNum != i) {
					sb.append("<li ><a href='" + listName + "?adcPageNum=" + i + "'>" + i +"</a></li>");
				}
				else {
					sb.append("<li ><a href='#'>"+ i +"</a></li>");
				}
			}
			
			if(end != totalPage) {
				sb.append("<li><a href='" + listName + "?adcPageNum=" +(end+1) + "'>");
				sb.append("»");		
				sb.append("</a></li>");
			}
		return sb.toString();
	}
	
}//AD_MaterialPaging Class end
