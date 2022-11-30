package com.ecopic.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.ecopic.entity.Customer;
import com.ecopic.entity.Picture;
import com.ecopic.entity.Review;

public class ReviewDAOTest {

	private static ReviewDAO reviewDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		reviewDAO = new ReviewDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		reviewDAO.close();
	}

	@Test
	public void testCreateReview() {
		Review review = new Review();
		Picture picture = new Picture();
		Customer customer = new Customer();
		picture.setPictureId(2);
		customer.setCustomerId(21);
		
		review.setPicture(picture);
		review.setCustomer(customer);
		
		review.setHeadline("This is a very good picture!");
		review.setRating(5);
		review.setComment("I have just watch this picture. Very good!");
		
		Review savedReview = reviewDAO.create(review);
		
		assertTrue(savedReview.getReviewId()>0);
	}

	@Test
	public void testUpdateReview() {
		Integer reviewId= 1;
		Review review = reviewDAO.get(reviewId);
		
		review.setHeadline("Exellent picture");
		
		Review updatedReview = reviewDAO.update(review);
		
		assertEquals(review.getHeadline(), updatedReview.getHeadline());
	}

	@Test
	public void testGet() {
		Integer reviewId= 1;
		Review review = reviewDAO.get(reviewId);
		
		assertNotNull(review);
	}

	@Test
	public void testDeleteObject() {
		int reviewId = 2;
		reviewDAO.delete(reviewId);
		
		Review review = reviewDAO.get(reviewId);
		
		assertNull(review);
	}

	@Test
	public void testListAll() {
		List<Review> listReviews = reviewDAO.listAll();
		
		for(Review review : listReviews) {
			System.out.println(review.getReviewId() +" - "+review.getPicture().getTitle()
					+" - "+review.getCustomer().getFullname()
					+" - "+review.getHeadline()+" - "+review.getRating());
		}
		
		assertTrue(listReviews.size()>0);
	}

	@Test
	public void testCount() {
		long totalReview = reviewDAO.count();
		
		assertTrue(totalReview>0);
	}
	
	@Test
	public void testFindByCustomerAndPictureNotFound() {
		Integer customerId = 13;
		Integer pictureId = 2;
		
		Review result = reviewDAO.findByCustomerAndPicture(customerId, pictureId);
		
		assertNotNull(result);
	}

}
