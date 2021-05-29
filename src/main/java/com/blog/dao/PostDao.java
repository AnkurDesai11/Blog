package com.blog.dao;
import java.sql.*;
import java.util.ArrayList;

import com.blog.entities.Category;
import com.blog.entities.Post;

public class PostDao {
	
	Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> catlist= new ArrayList<Category>();
		
		try {
			String q = "select * from categories";
			Statement ps = this.con.createStatement();
			ResultSet set = ps.executeQuery(q);
			while(set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");
				Category c = new Category(cid, name, description);
				catlist.add(c);
			}
			 
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return catlist;
	}
	
	public boolean savePost(Post post) {
		boolean done = false;
		
		try {
			
			String query = "insert into posts(pTitle, pContent, pAltcontent, pPic, catId, userId) values(?,?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, post.getpTitle());
			stmt.setString(2, post.getpContent());
			stmt.setString(3, post.getpAltcontent());
			stmt.setString(4, post.getpPic());
			stmt.setInt(5, post.getCatId());
			stmt.setInt(6, post.getUserId());
			stmt.executeUpdate();
			done=true;
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return done;
	}
}
