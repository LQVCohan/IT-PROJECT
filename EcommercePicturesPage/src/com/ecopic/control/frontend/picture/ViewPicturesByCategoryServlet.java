package com.ecopic.control.frontend.picture;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecopic.dao.PictureDAO;
import com.ecopic.service.PictureService;

@WebServlet("/view_category")
public class ViewPicturesByCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ViewPicturesByCategoryServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		PictureService pictureService = new PictureService(request, response);
		pictureService.listPicturesByCategory();
	}

}
