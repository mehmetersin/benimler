package com.mesoft.webapp.benimler.om;

public class Comment {

	private int id;

	private String userId;

	private int benimleId;

	private String text;

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

	public int getBenimleId() {
		return benimleId;
	}

	public void setBenimleId(int benimleId) {
		this.benimleId = benimleId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
