package com.ecopic.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.ecopic.entity.Customer;

public class CustomerDAOTest {

	private static CustomerDAO customerDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		customerDAO = new CustomerDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		customerDAO.close();
	}

	@Test
	public void testCreateCustomer() {
		Customer customer = new Customer();
		customer.setEmail("user11@gmail.com");
		customer.setFullname("Mai Bảo Long");
		customer.setCity("Ho Chi Minh");
		customer.setCountry("Viet Nam");
		customer.setAddress("261/15/47 Dinh Phong Phu, Tang Nhon Phu B");
		customer.setPassword("123456");
		customer.setPhone("0943602574");
		Customer savedCustomer = customerDAO.create(customer);
		
		assertTrue(savedCustomer.getCustomerId() > 0);
	}

	@Test
	public void testGet() {
		Integer customerId = 1;
		Customer customer = customerDAO.get(customerId);
		
		assertNotNull(customer);
	}
	
	@Test
	public void testUpdateCustomer() {
		Customer customer = customerDAO.get(1);
		String fullName = "Desyurin";
		customer.setFullname(fullName);
		
		Customer updateCustomer = customerDAO.update(customer);
		
		assertTrue(updateCustomer.getFullname().equals(fullName));
	}

	@Test
	public void testDeleteObject() {
		customerDAO.delete(1);
		Customer customer = customerDAO.get(1);
		
		assertNull(customer);
	}
	
	@Test
	public void testListAll() {
		List<Customer> listCustomers = customerDAO.listAll();
		
		for(Customer customer : listCustomers) {
			System.out.println(customer.getFullname());
		}
		
		assertFalse(listCustomers.isEmpty());
	}
	
	@Test
	public void testCheckLogin() {
		String email="admin@gmail.com";
		String password="123456";
		
		Customer result = customerDAO.checkLogin(email, password);
		 assertNotNull(result);
	}
	
	@Test
	public void testCount() {
		long total = customerDAO.count();
		assertEquals(1, total);
	}
	
	@Test
	public void testFindByEmail() {
		String email = "user11@gmail.com";
		Customer customer = customerDAO.findByEmail(email);
		
		assertNotNull(customer);
	}

}
