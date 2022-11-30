package com.ecopic.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecopic.dao.ReviewDAO;
import com.ecopic.entity.Customer;
import com.ecopic.entity.Picture;
import com.ecopic.entity.Review;

public class ReviewServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private ReviewDAO reviewDAO;
	
	public ReviewServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		this.reviewDAO = new ReviewDAO();
	}
	
	public void listAllReview() throws ServletException, IOException {
		listAllReview(null);
	}
	
	public void listAllReview(String message) throws ServletException, IOException {
		List<Review> listReviews = reviewDAO.listAll();
		
		request.setAttribute("listReviews", listReviews);
		
		if(message != null) {
			request.setAttribute("message", message);
		}
		
		String reviewPage = "review_list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(reviewPage);
		dispatcher.forward(request, response);
	}

	public void editReview() throws ServletException, IOException {
		Integer reviewId = Integer.parseInt(request.getParameter("id"));
		Review review = reviewDAO.get(reviewId);
		
		request.setAttribute("review", review);
		
		String editPage = "edit-review.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(editPage);
		dispatcher.forward(request, response);
	}

	public void updateReview() throws ServletException, IOException {
		Integer reviewId = Integer.parseInt(request.getParameter("reviewId"));
		Review review = reviewDAO.get(reviewId);
		
		String headline = request.getParameter("headline");
		String comment = request.getParameter("comment");
		
		review.setHeadline(headline);
		review.setComment(comment);

		reviewDAO.update(review);
		
		String message="The review has been updated successfully!";
		
		listAllReview(message);
	}

	public void deleteReview() throws ServletException, IOException {
		Integer reviewId = Integer.parseInt(request.getParameter("idd"));
		reviewDAO.delete(reviewId);
		
		String message="The review has been deleted successfully!";
		
		listAllReview(message);
	}

	public void submitReview() throws ServletException, IOException {
		Integer pictureId = Integer.parseInt(request.getParameter("pictureId"));
		Integer rating = Integer.parseInt(request.getParameter("rating"));
		String headline = request.getParameter("headline");
		String comment = request.getParameter("comment");
		
		Review newReview =  new Review();
		newReview.setHeadline(headline);
		newReview.setComment(comment);
		newReview.setRating(rating);
	
		Picture picture = new Picture();
		picture.setPictureId(pictureId);
		newReview.setPicture(picture);
		
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
		newReview.setCustomer(customer);
		
		reviewDAO.create(newReview);

		HttpSession session = request.getSession();
		Object objRedirectURL = session.getAttribute("redirectURL");
		
		String redirectURL = (String) objRedirectURL;
		session.removeAttribute("redirectURL");
		response.sendRedirect(redirectURL);
	}
}
