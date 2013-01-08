package com.mesoft.webapp.benimler.om;

public class Category {

	private int detailCategoryId;
	private int mainCategoryId;

	private String detailCategoryName;
	private String mainCategoryName;

	public String getDisplayText() {
		return mainCategoryName + " " + detailCategoryName;
	}

	public int getDetailCategoryId() {
		return detailCategoryId;
	}

	public void setDetailCategoryId(int detailCategoryId) {
		this.detailCategoryId = detailCategoryId;
	}

	public int getMainCategoryId() {
		return mainCategoryId;
	}

	public void setMainCategoryId(int mainCategoryId) {
		this.mainCategoryId = mainCategoryId;
	}

	public String getDetailCategoryName() {
		return detailCategoryName;
	}

	public void setDetailCategoryName(String detailCategoryName) {
		this.detailCategoryName = detailCategoryName;
	}

	public String getMainCategoryName() {
		return mainCategoryName;
	}

	public void setMainCategoryName(String mainCategoryName) {
		this.mainCategoryName = mainCategoryName;
	}

}
