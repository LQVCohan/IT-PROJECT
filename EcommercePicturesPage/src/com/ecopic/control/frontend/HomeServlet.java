package com.ecopic.control.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecopic.dao.PictureDAO;
import com.ecopic.entity.Picture;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HomeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		PictureDAO pictureDAO = new PictureDAO();
		
		List<Picture> listNewPictures = pictureDAO.listNewPictures();
		List<Picture>  listBestSellingPictures = pictureDAO.listBestSellingPictures();
		List<Picture>  listMostFavoredPictures = pictureDAO.listMostFavoredPictures();
		
		request.setAttribute("listNewPictures", listNewPictures);
		request.setAttribute("listBestSellingPictures", listBestSellingPictures);
		request.setAttribute("listMostFavoredPictures", listMostFavoredPictures);
		
		String homepage ="index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(homepage);
		dispatcher.forward(request, response);
	}
}
