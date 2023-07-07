package com.bookstore.entity;

import javax.persistence.Column;
import javax.persistence.Entity; //JPA specification
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity // specifying that this class is mapped to the table in the DB
@NamedQueries({ @NamedQuery(name = "User.findAll", query = "SELECT u FROM Users u ORDER by u.fullName"),
		@NamedQuery(name = "Users.findByEmail", query = "SELECT u FROM Users u WHERE u.email = :email"),
		@NamedQuery(name = "User.countAll", query = "SELECT Count(*) FROM Users u") })
public class Users { // User is reserved word in my SQL

	private Integer userId;
	private String email;
	private String fullName;
	private String password;

	// these fields are mapped to the columns table in DB

	@Column(name = "user_id")
	@Id // primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) // auto-increcment, Identity-(uniqe at the table level)
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "full_name")
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Users() {

	}

	public Users(String email, String fullName, String password) {
		super();
		this.email = email;
		this.fullName = fullName;
		this.password = password;
	}

}