package com.ecopic.control.admin.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecopic.dao.PictureDAO;
import com.ecopic.entity.OrderDetail;
import com.ecopic.entity.Picture;
import com.ecopic.entity.PictureOrder;

@WebServlet("/admin/add_picture_to_order")
public class AddPictureToOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddPictureToOrderServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pictureId = Integer.parseInt(request.getParameter("pictureId"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		PictureDAO pictureDAO = new PictureDAO();
		Picture picture = pictureDAO.get(pictureId);
		
		HttpSession session = request.getSession();
		PictureOrder pictureOrder = (PictureOrder) session.getAttribute("order");
		
		float subtotal = quantity * picture.getPrice();
		
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setPicture(picture);
		orderDetail.setQuantity(quantity);
		orderDetail.setSubtotal(subtotal);

		float newTotal = pictureOrder.getTotal() + subtotal;
		pictureOrder.setTotal(newTotal);
		
		pictureOrder.getOrderDetails().add(orderDetail);
		
		String message = "The picture " + picture.getTitle()+ " has been added to the order ID " + pictureOrder.getOrderId();
		request.setAttribute("message", message);
		
		String resultPage = "edit-order.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(resultPage);
		dispatcher.forward(request, response);
	}

}
