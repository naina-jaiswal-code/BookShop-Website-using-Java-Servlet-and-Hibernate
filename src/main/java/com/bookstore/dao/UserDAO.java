package com.bookstore.dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.bookstore.entity.Users;

public class UserDAO extends JpaDAO<Users> implements GenericDAO<Users> {

	public UserDAO(EntityManager entityManager) {
		super();

	}

	public Users create(Users user) {
		return super.create(user);
	}

	@Override
	public Users update(Users user) {

		return super.update(user);
	}

	public Users findByEmail(String email) {
		//"email" refer to query =:email"
		List<Users> listUsers= super.findWithNamedQuery("Users.findByEmail","email",email);
		if(listUsers!=null && listUsers.size()>0) {
			return listUsers.get(0);
		}
		return null;
		 
		
		
	}

	@Override
	public Users get(Object userId) {
		return super.find(Users.class, userId);
	}

	@Override
	public void delete(Object userId) {
		super.delete(Users.class, userId);

	}

	@Override
	public List<Users> listAll() {
		return super.findWithNamedQuery("User.findAll");
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}

}
