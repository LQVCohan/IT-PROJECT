package com.ecopic.control.frontend.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecopic.service.CustomerServices;

@WebServlet("/register_customer")
public class RegisterCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterCustomerServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		CustomerServices customerServices = new CustomerServices(request, response);
		customerServices.registerCustomer();
	}

}
