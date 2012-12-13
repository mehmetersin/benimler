package com.mesoft.webapp.benimler.om;

import org.springframework.social.facebook.api.FacebookProfile;

public class Benimle {

	private int id;

	private String userId;
	private int categoryId;
	private String title;
	private String description;
	private String url;

	private FacebookProfile user;

	public FacebookProfile getUser() {
		return user;
	}

	public void setUser(FacebookProfile user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
