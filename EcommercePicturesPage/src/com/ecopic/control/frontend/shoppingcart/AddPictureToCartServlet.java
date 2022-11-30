package com.ecopic.control.frontend.shoppingcart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecopic.dao.PictureDAO;
import com.ecopic.entity.Picture;

@WebServlet("/add_to_cart")
public class AddPictureToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddPictureToCartServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer pictureId = Integer.parseInt(request.getParameter("picture_id"));
		
		Object cartObject = request.getSession().getAttribute("cart");
		ShoppingCart shoppingCart = null;
		if(cartObject != null && cartObject instanceof ShoppingCart) {
			shoppingCart = (ShoppingCart) cartObject;
		}else {
			shoppingCart = new ShoppingCart();
			request.getSession().setAttribute("cart", shoppingCart);
		}
		
		PictureDAO pictureDAO = new PictureDAO();
		Picture picture = pictureDAO.get(pictureId);
		
		shoppingCart.addItem(picture);
		
		String cartPage = request.getContextPath().concat("/view_cart");
		response.sendRedirect(cartPage);
	}

}
