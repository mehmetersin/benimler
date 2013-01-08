package com.mesoft.webapp.benimler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import com.mesoft.webapp.benimler.om.Benimle;
import com.mesoft.webapp.benimler.om.BenimleRM;
import com.mesoft.webapp.benimler.om.Category;
import com.mesoft.webapp.benimler.om.CategoryRM;
import com.mesoft.webapp.benimler.om.Comment;
import com.mesoft.webapp.benimler.om.CommentRM;

public class DbOperations {

	private HashMap<Integer, Category> categoryList = null;

	private JdbcTemplate selectTemplate;

	private SimpleJdbcInsert insertBenimle;

	private SimpleJdbcInsert insertComment;

	public void setBenimlerDs(DataSource benimlerDs) {
		selectTemplate = new JdbcTemplate(benimlerDs);
		insertBenimle = new SimpleJdbcInsert(benimlerDs);
		insertComment = new SimpleJdbcInsert(benimlerDs);

		if (insertBenimle.getTableName() != "benims") {
			insertBenimle.setTableName("benims");
			insertBenimle.setGeneratedKeyName("id");
		}

		if (insertComment.getTableName() != "comments") {
			insertComment.setTableName("comments");
			insertComment.setGeneratedKeyName("id");
		}

	}

	public java.util.List queryBenimler(String text) {
		String sql = "select * from benims where (title like '%" + text
				+ "%' or description like '%" + text + "%' )";

		return (java.util.List) selectTemplate.query(sql, new Object[] {},
				new BenimleRM());
	}

	public java.util.List qetFavoriteBenimler() {
		return (java.util.List) selectTemplate.query("select * from benims",
				new Object[] {}, new BenimleRM());
	}

	public java.util.List qetCommentsByBenimleId(int id) {
		return (java.util.List) selectTemplate.query(
				"select * from comments where benimleId = ?",
				new Object[] { id }, new CommentRM());
	}

	
	
	public HashMap<Integer, Category> getCategoryList() {
		
		if (categoryList == null){
			loadCategoryList();
		}
		
		return categoryList;
	}

	public void setCategoryList(HashMap<Integer, Category> categoryList) {
		this.categoryList = categoryList;
	}

	public List<String> queryCategory(String name) {
		
		
		List<String> matched = new ArrayList<String>();
		for (Entry<Integer, Category> mapEntry : getCategoryList().entrySet()) {
			Integer key = mapEntry.getKey();
			Category value = mapEntry.getValue();
			if (value.getDisplayText().toLowerCase()
					.contains(name.toLowerCase())) {
				matched.add(getCategoryList().get(key).getDisplayText());
			}
		}

		return matched;
	}

	public Category getCategoryById(int id) {
		if (categoryList == null) {
			loadCategoryList();
		}
		return categoryList.get(id);
	}

	public Category getCategoryByDisplayname(String name) {

		for (Entry<Integer, Category> mapEntry : getCategoryList().entrySet()) {
			Category value = mapEntry.getValue();
			if (value.getDisplayText().equals(name)) {
				return mapEntry.getValue();
			}
		}
		Category c = new Category();
		c.setMainCategoryId(28);
		c.setMainCategoryId(5);

		return c;
	}

	public int insertBenimle(Benimle benimle) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		BeanPropertySqlParameterSource namedParameters = new BeanPropertySqlParameterSource(
				benimle);

		keyHolder = insertBenimle.executeAndReturnKeyHolder(namedParameters);
		return keyHolder.getKey().intValue();
	}

	public int insertComment(Comment comment) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		BeanPropertySqlParameterSource namedParameters = new BeanPropertySqlParameterSource(
				comment);

		keyHolder = insertComment.executeAndReturnKeyHolder(namedParameters);
		return keyHolder.getKey().intValue();
	}

	public void loadCategoryList() {
		categoryList = new HashMap<Integer, Category>();

		List list = (java.util.List) selectTemplate
				.query("SELECT d.id as detailCatId,d.name as detailCatName,m.name as mainCatName,m.id as mainCatId FROM detailcategory d,maincategory m where d.mainid=m.id",
						new Object[] {}, new CategoryRM());
		for (int i = 0; i < list.size(); i++) {
			Category c = (Category) list.get(i);
			categoryList.put(c.getDetailCategoryId(), c);

		}

	}

}
