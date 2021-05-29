package com.blog.entities;

import java.sql.*;

public class Post {
	private int pid;
	private String pTitle;
	private String pContent;
	private String pAltcontent;
	private String pPic;
	private Timestamp pDate;
	private int catId;
	private int userId;
	
	public Post() {
	}

	public Post(int pid, String pTitle, String pContent, String pAltcontent, String pPic, Timestamp pDate, int catId, int userId) {
		this.pid = pid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pAltcontent = pAltcontent;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
		this.userId = userId;
	}

	public Post(String pTitle, String pContent, String pAltcontent, String pPic, Timestamp pDate, int catId, int userId) {
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pAltcontent = pAltcontent;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
		this.userId = userId;
	}

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	 * @return the pid
	 */
	public int getPid() {
		return pid;
	}

	/**
	 * @param pid the pid to set
	 */
	public void setPid(int pid) {
		this.pid = pid;
	}

	/**
	 * @return the pTitle
	 */
	public String getpTitle() {
		return pTitle;
	}

	/**
	 * @param pTitle the pTitle to set
	 */
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	/**
	 * @return the pContent
	 */
	public String getpContent() {
		return pContent;
	}

	/**
	 * @param pContent the pContent to set
	 */
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	/**
	 * @return the pAltcontent
	 */
	public String getpAltcontent() {
		return pAltcontent;
	}

	/**
	 * @param pAltcontent the pAltcontent to set
	 */
	public void setpAltcontent(String pAltcontent) {
		this.pAltcontent = pAltcontent;
	}

	/**
	 * @return the pPic
	 */
	public String getpPic() {
		return pPic;
	}

	/**
	 * @param pPic the pPic to set
	 */
	public void setpPic(String pPic) {
		this.pPic = pPic;
	}

	/**
	 * @return the pDate
	 */
	public Timestamp getpDate() {
		return pDate;
	}

	/**
	 * @param pDate the pDate to set
	 */
	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}

	/**
	 * @return the catId
	 */
	public int getCatId() {
		return catId;
	}

	/**
	 * @param catId the catId to set
	 */
	public void setCatId(int catId) {
		this.catId = catId;
	}
	
	
}
