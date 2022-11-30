package com.ecopic.control.frontend;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class CustomerLoginFilter implements Filter {
	private static final String[] LoginRequiredURLs = {
			"/view_profile", "/edit_customer", "/update_profile",
			"/view_checkout", "/place_order","/view_orders","/show_order_detail",
	};
	
	public CustomerLoginFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest 	= (HttpServletRequest) request; 
		HttpSession session = httpRequest.getSession(false);
		
		String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
		
		if (path.startsWith("/admin/")) {
			chain.doFilter(request, response);
			return;
		}
		
		boolean loggedIn = session != null && session.getAttribute("loggedCustomer") != null;
		
		String requestURL = httpRequest.getRequestURI().toString();
		
		if (!loggedIn && isLoginRequired(requestURL)){
			String query = httpRequest.getQueryString();
			String redirectURL = requestURL;
			if(query != null) {
				redirectURL = redirectURL.concat("?").concat(query);
			}
			
			session.setAttribute("redirectURL", redirectURL);
			
			String loginPage = "customer-login.jsp";
			RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginPage);
			dispatcher.forward(httpRequest, response);
		}else {
			chain.doFilter(request, response);
		}
		
		
	}
	
	private boolean isLoginRequired(String requestURL) {
		for (String loginRequiredURL : LoginRequiredURLs) {
			if(requestURL.contains(loginRequiredURL)) {
				return true;
			}
		}
		return false;
	}
	
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
