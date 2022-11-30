package com.ecopic.service;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.eclipse.persistence.jaxb.xmlmodel.XmlElementNillable;

import com.ecopic.control.admin.picture.ListPictureServlet;
import com.ecopic.dao.CategoryDAO;
import com.ecopic.dao.PictureDAO;
import com.ecopic.dao.ReviewDAO;
import com.ecopic.entity.Category;
import com.ecopic.entity.Customer;
import com.ecopic.entity.Picture;
import com.ecopic.entity.Review;

public class PictureService {

	private HttpServletRequest request;
	private HttpServletResponse response;
	private PictureDAO pictureDAO;
	private CategoryDAO categoryDAO;
	private ReviewDAO reviewDAO;

	public PictureService(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		pictureDAO = new PictureDAO();
		categoryDAO = new CategoryDAO();
		reviewDAO = new ReviewDAO();
	}

	public void listPictures() throws ServletException, IOException {
		listPictures(null);
	}

	public void listPictures(String message) throws ServletException, IOException {
		List<Picture> listPictures = pictureDAO.listAll();
		request.setAttribute("listPictures", listPictures);
		List<Category> listCategories = categoryDAO.listAll();
		request.setAttribute("listCategories", listCategories);

		if (message != null) {
			request.setAttribute("message", message);
		}

		String listPageString = "product.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPageString);
		requestDispatcher.forward(request, response);
	}

	public void createPictures() throws ParseException, ServletException, IOException {
		String title = request.getParameter("title");

		Picture existPicture = pictureDAO.findByTitle(title);

		if (existPicture != null) {
			String message = "Could not create new picture because the title '" + title + "' already exists.";
			listPictures(message);
			return;
		}

		Picture newPicture = new Picture();
		readPictureFields(newPicture);

		Picture createdPicture = pictureDAO.create(newPicture);

		if (createdPicture.getPictureId() > 0) {
			String message = "A new picture has been created successfully!";
			listPictures(message);
		}
	}

	public void readPictureFields(Picture picture) throws ServletException, IOException {
		Integer categoryId = Integer.parseInt(request.getParameter("category"));
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		Float price = Float.parseFloat(request.getParameter("price"));
		String description = request.getParameter("description");

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date publishDate = null;
		try {
			publishDate = dateFormat.parse(request.getParameter("publishDate"));
		} catch (ParseException e) {
			e.printStackTrace();
			throw new ServletException("Error parsing publish date!");
		}
		picture.setTitle(title);
		picture.setAuthor(author);
		picture.setDescription(description);
		picture.setPublishDate(publishDate);
		picture.setPrice(price);

		Category category = categoryDAO.get(categoryId);
		picture.setCategory(category);

		Part part = request.getPart("image");

		if (part != null && part.getSize() > 0) {
			long size = part.getSize();
			byte[] imageBytes = new byte[(int) size];
			InputStream inputStream = part.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();

			picture.setImage(imageBytes);
		}
	}

	public void editPicture() throws ServletException, IOException {
		Integer pictureId = Integer.parseInt(request.getParameter("id"));
		Picture picture = pictureDAO.get(pictureId);
		List<Category> listCategories = categoryDAO.listAll();
		request.setAttribute("listCategories", listCategories);
		request.setAttribute("picture", picture);
		String listPageString = "editpicture.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPageString);
		requestDispatcher.forward(request, response);
	}

	public void updatePicture() throws ServletException, IOException {
		Integer pictureId = Integer.parseInt(request.getParameter("id"));

		Picture existPicture = pictureDAO.get(pictureId);

		String title = request.getParameter("title");

		Picture pictureByTitle = pictureDAO.findByTitle(title);

		if (pictureByTitle != null && !existPicture.equals(pictureByTitle)) {
			String message = "Could not update picture because there's another picture having same title!";
			listPictures(message);
			return;
		}

		readPictureFields(existPicture);

		pictureDAO.update(existPicture);

		String message = "The picture (ID: %d) has been updated successfully!";
		message = String.format(message, pictureId);
		listPictures(message);
	}

	public void deletePicture() throws ServletException, IOException {
		Integer pictureId = Integer.parseInt(request.getParameter("idd"));
		String message ="";
		Picture picture = pictureDAO.get(pictureId);
		if(picture.getOderDetails() != null) {
			message = "Could not delete the picture with ID [%d] because there are orders associated with it!";
			message = String.format(message, pictureId);
		}else if(picture.getReviews() != null) {
			message = "Could not delete the picture with ID [%d] because it has reviews!";
			message = String.format(message, pictureId);
		}else {
			pictureDAO.delete(pictureId);
			message = "The picture (ID: %d) has been deleted successfully!";
			message = String.format(message, pictureId);
		}
		listPictures(message);
	}

	public void listPicturesByCategory() throws ServletException, IOException {
		List<Picture> lisPictures = null;
		int categoryId;
		Category category = null;

		PictureDAO pictureDAO = new PictureDAO();

		Integer offset = 1;
		if (request.getParameter("offset") != null) {
			offset = Integer.parseInt(request.getParameter("offset"));
		}
		request.setAttribute("currentPage", offset);
		
		long countPictures = 0;
		
		if (request.getParameter("id") != null) {
			categoryId = Integer.parseInt(request.getParameter("id"));
			lisPictures = pictureDAO.listByCategory(categoryId, 8, offset * 8);
			category = categoryDAO.get(categoryId);
			request.setAttribute("category", category);
			request.setAttribute("currentId", categoryId);
			countPictures = pictureDAO.countByCategory(categoryId)/8;
			if (pictureDAO.countByCategory(categoryId)%8 != 0) {
				countPictures++;
			}
		} else {
			lisPictures = pictureDAO.listOffsetPictures(8, offset * 8);
			countPictures = pictureDAO.count()/8;
			if (pictureDAO.count()%8 != 0) {
				countPictures++;
			}
		}
			
		request.setAttribute("countPictures", countPictures);

		request.setAttribute("lisPictures", lisPictures);

		String listPageString = "shop.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPageString);
		requestDispatcher.forward(request, response);

	}

	public void viewPictureDetail() throws ServletException, IOException {
		Integer pictureId = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		Picture picture = pictureDAO.get(pictureId);

		session.setAttribute("picture", picture);
		Review existReview = null;
		Customer customer = (Customer) session.getAttribute("loggedCustomer");
		if (customer != null) {
			existReview = reviewDAO.findByCustomerAndPicture(customer.getCustomerId(), pictureId);
		}

		request.setAttribute("existReview", existReview);

		String redirectURL = request.getRequestURI().toString();
		String query = request.getQueryString();
		if (query != null) {
			redirectURL = redirectURL.concat("?").concat(query);
		}

		session.setAttribute("redirectURL", redirectURL);

		String listPageString = "detail.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPageString);
		requestDispatcher.forward(request, response);
	}

	public void search() throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		List<Picture> resultList = null;
		if (keyword.equals("")) {
			resultList = pictureDAO.listAll();
		} else {
			resultList = pictureDAO.search(keyword);
		}
		request.setAttribute("lisPictures", resultList);
		request.setAttribute("keyword", keyword);

		String listPageString = "shop.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPageString);
		requestDispatcher.forward(request, response);

	}
}
