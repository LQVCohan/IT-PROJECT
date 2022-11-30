package com.ecopic.service;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecopic.dao.CategoryDAO;
import com.ecopic.dao.PictureDAO;
import com.ecopic.entity.Category;
import com.ecopic.entity.Users;


public class CategoryServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private CategoryDAO categoryDAO;
	
	public CategoryServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		categoryDAO = new CategoryDAO();
	}
	
	public void listCategory() throws ServletException, IOException {
		listCategory(null);
	}
	
	public void listCategory(String message) throws ServletException, IOException {
		List<Category> listCategory = categoryDAO.listAll();
		
		request.setAttribute("listCategory", listCategory);
		
		if(message != null) {
			request.setAttribute("message", message);
		}
		
		String listPage = "categorytables.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		
		requestDispatcher.forward(request,response);
	}
	
	public void createCategory() throws ServletException, IOException {
		String name = request.getParameter("namee");
		
		Category existCategory = categoryDAO.findByName(name);
		if(existCategory != null) {
			String messageString = "Could not create category. A category with name " 
									+ name + " already exists!"	;
			listCategory(messageString);
		}else {
			Category newCategory = new Category(name);
			categoryDAO.create(newCategory); 
			String messageString = "New category created successfully!";
			listCategory(messageString);
		}
	}
	
	public void editCategory() throws ServletException, IOException {
		int catID = Integer.parseInt(request.getParameter("id")) ;
		String name = request.getParameter("name");
		
		Category catById = categoryDAO.get(catID);
		Category catByName = categoryDAO.findByName(name);
		
		if(catByName != null && catByName.getCategoryId()!= catById.getCategoryId())
		{
			String message = "Could not update category. Category with name " + name + " already exists!";
			listCategory(message);
		}else {
			Category category = new Category(catID, name);
			categoryDAO.update(category);
		
			String message = "Category has been updated successfully!";
			listCategory(message);
		}
	}

	public void deleteCategory() throws ServletException, IOException {
		int catID = Integer.parseInt(request.getParameter("idd")) ;
		PictureDAO pictureDAO = new PictureDAO();
		long numOfPicture = pictureDAO.countByCategory(catID);
		String message;
		if(numOfPicture > 0) {
			message = "Could not delete the category (ID: %d) because it currently contains some picture!";
			message = String.format(message, catID);
		}else {
			categoryDAO.delete(catID);
		
			message = "Category has been delete successfully!";
		}
		
		listCategory(message);
	}
	
}
