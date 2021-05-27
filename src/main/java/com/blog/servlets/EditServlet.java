package com.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.Helper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class EditServlet
 */
@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public EditServlet() {
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
		//fetch data
		String name = request.getParameter("username");
		String email = request.getParameter("usermail");
		String password = request.getParameter("userpass");
		String gender = request.getParameter("usergend");
		String about = request.getParameter("userbout");
		Part part = request.getPart("userfile");
		String profile = part.getSubmittedFileName();
		
		HttpSession ses = request.getSession();
		User user = (User)ses.getAttribute("currentUser");
		
		String oldprofile = user.getProfile();
		//use hardcoded path in eclipse as with eclipse the Tomcat server runs in .metadata folder hence files get uploaded there
		//String realPath = request.getServletContext().getRealPath("/"); -- use this normally, use below path for eclipse 
		//String realPath = "";
		
		if( profile==null || profile=="") {
			profile = oldprofile;
		}
		
		//get user from session
		
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setGender(gender);
		user.setAbout(about);
		user.setProfile(profile);
		
		//update database
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		//boolean isdone = dao.updateUser(user);
		if(dao.updateUser(user)) {
			if(profile.equals("default.png") || oldprofile.equals(profile)) {
				//out.println("Details updated successfully");
				Message msg = new Message("Details updated successfully", "success", "alert-success");
				ses.setAttribute("editmsg", msg);
			}
			else {
				if(oldprofile.equals("default.png")) {
					String path = request.getSession().getServletContext().getRealPath("/")+"profilepics"+File.separator+user.getProfile();
					if(Helper.saveFile(part.getInputStream(), path)) {
						//out.println("Details updated successfully");
						Message msg = new Message("Details updated successfully", "success", "alert-success");
						ses.setAttribute("editmsg", msg);
					}
					else {
						//out.println("Error uploading profile pic");
						Message msg = new Message("Error uploading profile pic", "error", "alert-danger");
						ses.setAttribute("editmsg", msg);
					}
				}
				else {
					String path = request.getSession().getServletContext().getRealPath("/")+"profilepics"+File.separator+user.getProfile();
					String oldpath = request.getSession().getServletContext().getRealPath("/")+"profilepics"+File.separator+oldprofile;
					Helper.deleteFile(oldpath);
					if(Helper.saveFile(part.getInputStream(), path)) {
						//out.println("Details updated successfully");
						Message msg = new Message("Details updated successfully", "success", "alert-success");
						ses.setAttribute("editmsg", msg);
					}
					else {
						//out.println("Error uploading profile pic");
						Message msg = new Message("Error uploading profile pic", "error", "alert-danger");
						ses.setAttribute("editmsg", msg);
					}
				}
				
			}
			
		}
		else {
			//out.println("Error");
			Message msg = new Message("Error while updating details", "error", "alert-danger");
			ses.setAttribute("editmsg", msg);
		}
		
		response.sendRedirect("profile.jsp");
	}

}
