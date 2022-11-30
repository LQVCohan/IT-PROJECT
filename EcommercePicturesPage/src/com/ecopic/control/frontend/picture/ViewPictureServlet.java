package com.ecopic.control.frontend.picture;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecopic.service.PictureService;

@WebServlet("/view_picture")
public class ViewPictureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ViewPictureServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PictureService pictureService = new PictureService(request, response);
		pictureService.viewPictureDetail();
	}
}
