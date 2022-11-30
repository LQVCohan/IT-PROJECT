package com.ecopic.control.admin.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecopic.service.UserServices;

@WebServlet("/admin/edit_users")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public EditUserServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		UserServices userServices = new UserServices(request, response);
		userServices.editUser();
		
	}
}	
