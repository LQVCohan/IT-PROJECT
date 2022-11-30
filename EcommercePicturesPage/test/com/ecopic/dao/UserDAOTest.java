package com.ecopic.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.ecopic.entity.Users;

public class UserDAOTest{
	
	private static UserDAO userDAO;
	
	@BeforeClass
	public static void setUpClass() throws Exception {
		userDAO = new UserDAO();
	}
	
	@Test
	public void testCreateUsers() {
		Users user1 = new Users();
		user1.setEmail("admin2@gmail.com");
		user1.setFullName("admin2");
		user1.setPassword("123456");
		
		user1= userDAO.create(user1);
		
		assertTrue(user1.getUserId()>0);
	}
	
	@Test(expected = PersistenceException.class)
	public void testCreateUsersFieldsNotSet(){
		Users user1 = new Users();
		user1= userDAO.create(user1);
	}
	
	@Test
	public void testUpdateUsers() {
		Users users = new Users();
		users.setUserId(2);
		users.setEmail("elsa@gmail.com");
		users.setFullName("Eo sà");
		users.setPassword("elsaxauxi");
		
		users = userDAO.update(users);
		String expected = "elsaxauxi";
		String actual = users.getPassword();
		
		assertEquals(expected, actual);
	}
	
	@Test
	public void testGetUsersFound() {
		Integer userId = 1;
		Users user = userDAO.get(userId); 	
		System.out.println(user.getEmail());
		assertNotNull(user);
	}
	
	@Test
	public void testDeleteUsers() {
		Integer userID = 4;
		userDAO.delete(userID);
		Users users = userDAO.get(userID);
		
		assertNull(users);
	}
	
	@Test(expected = EntityNotFoundException.class)
	public void testDeleteNonExistUsers() {
		Integer userID = 44;
		userDAO.delete(userID);
	}
	
	@Test
	public void testListAll() {
		List<Users> listUsers = userDAO.listAll();
		
		for(Users user : listUsers) {
			System.out.println(user.getEmail());
		}
		
		assertTrue(listUsers.size() > 0);
	}
	
	@Test
	public void testCount() {
		long totalUsers = userDAO.count();
		assertEquals(1,totalUsers);
	}
	
	@Test
	public void findEmail() {
		String email = "mthanhtai@gmail.com";
		Users user = userDAO.findByEmail(email);
		
		assertNotNull(user);
	}
	
	@Test
	public void testCheckLogin() {
		String emailString="okhongdo@gmail.com";
		String pasString="1234561";
		boolean checkLogin = userDAO.checkLogin(emailString, pasString);
		
		assertTrue(checkLogin);
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		userDAO.close();
	}
}
