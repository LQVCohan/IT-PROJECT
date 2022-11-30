package com.ecopic.control.admin.order;

import java.io.IOException;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecopic.entity.OrderDetail;
import com.ecopic.entity.PictureOrder;

@WebServlet("/admin/remove_picture_from_order")
public class RemovePictureFromOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RemovePictureFromOrderServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pictureId = Integer.parseInt(request.getParameter("idd"));
		
		HttpSession session = request.getSession();
		PictureOrder order = (PictureOrder) session.getAttribute("order");
		
		Set<OrderDetail> orderDetails = order.getOrderDetails();
		Iterator<OrderDetail> iterator = orderDetails.iterator();
		
		while(iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if ( orderDetail.getPicture().getPictureId() == pictureId) {
				float newTotal = order.getTotal()-orderDetail.getSubtotal(); 
				order.setTotal(newTotal);
				iterator.remove();
			}
		}
		String resultPage = "edit-order.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(resultPage);
		dispatcher.forward(request, response);
	}

}
