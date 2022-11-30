package com.ecopic.control.frontend.shoppingcart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecopic.entity.Picture;

@WebServlet("/remove_from_cart")
public class RemovePictureFormCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RemovePictureFormCartServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer pictureId = Integer.parseInt(request.getParameter("picture_id"));

		Object cartObject = request.getSession().getAttribute("cart");
		ShoppingCart shoppingCart = (ShoppingCart) cartObject;


		shoppingCart.removeItem(new Picture(pictureId));;

		String cartPage = request.getContextPath().concat("/view_cart");
		response.sendRedirect(cartPage);
	}

}
