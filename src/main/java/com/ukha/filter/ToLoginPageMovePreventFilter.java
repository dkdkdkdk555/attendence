package com.ukha.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(value={"/home.do", "/"}) // Web.xml 에 정의해둔 filter를 어노테이션으로 매핑
public class ToLoginPageMovePreventFilter implements Filter {

	private String path;// init파람	
	
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session =  req.getSession();
		String id = (String) session.getAttribute("id");

		if(id!=null){ // 로그인을 한 상태면 
			System.out.println("로그인을 한 상태");
			String cPath = req.getContextPath();
			HttpServletResponse resq = (HttpServletResponse) response;
			resq.sendRedirect(cPath + "/user/main.do?id=" + id);
		} else {
			System.out.println("로그인을 안한 상태");
			chain.doFilter(request, response); 
		}
		
	}

	@Override
	public void init(FilterConfig fc) throws ServletException {
		path = fc.getInitParameter("path"); // web.xml의 로그인필터에 설정해 둔 initParam
	}

}
