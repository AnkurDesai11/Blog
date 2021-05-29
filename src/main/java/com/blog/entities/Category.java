package com.blog.entities;

public class Category {
	private int cid;
	private String name;
	private String description;
	
	public Category(int cid, String name, String description) {
		//super();
		this.cid = cid;
		this.name = name;
		this.description = description;
	}

	public Category(String name, String description) {
		//super();
		this.name = name;
		this.description = description;
	}

	public Category() {
		//super();
	}

	/**
	 * @return the cid
	 */
	public int getCid() {
		return cid;
	}

	/**
	 * @param cid the cid to set
	 */
	public void setCid(int cid) {
		this.cid = cid;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
