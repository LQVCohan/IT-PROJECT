package com.ecopic.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecopic.dao.CategoryDAO;
import com.ecopic.dao.CustomerDAO;
import com.ecopic.entity.Category;
import com.ecopic.entity.Customer;
import com.ecopic.entity.Picture;

public class CustomerServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private CustomerDAO customerDAO;

	public CustomerServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		customerDAO = new CustomerDAO();
	}

	public void listCustomers() throws ServletException, IOException {
		listCustomers(null);
	}

	public void listCustomers(String message) throws ServletException, IOException {
		List<Customer> listCustomers = customerDAO.listAll();

		if (message != null) {
			request.setAttribute("message", message);
		}
		request.setAttribute("listCustomers", listCustomers);

		String listPageString = "customer.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPageString);
		requestDispatcher.forward(request, response);
	}

	private void updateCustomerFieldsFromForm(Customer customer) {
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String country = request.getParameter("country");

		customer.setEmail(email);
		customer.setFullname(fullName);
		customer.setPassword(password);
		customer.setPhone(phone);
		customer.setAddress(address);
		customer.setCity(city);
		customer.setCountry(country);
	}

	public void createCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);
		String message;

		if (existCustomer != null) {
			message = "Could not created new customer: the email " + email + " already registered by another customer!";
			listCustomers(message);
		} else {

			Customer newCustomer = new Customer();

			updateCustomerFieldsFromForm(newCustomer);

			customerDAO.create(newCustomer);

			message = "New customer has been created successfully!";
			listCustomers(message);
		}
	}

	public void registerCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);
		String message;

		if (existCustomer != null) {
			message = "Could not register: the email " + email + " already registered by another customer!";
			request.setAttribute("message", message);
			String listPageString = "customer-register.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPageString);
			requestDispatcher.forward(request, response);
			return;
		} else {
			Customer newCustomer = new Customer();

			updateCustomerFieldsFromForm(newCustomer);

			customerDAO.create(newCustomer);

			message = "Thank you! You have registered successfully! Please login now!";
		}

		request.setAttribute("message", message);
		String listPageString = "customer-login.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPageString);
		requestDispatcher.forward(request, response);
	}

	public void editCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);
		request.setAttribute("customer", customer);

		String listPageString = "editcustomer.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPageString);
		requestDispatcher.forward(request, response);
	}

	public void updateCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("customerId"));
		String email = request.getParameter("email");
		Customer customerByEmail = customerDAO.findByEmail(email);
		String message;

		if (customerByEmail != null && customerByEmail.getCustomerId() != customerId) {
			message = "Could not update the customer ID " + customerId
					+ " because there's an existing customer having the same email!";
		} else {

			Customer customerById = customerDAO.get(customerId);
			
			updateCustomerFieldsFromForm(customerById);
			
			customerDAO.update(customerById);

			message = "The customer has been updated successfully!";

		}
		listCustomers(message);
	}

	public void deleteCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("idd"));
		String message ="";
		Customer customer = customerDAO.get(customerId);
		if(customer.getPictureOders() != null) {
			message = "Could not delete the customer with ID [%d] because he/she placed orders!";
			message = String.format(message, customerId);
		}else if(customer.getReviews() != null) {
			message = "Could not delete the customer with ID [%d] because he/she posted reviews!";
			message = String.format(message, customerId);
		}else {
			customerDAO.delete(customerId);
			message = "The customer has been deleted successfully!";
		}
		listCustomers(message);
	}

	public void showLogin() throws ServletException, IOException {
		String loginPage = "customer-login.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(loginPage);
		dispatcher.forward(request, response);
	}

	public void doLogin() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Customer customer = customerDAO.checkLogin(email, password);

		if (customer == null) {
			String message = "Login fail. Please check your email and password!";
			request.setAttribute("message", message);
			showLogin();
		} else {
			
			HttpSession session = request.getSession();
			session.setAttribute("loggedCustomer", customer);
			Object objRedirectURL = session.getAttribute("redirectURL");
			
			if(objRedirectURL != null) {
				String redirectURL = (String) objRedirectURL;
				session.removeAttribute("redirectURL");
				response.sendRedirect(redirectURL);
			}else {
				showCustomerProfile();
			}
		}
	}

	public void showCustomerProfile() throws ServletException, IOException {
		String profilePage = "profile.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(profilePage);
		dispatcher.forward(request, response);
	}

	public void showCustomerProfileEditForm() throws ServletException, IOException {
		String profilePage = "edit-profile.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(profilePage);
		dispatcher.forward(request, response);
	}

	public void updateCustomerProfile() throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");

		updateCustomerFieldsFromForm(customer);
		customerDAO.update(customer);
		showCustomerProfile();
	}
}
