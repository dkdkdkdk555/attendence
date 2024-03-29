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

@WebFilter("/user/*") // Web.xml 에 정의해둔 filter를 어노테이션으로 매핑
public class LoginFilter implements Filter {

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
		System.out.println(id);
		if(id!=null){
			System.out.println(req.getRequestURI());
			if("home.do".equals(req.getRequestURI())){
				String cPath = req.getContextPath();
				HttpServletResponse resq = (HttpServletResponse) response;
				resq.sendRedirect(cPath + "/user/main.do");
			}
			System.out.println("트루");
			chain.doFilter(request, response); // 로그인된 아이디가 있으면 요청,응답을 가로채지않고 진행시킨다.
		} else {
			System.out.println("거짓");
			String cPath = req.getContextPath();
			HttpServletResponse resq = (HttpServletResponse) response;
			resq.sendRedirect(cPath + path); // /loginform.jsp 로 이동
		}
		
	}

	@Override
	public void init(FilterConfig fc) throws ServletException {
		path = fc.getInitParameter("path"); // web.xml의 로그인필터에 설정해 둔 initParam
	}

}
