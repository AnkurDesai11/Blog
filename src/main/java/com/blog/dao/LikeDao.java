package com.blog.dao;

import java.sql.*;
import java.util.concurrent.CountDownLatch;

import com.blog.helper.ConnectionProvider;
import com.oracle.wls.shaded.org.apache.xpath.operations.And;

public class LikeDao {
	Connection con;
	
	public LikeDao (Connection con) {
		this.con = con;
	}
	
	public boolean insertLike(int pid, int uid) {
		
		boolean done=false;
		try {
			String query = "insert into likes(pid, uid) values(?,?)";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setInt(1, pid);
			stmt.setInt(2, uid);
			stmt.executeUpdate();
			done = true;
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return done;
	}
	
	public int countLikesOnPost(int pid) {
		int count = -1;
		
		try {
			PreparedStatement stmt = con.prepareStatement("select count(*) from likes where pid=?");
			stmt.setInt(1, pid);
			ResultSet set = stmt.executeQuery();
			if(set.next()) {
				count = set.getInt("count(*)");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return count;
	}
	
	public boolean isLikedByUser(int pid, int uid) {
		boolean done = false;
		try {
			PreparedStatement stmt = con.prepareStatement("select * from likes where pid=? and uid=?");
			stmt.setInt(1, pid);
			stmt.setInt(2, uid);
			ResultSet set = stmt.executeQuery();
			if(set.next()) {
				done = true;
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return done;
	}
	
	public boolean deleteLike(int pid, int uid) {
		boolean done = false;
		try {
			PreparedStatement stmt = con.prepareStatement("delete from likes where pid=? and uid=?");
			stmt.setInt(1, pid);
			stmt.setInt(2, uid);
			stmt.executeUpdate();
			done = true;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return done;
	}
}
