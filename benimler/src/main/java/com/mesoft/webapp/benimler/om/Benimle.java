package com.mesoft.webapp.benimler.om;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.social.facebook.api.FacebookProfile;

public class Benimle {

	private int id;

	private String userId;
	private int categoryId;
	private String title;
	private String description;
	private String url;
	private Date timestamp;

	private List<Comment> comments = new ArrayList<Comment>();

	private FacebookProfile user;

	private Category category;

	public Category getCategory() {
		return category;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

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

	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}

	public String toString() {
		return "[id]" + id + "[userId]" + userId + "[categoryId]" + categoryId
				+ "[title]" + title + "[description]" + description + "[url]"
				+ url;

	}

}
