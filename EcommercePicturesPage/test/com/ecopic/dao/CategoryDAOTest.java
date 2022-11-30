package com.ecopic.dao;

import static org.junit.Assert.*;

import java.util.List;


import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.ecopic.entity.Category;


public class CategoryDAOTest {

	private static CategoryDAO categoryDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		categoryDAO = new CategoryDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		categoryDAO.close();
	}

	@Test
	public void testCreateCategory() {
		Category newCategory = new Category("Tranh hoạt hình");
		Category category = categoryDAO.create(newCategory);
		assertTrue(category != null && category.getCategoryId()>0 );
	}

	@Test
	public void testUpdateCategory() {
		Category category = new Category("Java Core");
		category.setCategoryId(1);
		
		Category categoryupdate = categoryDAO.update(category);
		
		assertEquals(category.getName(), categoryupdate.getName());
	}

	@Test
	public void testGet() {
		Integer catId = 4;
		Category cat = categoryDAO.get(catId);
		
		assertNotNull(cat);
	}

	@Test
	public void testDeleteObject() {
		Integer catId = 2;
		categoryDAO.delete(catId);
		
		Category cat = categoryDAO.get(catId);
		
		assertNull(cat);
	}

	@Test
	public void testListAll() {
		List<Category> listCategory = categoryDAO.listAll();
		
		listCategory.forEach(c -> System.out.println(c.getName() + ", "));
		
		assertTrue(listCategory.size()>0);
	}

	@Test
	public void testCount() {
		long totalCat = categoryDAO.count();
		
		assertEquals(4,totalCat);
	}
	
	@Test
	public void testFindByName() {
		String nameString="Java Core";
		Category category = categoryDAO.findByName(nameString);
		
		assertNotNull(category);
	}

}
