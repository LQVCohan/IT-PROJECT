package com.ecopic.service;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecopic.control.frontend.order.SendMail;
import com.ecopic.control.frontend.shoppingcart.ShoppingCart;
import com.ecopic.dao.OrderDAO;
import com.ecopic.dao.PictureDAO;
import com.ecopic.entity.Customer;
import com.ecopic.entity.OrderDetail;
import com.ecopic.entity.Picture;
import com.ecopic.entity.PictureOrder;

public class OrderServices {

	private HttpServletRequest request;
	private HttpServletResponse response;
	private OrderDAO orderDAO;
	private PictureDAO pictureDAO;

	public OrderServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		this.orderDAO = new OrderDAO();
		this.pictureDAO = new PictureDAO();
	}

	public void listAllOrder() throws ServletException, IOException {
		listAllOrder(null);
	}
	
	public void listAllOrder(String message) throws ServletException, IOException {
		List<PictureOrder> listOrder = orderDAO.listAll();

		if(message != null) {
			request.setAttribute("message", message);
		}
		
		request.setAttribute("listOrder", listOrder);

		String listPage = "list_order.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(listPage);
		dispatcher.forward(request, response);
	}

	public void viewOrderDetailForAdmin() throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("id"));

		PictureOrder order = orderDAO.get(orderId);
		request.setAttribute("order", order);

		String detailPage = "order_detail.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(detailPage);
		dispatcher.forward(request, response);
	}

	public void showCheckoutForm() throws ServletException, IOException {
		String checkoutPage = "checkout.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(checkoutPage);
		dispatcher.forward(request, response);
	}

	public void placeOrder() throws ServletException, IOException {
		String recipientName = request.getParameter("recipientName");
		String recipientPhone = request.getParameter("recipientPhone");
		String address = request.getParameter("address");
		String country = request.getParameter("country");
		String city = request.getParameter("city");
		String paymentMethod = request.getParameter("payment");
		String shippingAddress = address + ", " + city + ", " + country;

		PictureOrder order = new PictureOrder();
		order.setRecipientName(recipientName);
		order.setRecipientPhone(recipientPhone);
		order.setShippingAddress(shippingAddress);
		order.setPaymentMethod(paymentMethod);

		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");
		order.setCustomer(customer);

		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
		Map<Picture, Integer> items = shoppingCart.getItems();

		Iterator<Picture> iterator = items.keySet().iterator();

		Set<OrderDetail> orderDetails = new HashSet<OrderDetail>();

		while (iterator.hasNext()) {
			Picture picture = iterator.next();
			Integer quantity = items.get(picture);
			float subtotal = quantity * picture.getPrice();

			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setPicture(picture);
			orderDetail.setPictureOrder(order);
			orderDetail.setQuantity(quantity);
			orderDetail.setSubtotal(subtotal);

			orderDetails.add(orderDetail);
		}

		order.setOrderDetails(orderDetails);
		order.setTotal(shoppingCart.getTotalAmount());

		orderDAO.create(order);
		SendMail.sendMail(order);

		shoppingCart.clear();

		String message = "Thank you. Your order has been received!"
				+ "We will deliver your pictures within a few days.";

		request.setAttribute("message", message);

		String checkoutPage = "thanks.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(checkoutPage);
		dispatcher.forward(request, response);
	}

	public void listOrderByCustomer() throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");

		List<PictureOrder> listOrders = orderDAO.listByCustomer(customer.getCustomerId());
		request.setAttribute("listOrders", listOrders);

		String historyPage = "order_list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(historyPage);
		dispatcher.forward(request, response);
	}

	public void showOrderDetailForCustomer() throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("id"));

		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");
		
		PictureOrder order = orderDAO.get(orderId, customer.getCustomerId());
		request.setAttribute("order", order);

		String detailPage = "order_detail.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(detailPage);
		dispatcher.forward(request, response);
	}

	public void showEditOrderForm() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("id"));
		PictureOrder order = orderDAO.get(orderId);
		List<Picture> listPictures = pictureDAO.listAll();
		HttpSession session = request.getSession();
		
		session.setAttribute("order", order);
		session.setAttribute("listPictures", listPictures);
		
		String editOrderPage = "edit-order.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(editOrderPage);
		dispatcher.forward(request, response);
	}

	public void updateOrder() throws ServletException, IOException {
		HttpSession session = request.getSession();
		PictureOrder order = (PictureOrder) session.getAttribute("order");
		
		String recipientName = request.getParameter("recipientName");
		String recipientPhone = request.getParameter("recipientPhone");
		String shippingAddress = request.getParameter("shippingAddress");
		String paymentMethod = request.getParameter("paymentMethod");
		String orderStatus = request.getParameter("orderStatus");
	
		order.setRecipientName(recipientName);
		order.setRecipientPhone(recipientPhone);
		order.setShippingAddress(shippingAddress);
		order.setPaymentMethod(paymentMethod);
		order.setStatus(orderStatus);
		
		String[] arrayPictureId = request.getParameterValues("pictureId");
		String[] arrayPrice = request.getParameterValues("price");
		String[] arrayQuantity = new String[arrayPictureId.length];
		
		for(int i = 1; i <= arrayQuantity.length; i++) {
			arrayQuantity[i-1] = request.getParameter("quantity"+i);
		}
		
		Set<OrderDetail> orderDetails = order.getOrderDetails();
		orderDetails.clear();
		
		float totalAmount = 0.0f;
		for(int i = 0; i < arrayPictureId.length; i++) {
			int pictureId = Integer.parseInt(arrayPictureId[i]);
			int quantity = Integer.parseInt(arrayQuantity[i]);
			float price = Float.parseFloat(arrayPrice[i]);
			
			float subtotal = price * quantity;
			
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setPicture(new Picture(pictureId));
			orderDetail.setQuantity(quantity);
			orderDetail.setSubtotal(subtotal);
			orderDetail.setPictureOrder(order);
			
			orderDetails.add(orderDetail);
			totalAmount +=subtotal;
		}
		order.setTotal(totalAmount);
		orderDAO.update(order);
		
		String message ="The order " + order.getOrderId() + " has been updated successfully!";
		
		listAllOrder(message);
	}

	public void deleteOrder() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("idd"));
		orderDAO.delete(orderId);
		
		String message = "The order ID " + orderId +" has been deleted successfully!";
		listAllOrder(message);
	}
}
