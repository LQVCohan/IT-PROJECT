package com.ecopic.control.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecopic.dao.CustomerDAO;
import com.ecopic.dao.OrderDAO;
import com.ecopic.dao.PictureDAO;
import com.ecopic.dao.ReviewDAO;
import com.ecopic.dao.UserDAO;
import com.ecopic.entity.PictureOrder;
import com.ecopic.entity.Review;

@WebServlet("/admin/")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminServlet() {
        super();
    }
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrderDAO orderDAO = new OrderDAO();
		List<PictureOrder> listMostRecentSales = orderDAO.listMostRecentSales();
		long totalOrders = orderDAO.count();
		
		ReviewDAO reviewDAO = new ReviewDAO();
		List<Review> listMostRecentReviews = reviewDAO.listMostRecent();
		long totalReviews = reviewDAO.count();
		
		PictureDAO pictureDAO = new PictureDAO();
		long totalPictures = pictureDAO.count();
		
		UserDAO userDAO = new UserDAO();
		long totalUsers = userDAO.count();
		
		CustomerDAO customerDAO = new CustomerDAO();
		long totalCustomers = customerDAO.count();
		
		
		request.setAttribute("listMostRecentSales", listMostRecentSales);
		request.setAttribute("listMostRecentReviews", listMostRecentReviews);
		request.setAttribute("totalUsers", totalUsers);
		request.setAttribute("totalPictures", totalPictures);
		request.setAttribute("totalCustomers", totalCustomers);
		request.setAttribute("totalReviews", totalReviews);
		request.setAttribute("totalOrders", totalOrders);
		
		String homepage ="index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(homepage);
		dispatcher.forward(request, response);
	}
}
