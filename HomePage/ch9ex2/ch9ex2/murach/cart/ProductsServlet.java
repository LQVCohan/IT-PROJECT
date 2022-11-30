package ch9ex2.murach.cart;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.util.ArrayList;

import ch9ex2.murach.data.ProductIO;
import ch9ex2.murach.business.Product;

@WebServlet("/ch9_ex2/loadProducts")
public class ProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String path = getServletContext().getRealPath("/ch9_ex2/WEB-INF/products.txt");
        ArrayList<Product> products = ProductIO.getProducts(path);
        session.setAttribute("products", products);

        String url = "/ch9_ex2/index.jsp";
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
}
