package com.bookstore.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.UserServices;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/admin/update_user")
public class UpdateUserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	public UpdateUserServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserServices userServices = new UserServices(request, response);
		userServices.updateUser();
	}

}