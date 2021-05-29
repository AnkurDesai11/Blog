package com.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.blog.dao.PostDao;
import com.blog.entities.Post;
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
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AddPostServlet() {
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
		int cid= Integer.parseInt(request.getParameter("cid"));
		String pTitle= request.getParameter("pTitle");
		String pContent= request.getParameter("pContent");
		String pAltcontent= request.getParameter("pAltcontent");
		Part file= request.getPart("pPic");
		//out.println(pTitle);
		//getting current user id
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		//creating new post
		Post post = new Post(pTitle, pContent, pAltcontent, file.getSubmittedFileName(), null, cid, user.getId());
		PostDao pDao = new PostDao(ConnectionProvider.getConnection());
		if(pDao.savePost(post)) {
			String path = request.getSession().getServletContext().getRealPath("/")+"postpics"+File.separator+file.getSubmittedFileName();
			if(Helper.saveFile(file.getInputStream(), path)) {
				out.println("done");
			}else {
				out.println("FIle not uploaded, rest post is saved");
			}
		}
		else {
			out.println("error");
		}
	}

}
