package com.bookstore.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Users;

public class UserDAOTest {

	private static EntityManagerFactory entityManagerFactory;
	private static EntityManager entityManager;
	private static UserDAO userDAO;

	@BeforeClass
	public static void setUpClass() {

		 entityManagerFactory = Persistence.createEntityManagerFactory("BookStoreWebsite");
		 entityManager = entityManagerFactory.createEntityManager();

		userDAO = new UserDAO(entityManager);

	}

	@Test
	public void testCreateUsers() {
		Users user1 = new Users();
		user1.setEmail("javadeveloper@codejava.new");
		user1.setFullName("Não tem como");
		user1.setPassword("NTC");

		user1 = userDAO.create(user1);

		assertTrue(user1.getUserId() > 0);

	}

	@Test(expected = PersistenceException.class)
	public void testCreateUsersFieldsNotSet() {
		Users user1 = new Users();

		user1 = userDAO.create(user1);

		

	}
	
	@Test
	
	public void testUpdateUsers() {
		Users user = new Users();
		user.setUserId(1);
		user.setEmail("nam@codejava.net");
		user.setFullName("Não tem como");
		user.setPassword("NTC");
		
		user = userDAO.update(user);
		String expected = "NTC";
		String actual = user.getPassword();
		assertEquals(expected, actual);
	}
	@Test
	public void testGetUsersFound() {
		Integer userId=19;
		Users user=userDAO.get(userId);
		if(user!=null) {
		System.out.println(user.getEmail());
		}
		assertNotNull(user);
		
	}
	
	@Test
	public void testGetUsersNotFound() {
		Integer userId=99;
		Users user=userDAO.get(userId);
		assertNull(user);
		
	}
	
	@Test
	public void testDeleteUsers() {
		Integer userId=20;
		userDAO.delete(userId);
		Users user=userDAO.get(userId);
		assertNull(user);
	}
	
	
	@Test(expected = EntityNotFoundException.class)
	public void testDeleteNonExistUsers() {
		Integer userId=55;
		userDAO.delete(userId);
		
		
	}
	
	@Test
	public void testDeleteNonExistUserswithoutexception() {
		Integer userId=55;
		userDAO.delete(userId);
		
		
	}
	
	@Test
	public void testListAll() {
		List<Users> listUsers=userDAO.listAll();
		
		
		assertTrue(listUsers.size()>0);
	} 
	
	@Test
	public void testCount() {
		long totalUsers=userDAO.count();
		//WE HAVE 3 USERS IN DATABASE TABLE USER
		assertEquals(3, totalUsers);;
		
		
	}
	
	@Test
	public void testFindByEmail() {
		String email = "nam@codejava.new";
		Users  user = userDAO.findByEmail(email);
		
		assertNotNull(user);
	}
	
	
	
	

	@AfterClass
	public static void tearDownClass() {

		entityManager.close();
		entityManagerFactory.close();

	}

}
