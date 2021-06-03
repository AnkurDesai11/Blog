package com.blog.servlets;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;

import com.blog.dao.LikeDao;
import com.blog.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LikeServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		//String operation = request.getParameter("operation");
		int uid = Integer.parseInt(request.getParameter("uid"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		LikeDao lDao = new LikeDao(ConnectionProvider.getConnection());
		//out.println("Here");
		boolean done = false;
		if(lDao.isLikedByUser(pid, uid)) {
			done = lDao.deleteLike(pid, uid);
			if(done) {
				out.println("unliked");
			}
			else {
				out.println("error");
			}
		}
		else {
			done = lDao.insertLike(pid, uid);
			if(done) {
				out.println("liked");
			}
			else {
				out.println("error");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
