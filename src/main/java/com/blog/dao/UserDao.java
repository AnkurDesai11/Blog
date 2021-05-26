package com.blog.dao;
import java.sql.*;

import com.blog.entities.User;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		//super();
		this.con = con;
	}
	
	
	//insert user to database
	public boolean saveUser(User user) {
		
		boolean done=false;
		
		try {
			
			
			String queryString = "insert into users(name, email, password, gender, about) values(?,?,?,?,?)";
			PreparedStatement psmnt = this.con.prepareStatement(queryString);
			psmnt.setString(1, user.getName());
			psmnt.setString(2, user.getEmail());
			psmnt.setString(3, user.getPassword());
			psmnt.setString(4, user.getGender());
			psmnt.setString(5, user.getAbout());
			psmnt.executeUpdate();
			done=true;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return done;
		
	}
	
	public User getUserByEmailAndPassword(String email, String password) {
		
		User user = null;
		
		try {
			
			String query = "select * from users where email =? and password =?";
			PreparedStatement psmnt = con.prepareStatement(query);
			psmnt.setString(1, email);
			psmnt.setString(2, password);
			
			ResultSet set = psmnt.executeQuery();
			
			if(set.next()) {
				user = new User();
				user.setName(set.getString("name")); 
				user.setEmail(set.getString("email")); 
				user.setPassword(set.getString("password")); 
				user.setGender(set.getString("gender")); 
				user.setAbout(set.getString("about")); 
				user.setId(set.getInt("id")); 
				user.setDateTime(set.getTimestamp("rdate")); 
				user.setProfile(set.getString("profile")); 
				
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return user;
		
	}
}
