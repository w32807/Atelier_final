package com.atelier.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SessionInterceptor extends HandlerInterceptorAdapter {
	@Setter(onMethod_ = @Autowired)
	private HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.warn("preHandle - 인터셉트");
		
		 if(session.getAttribute("mb") == null) {//자바 소스에서는 session의 정보를 이렇게 꺼내온다.
			 //session이 비어있다면...
			 response.sendRedirect("../");
			 return false;
		 }
		 return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
			if(request.getProtocol().equals("HTTP/1.1")) {
				response.setHeader("Cache-Control", "no-cache, no-store , must-revalidate");
			}
			else {
				response.setHeader("Pragma", "no-cache");
			}
			response.setDateHeader("Expires", 0);
	}
}//SessionInterceptor Class end

