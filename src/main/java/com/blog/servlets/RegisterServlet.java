package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import com.blog.dao.UserDao;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public RegisterServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		PrintWriter out = response.getWriter();
		//fetch all form data
		String check = request.getParameter("userchek");
		if(check==null) {
			out.println("Agree to terms and conditions");
		}
		else {
			String name = request.getParameter("username");
			String email = request.getParameter("usermail");
			String password = request.getParameter("userpass");
			String gender = request.getParameter("usergend");
			String about = request.getParameter("userbout");
			
			User user = new User(name,email,password,gender,about);
			
			//create UserDao object
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			if(dao.saveUser(user)){
				out.println("done");
			}
			else {
				out.println("error");
			}
		}
		
	}

}
